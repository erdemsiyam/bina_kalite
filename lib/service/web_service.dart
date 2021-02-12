import 'dart:io';

import 'package:ornek1/model/user_model.dart';
import 'package:ornek1/service/model/auth_request_model.dart';
import 'package:ornek1/service/model/auth_response_model.dart';
import 'package:ornek1/service/model/quality_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:ornek1/service/model/quality_response_model.dart';

class WebService {
  // Singleton
  WebService._internal();
  static WebService _webService;
  factory WebService() {
    if (_webService == null) _webService = WebService._internal();
    return _webService;
  }

  // Models
  UserModel userModel;

  // Properties
  final String url = "http://10.0.2.2:8000/";
  final String url2 =
      "http://abdullahcangul2.pythonanywhere.com/auth/api/v1/token/";

  // Methods
  Future<QualityResponseModel> getQuality(QualityRequestModel reqModel) async {
    QualityResponseModel resModel;

    // Real Response
    // final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    // await http
    //     .post(
    //   url,
    //   headers: headers,
    //   body: reqModel.toJsonString(),
    // )
    //     .then((value) {
    //   resModel = QualityResponseModel.fromJsonString(value.body);
    // });

    // Fake Response
    resModel = QualityResponseModel.fromJsonString(
        '{"httpCode":200,"resultText":"Şu kadar ağırlık düşüyor","result":3}');
    await Future.delayed(Duration(seconds: 2));

    return resModel;
  }

  Future<AuthResponseModel> login(AuthRequestModel reqModel) async {
    AuthResponseModel resModel;
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    await http
        .post(
      url2,
      headers: headers,
      body: reqModel.toJson(),
    )
        .then(
      (value) {
        resModel = AuthResponseModel.fromJson(value.body);
      },
    );
    if (resModel.access == null || resModel.refresh == null) {
      return null;
    }

    userModel = UserModel(
      username: reqModel.username,
      password: reqModel.password,
      access: resModel.access,
      refresh: resModel.refresh,
    );
    return resModel;
  }
}
