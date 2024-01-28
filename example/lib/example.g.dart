// −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
//  GENERATED CODE - DO NOT MODIFY BY HAND
// −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
//

part of 'example.dart';

// **************************************************************************
// GClassGenerator
// **************************************************************************

A _$AfromJson(Map<String, dynamic> json) => A(
      MyAnnotation.fromJson(json["a"]),
      json["a2"] as String,
      json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
      (json["map3"] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>).map((k, v) {
                return MapEntry(k, v as dynamic);
              }))
          .toList(),
      (json["map4"] as Map<int, dynamic>).map((k, v) {
        return MapEntry(k, (v as List<dynamic>?)?.map((e) => e == null ? null : DateTime.parse(e)).toList());
      }),
      (
        json["rec"][r'$1'] as int,
        (json["rec"][r'$2'] as Map<int, dynamic>).map((k, v) {
          return MapEntry(k, v as String);
        }),
      ),
      (
        a: json["rec2"]['a'] as int,
        b: json["rec2"]['b'] as int,
      ),
      (
        json["rec1"][r'$1'] as int,
        b: json["rec1"]['b'] as int,
      ),
      b: (json["b"] as List<dynamic>).map((e) => MyAnnotation.fromJson(e)).toList(),
      map1: (
        (json["map1"][r'$1'] as Map<int, dynamic>).map((k, v) {
          return MapEntry(k, v as String);
        }),
        enums: (json["map1"]['enums'] as List<dynamic>).map((e) => M1.values[e as int]).toSet(),
        listOfmap: (json["map1"]['listOfmap'] as List<dynamic>)
            .map((e) => (e as Map<int, dynamic>).map((k, v) {
                  return MapEntry(k, v as String);
                }))
            .toList(),
      ),
      b2: json["b2"] == null ? null : M1.values[json["b2"] as int],
      b3: (json["b3"] as List<dynamic>).map((e) => M1.values[e as int]).toSet(),
    );

extension on A {
  @override
  A call(
          {MyAnnotation? a,
          String? a2,
          DateTime? dateTime,
          List<Map<String, dynamic>>? map3,
          Map<int, List<DateTime>>? map4,
          (int, Map<int, String>)? rec,
          ({int a, int b})? rec2,
          (int, {int b})? rec1,
          List<MyAnnotation>? b,
          (Map<int, String>, {Set<M1> enums, List<Map<int, String>> listOfmap})? map1,
          M1? b2,
          Set<M1>? b3}) =>
      A(
        a ?? this.a,
        a2 ?? this.a2,
        dateTime ?? this.dateTime,
        map3 ?? this.map3,
        map4 ?? this.map4,
        rec ?? this.rec,
        rec2 ?? this.rec2,
        rec1 ?? this.rec1,
        b: b ?? this.b,
        map1: map1 ?? this.map1,
        b2: b2 ?? this.b2,
        b3: b3 ?? this.b3,
      );

  Map<String, dynamic> get toJson => {
        "a": a.toJson,
        "a2": a2,
        "dateTime": dateTime?.toIso8601String(),
        "map3": map3
            .map((e) => e.map((k, v) {
                  return MapEntry(k, v);
                }))
            .toList(),
        "map4": map4.map((k, v) {
          return MapEntry(k, v?.map((e) => e?.toIso8601String()).toList());
        }),
        "rec": {
          r'$1': rec.$1,
          r'$2': rec.$2.map((k, v) {
            return MapEntry(k, v);
          }),
        },
        "rec2": {
          'a': rec2.a,
          'b': rec2.b,
        },
        "rec1": {
          r'$1': rec1.$1,
          'b': rec1.b,
        },
        "b": b.map((e) => e.toJson).toList(),
        "map1": {
          r'$1': map1.$1.map((k, v) {
            return MapEntry(k, v);
          }),
          'enums': map1.enums.map((e) => e.index).toList(),
          'listOfmap': map1.listOfmap
              .map((e) => e.map((k, v) {
                    return MapEntry(k, v);
                  }))
              .toList(),
        },
        "b2": b2?.index,
        "b3": b3.map((e) => e.index).toList()
      };
}

MyAnnotation _$MyAnnotationfromJson(Map<String, dynamic> json) => MyAnnotation(
      id: json["id"] as int,
      address: json["address"] as String,
      isOpen: json["isOpen"] as bool,
    );

extension on MyAnnotation {
  @override
  MyAnnotation call({int? id, String? address, bool? isOpen}) => MyAnnotation(
        id: id ?? this.id,
        address: address ?? this.address,
        isOpen: isOpen ?? this.isOpen,
      );

  Map<String, dynamic> get toJson => {"id": id, "address": address, "isOpen": isOpen};
}
