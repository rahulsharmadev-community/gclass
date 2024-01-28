// ignore_for_file: unused_field, avoid_renaming_method_parameters

import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'models.dart';

import 'package:gclass/src/utils/error_handler.dart';
import 'package:gclass/src/utils/extension_generator.dart';
import 'package:gclass_annotation/gclass_annotation.dart';
import 'package:source_gen/source_gen.dart';
import 'utils/extension.dart';

class GClassGenerator extends GeneratorForAnnotation<GClass> {
  final GClass _gClassAnnotation;
  const GClassGenerator(this._gClassAnnotation);

  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    if (element is! ClassElement && element is! EnumElement) {
      throw ErrorHandler.failing_element(element);
    }

    final inspector = ClassInspector();
    element.visitChildren(inspector);
    ConstructorDetails mainConstructor = inspector.constructorDetails.firstWhere((e) {
      return e.isMainConstructor;
    });

    var template = CodeGenerator(mainConstructor);

    StringBuffer classBuffer = StringBuffer();

    classBuffer.writeln(template.buildExtenstion());

    // classBuffer.writeln("*************************");
    // classBuffer.writeln(inspector.constructorDetails.toString());

    // classBuffer.writeln("*************************");

    return classBuffer.toString();
  }
}

class ClassInspector extends SimpleElementVisitor {
  Set<ConstructorDetails> constructorDetails = {};
  Set<String> str = {};

  @override
  visitConstructorElement(ConstructorElement constructor) {
    var parameters = constructor.parameters.map((e) => e.toParameter).toSet();
    constructorDetails.add(ConstructorDetails(
      type: constructor.type.returnType as InterfaceType,
      name: constructor.name,
      isConst: constructor.isConst,
      isAbstract: constructor.isAbstract,
      parameters: parameters,
      isDefaultConstructor: constructor.isDefaultConstructor,
      isMainConstructor: constructor.name.isEmpty,
    ));
  }
}
