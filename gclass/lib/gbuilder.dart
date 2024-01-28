/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'package:build/build.dart';
import 'package:gclass/src/gclass_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:gclass_annotation/gclass_annotation.dart';

export 'package:gclass_annotation/gclass_annotation.dart';

/// Builds generators for `build_runner` to run
Builder gbuilder(BuilderOptions options) {
  final generators = [GClassGenerator(GClass.fromJson(options.config))];

  return PartBuilder(
    generators,
    '.g.dart',
    header: '''
// −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
//  GENERATED CODE - DO NOT MODIFY BY HAND
// −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
// ''',
    options: options,
  );
}
