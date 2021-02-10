import 'dart:convert';

class AuthRequestModel {
  String username;
  String password;
  AuthRequestModel({
    this.username,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory AuthRequestModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AuthRequestModel(
      username: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthRequestModel.fromJson(String source) =>
      AuthRequestModel.fromMap(json.decode(source));
}
