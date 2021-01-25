import 'package:flutter/material.dart';
import 'package:ornek1/ui/constants/text_styles.dart';
import 'package:ornek1/utils/responsive.dart';

class ForgotPasswordPart extends StatelessWidget with Responsive {
  final double shortestSide;
  final String forgotPasswordText = 'Şifremi Unuttum';
  ForgotPasswordPart(this.shortestSide);
  @override
  Widget build(BuildContext context) {
    deviceType = shortestSide;
    return Container(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(
          right: fit(38, 60, 80, 100),
        ),
        child: TextButton(
          child: Text(
            forgotPasswordText,
            style: fit(
              tsTextButton1_350,
              tsTextButton1_450,
              tsTextButton1_550,
              tsTextButton1_bigest,
            ),
          ),
          onPressed: () {
            // TODO
          },
        ),
      ),
    );
  }
}
