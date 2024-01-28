// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'pp.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// Person _$PersonFromJson(Map<String, dynamic> json) => Person(
//       rec2: _$recordConvert(
//         json['rec2'],
//         ($jsonValue) => (
//           a: $jsonValue['a'] as int,
//           b: $jsonValue['b'] as int,
//         ),
//       ),
//       rec: _$recordConvert(
//         json['rec'],
//         ($jsonValue) => (
//           $jsonValue[r'$1'] as int,
//           $jsonValue[r'$2'] as int,
//         ),
//       ),
//       uri: Uri.parse(json['uri'] as String),
//       nuri: json['nuri'] == null ? null : Uri.parse(json['nuri'] as String),
//       pDuration: json['pDuration'] == null ? null : Duration(microseconds: json['pDuration'] as int),
//       pInt: json['pInt'] as int,
//       pIntN: json['pIntN'] as int?,
//       firstName: json['firstName'] as String,
//       lastName: json['lastName'] as String?,
//       dateOfBirth: json['dateOfBirth'] == null ? null : DateTime.parse(json['dateOfBirth'] as String),
//       listString: (json['listString'] as List<dynamic>).map((e) => e as String).toList(),
//       listDouble: (json['listDouble'] as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
//       setString: (json['setString'] as List<dynamic>).map((e) => e as String).toSet(),
//       setDouble: (json['setDouble'] as List<dynamic>).map((e) => (e as num).toDouble()).toSet(),
//       setDateOfBirth: (json['setDateOfBirth'] as List<dynamic>)
//           .map((e) => e == null ? null : DateTime.parse(e as String))
//           .toSet(),
//       map1: (json['map1'] as Map<String, dynamic>).map(
//         (k, e) => MapEntry(int.parse(k), (e as num).toDouble()),
//       ),
//       map2: json['map2'] as Map<String, dynamic>,
//       map3: (json['map3'] as List<dynamic>).map((e) => e as Map<String, dynamic>).toList(),
//       map4: (json['map4'] as Map<String, dynamic>).map(
//         (k, e) => MapEntry(DateTime.parse(k), (e as List<dynamic>).map((e) => e as String).toList()),
//       ),
//       iterableString: (json['iterableString'] as List<dynamic>?)?.map((e) => e as String),
//       iterableDouble: (json['iterableDouble'] as List<dynamic>).map((e) => (e as num?)?.toDouble()),
//     );

// Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
//       'uri': instance.uri.toString(),
//       'nuri': instance.nuri?.toString(),
//       'firstName': instance.firstName,
//       'lastName': instance.lastName,
//       'pInt': instance.pInt,
//       'pIntN': instance.pIntN,
//       'pDuration': instance.pDuration?.inMicroseconds,
//       'listString': instance.listString,
//       'listDouble': instance.listDouble,
//       'iterableString': instance.iterableString?.toList(),
//       'iterableDouble': instance.iterableDouble.toList(),
//       'setString': instance.setString.toList(),
//       'setDouble': instance.setDouble.toList(),
//       'setDateOfBirth': instance.setDateOfBirth.map((e) => e?.toIso8601String()).toList(),
//       'rec': {
//         r'$1': instance.rec.$1,
//         r'$2': instance.rec.$2,
//       },
//       'rec2': {
//         'a': instance.rec2.a,
//         'b': instance.rec2.b,
//       },
//       'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
//       'map1': instance.map1.map((k, e) => MapEntry(k.toString(), e)),
//       'map2': instance.map2,
//       'map3': instance.map3,
//       'map4': instance.map4.map((k, e) => MapEntry(k.toIso8601String(), e)),
//     };

// $Rec _$recordConvert<$Rec>(
//   Object? value,
//   $Rec Function(Map) convert,
// ) =>
//     convert(value as Map<String, dynamic>);
