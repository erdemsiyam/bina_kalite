import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ornek1/ui/constants/colors.dart';

final TextTheme textTheme = TextTheme(
  headline1: TextStyle(
    // Başlık
    fontFamily: 'OpenSans',
    color: colorDark,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  ),
  subtitle1: TextStyle(
    // Alt Başlık
    fontFamily: 'OpenSans',
    color: colorUnFocus,
    fontSize: 14,
  ),
  headline2: TextStyle(
    // Input Aktif
    fontFamily: 'OpenSans',
    fontSize: 14,
    color: colorPrimary,
    // fontWeight: FontWeight.bold,
  ),
  headline3: TextStyle(
    // Input Deaktif
    fontFamily: 'OpenSans',
    fontSize: 14,
    color: colorDark,
    // fontWeight: FontWeight.bold,
  ),
  button: TextStyle(
    // Buton
    fontFamily: 'OpenSans',
    fontSize: 16,
    color: colorLight,
    fontWeight: FontWeight.bold,
    // fontWeight: FontWeight.bold,
  ),
);
final ThemeData lightTheme = ThemeData(
  textTheme: textTheme,
  primaryColor: colorPrimary,
  accentColor: colorAccent,
  disabledColor: colorUnFocus,
);
