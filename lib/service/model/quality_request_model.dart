import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:ornek1/provider/quality_provider.dart';

class QualityRequestModel {
  LatLng location;
  int age;
  int floors;
  int height;
  CorrosionAnswer corrosion;
  int area;
  ShopAnswer shop;
  ContiguousAnswer contiguous;
  QualityRequestModel({
    @required this.location,
    @required this.age,
    @required this.floors,
    @required this.height,
    @required this.corrosion,
    @required this.area,
    @required this.shop,
    @required this.contiguous,
  });

  Map<String, dynamic> _toMap() {
    return {
      'location': "(${location.latitude},${location.longitude})",
      'age': age,
      'floors': floors,
      'height': height,
      'corrosion': corrosion == CorrosionAnswer.YES,
      'area': area,
      'shop': shop == ShopAnswer.YES,
      'contiguous': contiguous == ContiguousAnswer.YES,
    };
  }

  String toJsonString() => json.encode(_toMap());
}
