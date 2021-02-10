import 'package:flutter/material.dart';
import 'package:ornek1/service/model/auth_request_model.dart';
import 'package:ornek1/service/model/auth_response_model.dart';
import 'package:ornek1/service/web_service.dart';
import 'package:ornek1/ui/page/auth/login_page/enum/enums.dart';

class AuthProvider with ChangeNotifier {
  /* STATES */
  LoginState loginState = LoginState.INIT;

  /* PROPERTIES */
  String username;
  String password;

  login() async {
    AuthRequestModel reqModel = AuthRequestModel(
      username: username,
      password: password,
    );
    AuthResponseModel resModel;
    resModel = await WebService().login(reqModel);
    if (resModel == null) {
      // TODO hataları düzgün handle et
      loginState = LoginState.SERVICE_ERROR;
    }
    notifyListeners();
  }
}
