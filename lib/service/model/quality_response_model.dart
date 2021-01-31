import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ornek1/provider/quality_provider.dart';

class QualityResponseModel {
  int httpCode;
  String resultText;
  ResultAnswer result;

  QualityResponseModel._internal({
    @required this.httpCode,
    @required this.result,
    @required this.resultText,
  });

  factory QualityResponseModel._fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    ResultAnswer resultType;
    switch (int.parse(map['result'])) {
      case 1:
        resultType = ResultAnswer.LOW_RISK;
        break;
      case 2:
        resultType = ResultAnswer.MEDIUM_RISK;
        break;
      case 3:
        resultType = ResultAnswer.HIGH_RISK;
        break;
      case 4:
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

  factory QualityResponseModel.fromJsonString(String source) =>
      QualityResponseModel._fromMap(json.decode(source));
}
