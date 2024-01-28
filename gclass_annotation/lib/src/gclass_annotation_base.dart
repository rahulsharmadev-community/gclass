// ignore_for_file: camel_case_types

const gclass = GClass();

class GClass {
  final bool copyCall;
  const GClass({this.copyCall = true});

  factory GClass.fromJson(Map<String, dynamic> json) {
    return GClass(copyCall: json['copyCall'] ?? true);
  }

  Map<String, dynamic> get toJson => {'copyCall': copyCall};
}

abstract class gJson {
  Map<String, String> get jsonKeys => const {};

  bool get fromJson => true;

  bool get toJson => true;
}

abstract class gEquatable {
  bool get equatable => true;

  /// {@template stringify}
  /// Global [stringify] setting for all [Equatable] instances.
  ///
  /// If [stringify] is overridden for a particular [Equatable] instance,
  /// then the local [stringify] value takes precedence
  /// over [EquatableConfig.stringify].
  ///
  /// This value defaults to true in debug mode and false in release mode.
  /// {@endtemplate}
  bool? get stringify => null;
}
