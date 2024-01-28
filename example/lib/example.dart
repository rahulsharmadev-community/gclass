// ignore_for_file: depend_on_referenced_packages

import 'package:gclass/gbuilder.dart';
part 'example.g.dart';

abstract class NewImpl<String, Object> {
  int immn = 3;
  int get immn2 => 3;
}

@gclass
class A {
  final MyAnnotation a;
  final List<MyAnnotation> b;
  final String? a2;
  final DateTime? dateTime;

  final (int, Map<int, String>) rec;

  final (int a, {int b}) rec1;
  final ({int a, int b}) rec2;

  final Set<M1> b3;
  final (Map<int, String> map, {Set<M1> enums, List<Map<int, String>> listOfmap}) map1;
  final M1? b2;
  final List<Map<String, dynamic>> map3;
  final Map<int, List<DateTime?>?> map4;

  static A fromJson(Map<String, dynamic> json) => _$AfromJson(json);

  const A(
    this.a,
    this.a2,
    this.dateTime,
    this.map3,
    this.map4,
    this.rec,
    this.rec2,
    this.rec1, {
    required this.b,
    required this.map1,
    this.b2,
    required this.b3,
  });
}

class Ext {
  const Ext();
}

enum M1 { aaa1, aaa2 }

mixin M2 {}

mixin Z1 {}
mixin Z2 {}

@gclass
class MyAnnotation {
  final int id;
  final String address;
  final bool isOpen;

  static MyAnnotation fromJson(Map<String, dynamic> json) => _$MyAnnotationfromJson(json);
  MyAnnotation({
    required this.id,
    required this.address,
    required this.isOpen,
  });
}
