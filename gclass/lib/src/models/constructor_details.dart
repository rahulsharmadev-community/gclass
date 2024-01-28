import 'package:analyzer/dart/element/type.dart' as analyzer;
import 'parameter.dart';

class ConstructorDetails {
  final analyzer.DartType type;
  final String name;
  final bool isConst;
  final bool isDefaultConstructor;
  final bool isMainConstructor;
  final bool isAbstract;
  final Set<Parameter> parameters;

  const ConstructorDetails({
    required this.name,
    required this.type,
    required this.isConst,
    required this.isAbstract,
    required this.isMainConstructor,
    required this.parameters,
    required this.isDefaultConstructor,
  });

  @override
  String toString() => '''ConstructorDetails({
    name: $name,
    type: $type,
    isConst: $isConst,
    isMainConstructor: $isMainConstructor,
    isAbstract: $isAbstract,
    parameters: $parameters,
    isDefaultConstructor: $isDefaultConstructor,
  })''';
}
