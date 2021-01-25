import 'package:flutter/material.dart';

enum DeviceType { SMALL, MEDIUM, LARGE, BIGEST }

mixin Responsive {
  DeviceType _deviceType;
  set deviceType(double shortestSide) {
    _deviceType = (shortestSide <= 350)
        ? DeviceType.SMALL
        : (shortestSide <= 450)
            ? DeviceType.MEDIUM
            : (shortestSide <= 550)
                ? DeviceType.LARGE
                : DeviceType.BIGEST;
  }

  T fit<T>(T small, T medium, T large, T bigest) {
    switch (_deviceType) {
      case DeviceType.SMALL:
        return small;
      case DeviceType.MEDIUM:
        return medium;
      case DeviceType.LARGE:
        return large;
      case DeviceType.BIGEST:
        return bigest;
      default:
    }
  }
}
