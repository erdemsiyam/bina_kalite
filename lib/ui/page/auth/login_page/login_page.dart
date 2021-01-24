import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ornek1/ui/page/auth/login_page/parts/preface_part.dart';
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
              SizedBox(height: shortestSide / 200),
              UserPasswordPart(shortestSide),
              forgotPasswordPart,
              SizedBox(height: 10),
              loginButton,
              SizedBox(height: 18),
              socialLabelPart,
              SizedBox(height: 16),
              socialLoginButtons,
            ],
          ),
        ),
      ),
    );
  }

  Widget get forgotPasswordPart => Container(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Şifremi Unuttum',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
  Widget get loginButton => Container(
        margin: EdgeInsets.symmetric(horizontal: 80),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'LOG IN',
            style: Theme.of(context).textTheme.button,
          ),
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
          ),
          onPressed: () {},
        ),
      );
  Widget get socialLabelPart => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 20),
              child: Divider(
                color: Theme.of(context).disabledColor,
              ),
            ),
          ),
          Text(
            'Sosyal Medya İle',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 40, left: 20),
              child: Divider(
                color: Colors.grey[500],
              ),
            ),
          ),
        ],
      );
  Widget get socialLoginButtons => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(width: 30),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/images/auth/facebook.svg',
              semanticsLabel: 'Facebook Login',
              width: 40,
            ),
          ),
          InkWell(
            child: SvgPicture.asset(
              'assets/images/auth/google.svg',
              semanticsLabel: 'Google Login',
              width: 40,
            ),
          ),
          InkWell(
            child: SvgPicture.asset(
              'assets/images/auth/twitter.svg',
              semanticsLabel: 'Twitter Login',
              width: 40,
            ),
          ),
          InkWell(
            child: SvgPicture.asset(
              'assets/images/auth/linkedin.svg',
              semanticsLabel: 'Linkedin Login',
              width: 40,
            ),
          ),
          // InkWell(
          //   child: Image.asset(
          //     '/images/auth/google.png',
          //     width: 30,
          //     height: 30,
          //   ),
          //   onTap: () {},
          // ),
          // InkWell(
          //   child: Image.asset(
          //     '/images/auth/facebook.png',
          //     width: 30,
          //     height: 30,
          //   ),
          //   onTap: () {},
          // ),
          // InkWell(
          //   child: Image.asset(
          //     '/images/auth/twitter.png',
          //     width: 30,
          //     height: 30,
          //   ),
          //   onTap: () {},
          // ),
          // InkWell(
          //   child: Image.asset(
          //     '/images/auth/linkedin.png',
          //     width: 30,
          //     height: 30,
          //   ),
          //   onTap: () {},
          // ),
          SizedBox(width: 30),
        ],
      );
}
