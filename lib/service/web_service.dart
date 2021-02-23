import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart';
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

  // Properties
  final String url = "http://abdullahcangul3.pythonanywhere.com";

  // Methods
  Future<QualityResponseModel> getQuality(
    QualityRequestModel reqModel,
    UserModel userModel,
  ) async {
    QualityResponseModel resModel;

    // Real Response
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      HttpHeaders.acceptHeader: 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: 'Bearer ${userModel.access}',
    };
    Response response = await http.post(
      url + '/quality_check/',
      headers: headers,
      body: reqModel.toJsonString(),
    );

    switch (response.statusCode) {
      case 200:
        resModel =
            QualityResponseModel.success(utf8.decode(response.bodyBytes));
        // gelen body byte ları utf8 için decode edilir
        break;
      case 401:
      case 404:
        resModel = QualityResponseModel.authExpired();
        break;
      case 500:
        resModel = QualityResponseModel.serviceError();
        break;
      default:
    }

    return resModel;
  }

  Future<AuthResponseModel> login(AuthRequestModel reqModel) async {
    AuthResponseModel resModel;
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    Response response = await http.post(
      url + '/auth/token/',
      headers: headers,
      body: reqModel.toJson(),
    );

    switch (response.statusCode) {
      case 200:
        resModel = AuthResponseModel.success(response.body);
        break;
      case 401:
        resModel = AuthResponseModel.wrongPassword();
        break;
      case 500:
        resModel = AuthResponseModel.serviceError();
        break;
      default:
    }

    return resModel;
  }
}
