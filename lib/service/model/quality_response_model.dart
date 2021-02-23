import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/enums.dart';

class QualityResponseModel {
  ResultState resultState = ResultState.INIT;
  int httpCode;
  String resultText;
  ResultAnswer result;

  QualityResponseModel._internal({
    @required this.httpCode,
    @required this.result,
    @required this.resultText,
  });
  QualityResponseModel._empty();

  /* Private Constructors */
  factory QualityResponseModel._fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ResultAnswer resultType;
    switch (map['result']) {
      case "LOW_RISK":
        resultType = ResultAnswer.LOW_RISK;
        break;
      case "MEDIUM_RISK":
        resultType = ResultAnswer.MEDIUM_RISK;
        break;
      case "HIGH_RISK":
        resultType = ResultAnswer.HIGH_RISK;
        break;
      case "VERY_HIGH_RISK":
        resultType = ResultAnswer.VERY_HIGH_RISK;
        break;
      default:
        resultType = ResultAnswer.INIT;
    }

    return QualityResponseModel._internal(
      httpCode: map['httpCode'],
      resultText: map['resultText'],
      result: resultType,
    );
  }
  factory QualityResponseModel._fromJson(String source) =>
      QualityResponseModel._fromMap(json.decode(source));

  /* Public Constructors */
  factory QualityResponseModel.success(String source) {
    QualityResponseModel qrm = QualityResponseModel._fromJson(source);
    qrm.resultState = ResultState.DONE;
    return qrm;
  }
  factory QualityResponseModel.authExpired() {
    QualityResponseModel qrm = QualityResponseModel._empty();
    qrm.resultState = ResultState.AUTH_EXPIRED;
    return qrm;
  }
  factory QualityResponseModel.serviceError() {
    QualityResponseModel qrm = QualityResponseModel._empty();
    qrm.resultState = ResultState.SERVICE_ERROR;
    return qrm;
  }
}
