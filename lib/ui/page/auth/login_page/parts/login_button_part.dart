import 'package:flutter/material.dart';
import 'package:ornek1/provider/auth_provider.dart';
import 'package:ornek1/ui/constants/text_styles.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class LoginButtonPart extends StatelessWidget with Responsive {
  final double shortestSide;
  final String loginText = 'GİRİŞ';
  AuthProvider _authProvider;
  LoginButtonPart(this.shortestSide);
  @override
  Widget build(BuildContext context) {
    deviceType = shortestSide;
    _authProvider = context.watch<AuthProvider>();
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: fit(60, 80, 110, 140),
        vertical: fit(0, 0, 20, 30),
      ),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(
          vertical: fit(14, 20, 26, 32),
        ),
        child: Text(
          loginText,
          style: fit(
            tsButton1_350,
            tsButton1_450,
            tsButton1_550,
            tsButton1_bigest,
          ),
        ),
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        onPressed: () async {
          await _authProvider.login();
        },
      ),
    );
  }
}
