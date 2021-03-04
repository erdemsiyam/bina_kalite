import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ornek1/provider/auth_provider.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/auth/login_page/enum/enums.dart';
import 'package:ornek1/ui/page/auth/login_page/login_page.dart';
import 'package:ornek1/ui/page/home/home_page/home_page.dart';
import 'package:ornek1/ui/page/quality/quality_page/quality_page.dart';
import 'package:ornek1/ui/constants/constant.dart';
import 'package:ornek1/ui/page/services/services_page.dart';
import 'package:provider/provider.dart';

main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QualityProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
          lazy: false,
        ),
      ],
      child: MyApp(),
      //     DevicePreview(
      //   builder: (context) => MyApp(),
      // ),
    ),
  );
}

class MyApp extends StatelessWidget {
  AuthProvider _authProvider;
  @override
  Widget build(BuildContext context) {
    _authProvider = context.watch<AuthProvider>();
    return MaterialApp(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: (_authProvider.loginState == LoginState.DONE)
          ? HomePage()
          : LoginPage(),
      // LoginPage(),
      // ServicesPage(),
      // HomePage(),
      // QualityPage(),
    );
  }
}
