import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart' as analyzer;
import 'package:gclass/gbuilder.dart';
import 'package:source_gen/source_gen.dart';
import 'datatype.dart';
import 'extension.dart';

class DateTypeConverter {
  final analyzer.DartType type;
  final String variableName;
  final bool isNullable;
  late DataType dataType;
  DateTypeConverter({
    required this.type,
    required this.variableName,
    required this.isNullable,
  }) {
    String first2 = type.getName.split('<').first;
    dataType = _recursiveFunction(first2, type, variableName, isNullable);
  }

  DataType _recursiveFunction(
    String first2,
    analyzer.DartType type,
    String variableName,
    bool isNullable,
  ) {
    if (type is analyzer.RecordType) {
      var ls = <({DataType type, bool isPositional})>[];
      for (var i = 0; i < type.positionalFields.length; i++) {
        var t = type.positionalFields[i].type;
        ls.add((
          type: _recursiveFunction(t.getName, t, "\$${i + 1}", t.isNullable),
          isPositional: true,
        ));
      }
      for (var b in type.namedFields) {
        ls.add((
          type: _recursiveFunction(b.type.getName, b.type, b.name, b.type.isNullable),
          isPositional: false
        ));
      }
      return RecordDataType(fields: ls, variableName: variableName, isNullable: type.isNullable);
    }
    if (type is analyzer.DynamicType || DartOtherDataType.check(type.getName)) {
      return DartOtherDataType(
          dataType: type.getName, isNullable: type.isNullable, variableName: variableName);
    } else if (type is analyzer.InterfaceType) {
      if (PrimitiveDataType.check(first2)) {
        return PrimitiveDataType(
          primitiveType: type.getName,
          variableName: variableName,
          isNullable: isNullable,
        );
      } else if (type.isEnum) {
        return EnumDataType(
          enumName: type.getName,
          variableName: variableName,
          isNullable: isNullable,
        );
      } else if (type.element.metadata.isNotEmpty &&
          (type.element.metadata.first.element?.library?.identifier ?? "") ==
              "package:gclass_annotation/src/gclass_annotation_base.dart") {
        return DefaultDataType(
          variableName: variableName,
          isNullable: isNullable,
          variableType: type.getName,
        );
      } else if (type.typeArguments.length == 1 && IterableDataType.check(type.getName)) {
        var valueType = type.typeArguments[0];
        var value = _recursiveFunction(
          valueType.getName,
          valueType,
          variableName,
          valueType.isNullable,
        );
        return IterableDataType(
          collectionType: first2,
          fromJsonValue: (e) => value.fromJson(e),
          toJsonValue: (e) => value.toJson(e),
          variableName: variableName,
          isNullable: type.isNullable,
        );
      } else if (type.typeArguments.length == 2 && MapDataType.check(type.getName)) {
        var key = type.typeArguments[0];
        var valueType = type.typeArguments[1];
        var value = _recursiveFunction(
          valueType.getName,
          valueType,
          variableName,
          valueType.isNullable,
        );
        return MapDataType(
          key: key.getName,
          fromJsonValue: (e) => value.fromJson(e),
          toJsonValue: (e) => value.toJson(e),
          isNullable: isNullable,
          isValueNullable: value.isNullable,
          variableName: variableName,
        );
      }
    }

    throw '''
      $variableName, $first2
      1st ${PrimitiveDataType.check(first2)}
      2nd ${type.isEnum}
      3rd ${IterableDataType.check(type.getName)}
      3rd ${MapDataType.check(type.getName)}
      ''';
  }

  String fromJson() => dataType.fromJson();

  String toJson() => dataType.toJson();
}
