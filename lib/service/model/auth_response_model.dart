import 'dart:convert';

import 'package:ornek1/ui/page/auth/login_page/enum/enums.dart';

class AuthResponseModel {
  LoginState loginState = LoginState.INIT;
  String refresh;
  String access;

  AuthResponseModel._internal({
    this.loginState,
    this.refresh,
    this.access,
  });
  AuthResponseModel._empty();

  Map<String, dynamic> toMap() {
    return {
      'refresh': refresh,
      'access': access,
    };
  }

  String toJson() => json.encode(toMap());

  /* Private Constructors */
  factory AuthResponseModel._fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AuthResponseModel._internal(
      refresh: map['refresh'],
      access: map['access'],
    );
  }
  factory AuthResponseModel._fromJson(String source) =>
      AuthResponseModel._fromMap(json.decode(source));

  /* Public Constructors */
  factory AuthResponseModel.success(String source) {
    AuthResponseModel arm = AuthResponseModel._fromJson(source);
    arm.loginState = LoginState.DONE;
    return arm;
  }
  factory AuthResponseModel.wrongPassword() {
    AuthResponseModel arm = AuthResponseModel._empty();
    arm.loginState = LoginState.WRONG_PASSWORD;
    return arm;
  }
  factory AuthResponseModel.serviceError() {
    AuthResponseModel arm = AuthResponseModel._empty();
    arm.loginState = LoginState.SERVICE_ERROR;
    return arm;
  }
}
