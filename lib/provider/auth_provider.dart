import 'package:flutter/material.dart';
import 'package:ornek1/model/user_model.dart';
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

  UserModel userModel;

  login() async {
    loginState = LoginState.LOADING;
    notifyListeners();
    AuthRequestModel reqModel = AuthRequestModel(
      username: username,
      password: password,
    );

    AuthResponseModel resModel;
    resModel = await WebService().login(reqModel);

    if (resModel.loginState == LoginState.DONE) {
      userModel = UserModel(
        username: reqModel.username,
        password: reqModel.password,
        access: resModel.access,
        refresh: resModel.refresh,
      );
    }
    loginState = resModel.loginState;
    notifyListeners();
  }

  again() {
    loginState = LoginState.INIT;
    notifyListeners();
  }
}
