import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:ornek1/ui/page/auth/login_page/login_page.dart';
import 'package:ornek1/ui/page/home/home_page.dart';
import 'package:ornek1/ui/page/quality/location_pick_page.dart';
import 'package:ornek1/ui/page/quality/quality_page.dart';
import 'package:ornek1/ui/constants/constant.dart';

main() => runApp(DevicePreview(
      builder: (context) => MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
