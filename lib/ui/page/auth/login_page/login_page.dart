import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ornek1/ui/page/auth/login_page/parts/forgot_password_part.dart';
import 'package:ornek1/ui/page/auth/login_page/parts/login_button_part.dart';
import 'package:ornek1/ui/page/auth/login_page/parts/preface_part.dart';
import 'package:ornek1/ui/page/auth/login_page/parts/social_label_part.dart';
import 'package:ornek1/ui/page/auth/login_page/parts/social_login_buttons_part.dart';
import 'package:ornek1/ui/page/auth/login_page/parts/top_logo_part.dart';
import 'package:ornek1/ui/page/auth/login_page/parts/user_mail_part.dart';
import 'package:ornek1/ui/page/auth/login_page/parts/user_password_part.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double shortestSide;

  @override
  Widget build(BuildContext context) {
    shortestSide = MediaQuery.of(context).size.shortestSide;
    print('shortestSide :  ' + shortestSide.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.grey[100],
                Colors.white,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 0.5, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: shortestSide / 8),
              TopLogoPart(shortestSide),
              SizedBox(height: shortestSide / 40),
              PrefacePart(shortestSide),
              SizedBox(height: shortestSide / 20),
              UserMailPart(shortestSide),
              SizedBox(height: shortestSide / 100),
              UserPasswordPart(shortestSide),
              ForgotPasswordPart(shortestSide),
              SizedBox(height: shortestSide / 50),
              LoginButtonPart(shortestSide),
              SizedBox(height: shortestSide / 20),
              SocialLabelPart(shortestSide),
              SizedBox(height: shortestSide / 20),
              SocialLoginButtonsPart(shortestSide),
              SizedBox(height: shortestSide / 20),
            ],
          ),
        ),
      ),
    );
  }
}
