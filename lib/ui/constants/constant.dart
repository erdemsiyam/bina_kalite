import 'dart:ui';
import 'package:flutter/material.dart';

final Color colorDark = Colors.black;
final Color colorPrimary = Color(0xFF3889EC);
final Color colorPrimaryLight = Color(0xFF00C7ED);
final Color colorAccent = Color(0xFFA7F4DC);
final Color colorLight = Colors.white;
final Color colorUnFocus = Colors.grey[600];
final Color colorError = Color(0xFFF2776E);

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
