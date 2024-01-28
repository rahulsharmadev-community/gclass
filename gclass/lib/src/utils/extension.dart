import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart' as analyzer;
import '../models.dart';

extension ExtParameterElement on ParameterElement {
  Parameter get toParameter => Parameter(
      name: name,
      type: type,
      isLate: isLate,
      isStatic: isStatic,
      isFinal: isFinal,
      isConst: isConst,
      isRequired: isRequired,
      isOptional: isOptional,
      isPositional: isPositional,
      documentationComment: documentationComment,
      isNullable: type.nullabilitySuffix == NullabilitySuffix.question,
      defaultValueCode: defaultValueCode);
}

extension ExtInterfaceType on analyzer.DartType {
  bool get isNullable => nullabilitySuffix == NullabilitySuffix.question;

  String get getName => getDisplayString(withNullability: false);

  bool get isEnum => (this is analyzer.InterfaceType)
      ? (this as analyzer.InterfaceType).element.kind.toString() == 'ENUM'
      : false;
}
