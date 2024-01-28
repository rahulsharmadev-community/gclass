abstract class DataType {
  final bool isNullable;
  final String variableName;
  const DataType({
    required this.variableName,
    required this.isNullable,
  });
  String fromJson([String? key]);
  String toJson([String? key]);

  String get nullmark => isNullable ? '?' : '';

  String nameForToJson([String? key]) => key ?? variableName;

  String nameForFromJson([String? key]) => key ?? 'json["$variableName"]';
}

class DefaultDataType extends DataType {
  final String variableType;
  DefaultDataType({
    required super.variableName,
    required super.isNullable,
    required this.variableType,
  });
  @override
  String fromJson([String? key]) => isNullable
      ? '${nameForFromJson(key)} == null ? null: $variableType.fromJson(${nameForFromJson(key)})'
      : '$variableType.fromJson(${nameForFromJson(key)})';

  @override
  String toJson([String? key]) => "${nameForToJson(key)}$nullmark.toJson";
}

class EnumDataType extends DataType {
  final String enumName;

  EnumDataType({required this.enumName, required super.variableName, required super.isNullable});

  @override
  String fromJson([String? key]) {
    var s = '$enumName.values[${nameForFromJson(key)} as int]';
    return isNullable ? '${nameForFromJson(key)} == null ? null: $s' : s;
  }

  @override
  String toJson([String? key]) => '${nameForToJson(key)}$nullmark.index';
}

class PrimitiveDataType extends DataType {
  final String primitiveType;

  PrimitiveDataType({
    required this.primitiveType,
    required super.variableName,
    required super.isNullable,
  });

  @override
  String fromJson([String? key]) {
    return '${nameForFromJson(key)} as $primitiveType';
  }

  @override
  String toJson([String? key]) => key ?? variableName;

  static bool check(String str) {
    return str == 'bool' || str == 'int' || str == 'double' || str == 'num' || str == 'String';
  }
}

///  List, Iterable, Set
class IterableDataType extends DataType {
  final String collectionType;

  final String Function(String name) fromJsonValue;
  final String Function(String name) toJsonValue;

  IterableDataType({
    required this.collectionType,
    required this.fromJsonValue,
    required this.toJsonValue,
    required super.variableName,
    required super.isNullable,
  });

  String get endstr => collectionType.startsWith('Set') ? '.toSet()' : '.toList()';
  @override
  String fromJson([String? key]) {
    return '(${nameForFromJson(key)} as List<dynamic>$nullmark)$nullmark.map((e) => ${fromJsonValue('e')})$endstr';
  }

  @override
  String toJson([String? key]) {
    return '${nameForToJson(key)}$nullmark.map((e)=>${toJsonValue('e')}).toList()';
  }

  static bool check(String str) {
    return str.startsWith(RegExp(r'List<|Iterable<|Set<'));
  }
}

class MapDataType extends DataType {
  final String key;
  final String Function(String name) fromJsonValue;
  final String Function(String name) toJsonValue;
  final bool isValueNullable;

  MapDataType({
    required this.key,
    required this.fromJsonValue,
    required this.toJsonValue,
    required super.variableName,
    required super.isNullable,
    required this.isValueNullable,
  });

  @override
  String fromJson([String? key]) {
    if (this.key != 'String' && this.key != 'int') {
      throw "${this.key} INVALID\n`key` of `${nameForToJson(key)}` should be an `String or int`";
    }

    return """(${nameForFromJson(key)} as Map<${this.key}, dynamic>).map((k, v) {
      return MapEntry(k, ${fromJsonValue('v')});
    })""";
  }

  @override
  String toJson([String? key]) {
    return '''${nameForToJson(key)}$nullmark.map((k, v) {
          return MapEntry(k, ${toJsonValue('v')});
        })''';
  }

  static bool check(String str) {
    return str.startsWith(RegExp(r'Map<'));
  }
}

class RecordDataType extends DataType {
  final List<({DataType type, bool isPositional})> fields;

  RecordDataType({
    required this.fields,
    required super.variableName,
    required super.isNullable,
  });

  @override
  String fromJson([String? key]) {
    var buffer = StringBuffer();
    for (var e in fields) {
      var str = !e.isPositional ? '${e.type.variableName} : ' : '';
      var vname = !e.isPositional ? "'${e.type.variableName}'" : "r'${e.type.variableName}'";
      buffer.write("$str${e.type.fromJson("${nameForFromJson()}[$vname]")},");
    }
    return "($buffer)";
  }

  @override
  String toJson([String? key]) {
    var buffer = StringBuffer();
    for (var e in fields) {
      var vname = !e.isPositional ? "'${e.type.variableName}'" : "r'${e.type.variableName}'";
      buffer.write("$vname : $variableName.${e.type.toJson()},");
    }

    return "{$buffer}";
  }
}

class DartOtherDataType extends DataType {
  final String dataType;
  DartOtherDataType({
    required this.dataType,
    required super.variableName,
    required super.isNullable,
  });

  @override
  String fromJson([String? key]) {
    var k = nameForFromJson(key);
    var before = isNullable ? '$k == null ? null :' : '';
    switch (dataType) {
      case 'dynamic':
        return '$k as dynamic';
      case 'DateTime':
        return '$before DateTime.parse($k)';
      case 'Duration':
        return '$before Duration(microseconds: $k),';
      case 'BigInt':
        return '$before BigInt.parse($k),';
      case 'Uri':
        return '$before Uri.parse($k),';
    }

    throw 'Unknown Error';
  }

  @override
  String toJson([String? key]) {
    var k = nameForToJson(key);
    switch (dataType) {
      case 'dynamic':
        return key ?? variableName;
      case 'DateTime':
        return '$k$nullmark.toIso8601String()';
      case 'Duration':
        return '$k$nullmark.inMicroseconds';
      case 'BigInt':
        return '$k$nullmark.toString()';
      case 'Uri':
        return '$k$nullmark.toString()';
    }
    throw 'Unknown Error';
  }

  static bool check(String str) {
    return str.startsWith(RegExp(r'dynamic|DateTime|Duration|BigInt'));
  }
}
