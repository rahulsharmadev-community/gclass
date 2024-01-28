// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_function_literals_in_foreach_calls

import 'extension.dart';
import 'datetype_converter.dart';
import '../models.dart';

class CodeGenerator {
  final ConstructorDetails _cd;
  const CodeGenerator(ConstructorDetails constructorDetails) : _cd = constructorDetails;

  String buildExtenstion({String name = ''}) {
    String className = _cd.type.getName;

    return '''
  

     ${buildFromJson()}
     extension $name on $className{
     ${buildCall()}

     ${buildToJson()}

    }
''';
  }

  String buildToJson() {
    String className = _cd.type.getName;
    Map<String, String> map = {};
    for (var p in _cd.parameters) {
      var name = p.name;
      var convert = DateTypeConverter(
        variableName: name,
        type: p.type,
        isNullable: p.isNullable,
      );
      map.addAll({"\"$name\"": convert.toJson()});
    }
    return '''Map<String, dynamic> get toJson => $map;
  ''';
  }

  String buildFromJson() {
    String className = _cd.type.getName;
    StringBuffer classArg = StringBuffer();
    bool openB = false;
    for (var p in _cd.parameters) {
      var name = p.name;
      var comma = _cd.parameters.last != p ? ', ' : '';
      var convert = DateTypeConverter(
        variableName: name,
        type: p.type,
        isNullable: p.isNullable,
      );
      if (p.isPositional) {
        classArg.write('${convert.fromJson()}$comma');
      } else {
        if (!openB) {
          openB = true;
        }
        classArg.write('$name: ${convert.fromJson()}$comma');
      }
    }

    return '''$className _\$${className}fromJson(Map<String, dynamic> json) => $className($classArg,);
  ''';
  }

  String buildCall() {
    String className = _cd.type.getName;
    Set<String> params = _cd.parameters.map((e) => '${e.type.getName}? ${e.name}').toSet();
    StringBuffer classArg = StringBuffer();

    bool openB = false;
    for (var p in _cd.parameters) {
      var comma = _cd.parameters.last != p ? ', ' : '';
      var name = p.name;
      if (p.isPositional) {
        classArg.write('$name ?? this.$name$comma');
      } else {
        if (!openB) {
          openB = true;
        }
        classArg.write('$name: $name ?? this.$name$comma');
      }
    }

    return '''@override
    $className call($params) => $className($classArg,);
  ''';
  }
}
