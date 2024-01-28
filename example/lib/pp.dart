// import 'package:json_annotation/json_annotation.dart';

// part 'pp.g.dart';

// @JsonSerializable()
// class Person {
//   final Uri uri;
//   final Uri? nuri;

//   final String firstName;
//   final String? lastName;

//   final int pInt;
//   final int? pIntN;

//   final Duration? pDuration;

//   final List<String> listString;
//   final List<double> listDouble;

//   final Iterable<String>? iterableString;
//   final Iterable<double?> iterableDouble;

//   final Set<String> setString;
//   final Set<double> setDouble;
//   final Set<DateTime?> setDateOfBirth;
//   final (int a, int b) rec;
//   final ({int a, int b}) rec2;

//   final DateTime? dateOfBirth;

//   final Map<int, double> map1;
//   final Map<String, dynamic> map2;
//   final List<Map<String, dynamic>> map3;
//   final Map<DateTime, List<String>> map4;

//   Person({
//     required this.rec2,
//     required this.rec,
//     required this.uri,
//     required this.nuri,
//     required this.pDuration,
//     required this.pInt,
//     required this.pIntN,
//     required this.firstName,
//     required this.lastName,
//     required this.dateOfBirth,
//     required this.listString,
//     required this.listDouble,
//     required this.setString,
//     required this.setDouble,
//     required this.setDateOfBirth,
//     required this.map1,
//     required this.map2,
//     required this.map3,
//     required this.map4,
//     required this.iterableString,
//     required this.iterableDouble,
//   });

//   factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

//   Map<String, dynamic> toJson() => _$PersonToJson(this);
// }
