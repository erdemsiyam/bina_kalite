import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ornek1/utils/responsive.dart';

class SocialLoginButtonsPart extends StatelessWidget with Responsive {
  final double shortestSide;
  final String logoFacebook = 'assets/images/auth/facebook.svg';
  final String logoGoogle = 'assets/images/auth/google.svg';
  final String logoTwitter = 'assets/images/auth/twitter.svg';
  final String logoLinkedin = 'assets/images/auth/linkedin.svg';
  final String labelFacebook = 'Facebook Login';
  final String labelGoogle = 'Google Login';
  final String labelTwitter = 'Twitter Login';
  final String labelLinkedin = 'Linkedin Login';
  double logoSize;

  SocialLoginButtonsPart(this.shortestSide);
  @override
  Widget build(BuildContext context) {
    deviceType = shortestSide;
    logoSize = fit(30, 40, 60, 80);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(width: 30),
        InkWell(
          child: SvgPicture.asset(
            logoFacebook,
            semanticsLabel: labelFacebook,
            width: logoSize,
          ),
          onTap: () {
            // TODO
          },
        ),
        InkWell(
          child: SvgPicture.asset(
            logoGoogle,
            semanticsLabel: labelGoogle,
            width: logoSize,
          ),
          onTap: () {
            // TODO
          },
        ),
        InkWell(
          child: SvgPicture.asset(
            logoTwitter,
            semanticsLabel: labelTwitter,
            width: logoSize,
          ),
          onTap: () {
            // TODO
          },
        ),
        InkWell(
          child: SvgPicture.asset(
            logoLinkedin,
            semanticsLabel: labelLinkedin,
            width: logoSize,
          ),
          onTap: () {
            // TODO
          },
        ),
        SizedBox(width: 30),
      ],
    );
  }
}
