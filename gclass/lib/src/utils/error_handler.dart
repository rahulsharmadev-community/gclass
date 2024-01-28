// ignore_for_file: non_constant_identifier_names

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/src/dart/ast/ast.dart';
import 'package:source_gen/source_gen.dart';

class ErrorHandler {
  ErrorHandler._();
  static failing_element([Element? e]) {
    return InvalidGenerationSourceError('@gclass can only be applied on classes. Failing element: ${e?.name}',
        element: e);
  }
}
