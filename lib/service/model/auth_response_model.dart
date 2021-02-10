import 'dart:convert';

class AuthResponseModel {
  String refresh;
  String access;
  AuthResponseModel({
    this.refresh,
    this.access,
  });

  Map<String, dynamic> toMap() {
    return {
      'refresh': refresh,
      'access': access,
    };
  }

  factory AuthResponseModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AuthResponseModel(
      refresh: map['refresh'],
      access: map['access'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromJson(String source) =>
      AuthResponseModel.fromMap(json.decode(source));
}
