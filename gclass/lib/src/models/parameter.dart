import 'package:analyzer/dart/element/type.dart' as analyzer;

class Parameter {
  final analyzer.DartType type;
  final bool isFinal;
  final bool isPositional;
  final bool isNullable;
  final bool isStatic;
  final bool isLate;
  final bool isConst;
  final String name;
  final String? documentationComment;
  final String? defaultValueCode;
  final bool isRequired;
  final bool isOptional;

  Parameter({
    required this.type,
    required this.isPositional,
    required this.isFinal,
    required this.isNullable,
    required this.isConst,
    required this.isLate,
    required this.isStatic,
    required this.name,
    required this.isOptional,
    required this.isRequired,
    this.documentationComment,
    this.defaultValueCode,
  });

  String get _final => isFinal ? 'final' : '';
  String get _nullmark => isNullable ? '?' : '';

  String get _late => isLate ? 'late' : '';

  String get toVariableString => '$_late $_final $type$_nullmark $name';

  String get thisName => 'this.$name';

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Parameter && other.type == type && other.name == name;
  }

  @override
  String toString() => '''
  Parameter(
    name: $name,
    type: $type,
    isConst: $isConst,
    isNullable: $isNullable,
    isFinal: $isFinal,
    isLate: $isLate,
    isStatic: $isStatic,
    isPositional: $isPositional,
    isRequired: $isRequired,
    isOptional: $isOptional,
    defaultValueCode: $defaultValueCode,
    documentationComment: $documentationComment
  )''';
}
