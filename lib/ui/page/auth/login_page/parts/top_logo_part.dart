import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ornek1/ui/utils/responsive.dart';

class TopLogoPart extends StatelessWidget with Responsive {
  final double shortestSide;
  final String icon1Path = 'assets/images/auth/cloud3.svg';
  final String icon2Path = 'assets/images/auth/building1.svg';
  final String icon3Path = 'assets/images/auth/cloud1.svg';
  final String icon1Label = 'Cloud1';
  final String icon2Label = 'Building';
  final String icon3Label = 'Cloud2';
  TopLogoPart(this.shortestSide);
  @override
  Widget build(BuildContext context) {
    deviceType = shortestSide;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(),
        Positioned(
          left: fit(80, 100, 130, 230),
          top: fit(-10, -10, -10, 0),
          child: SvgPicture.asset(
            icon1Path,
            semanticsLabel: icon1Label,
            width: fit(80, 110, 140, 150),
          ),
        ),
        SvgPicture.asset(
          icon2Path,
          semanticsLabel: icon2Label,
          width: fit(120, 160, 230, 240),
        ),
        Positioned(
          right: fit(60, 60, 80, 160),
          top: -10,
          child: SvgPicture.asset(
            icon3Path,
            semanticsLabel: icon3Label,
            width: fit(80, 120, 150, 180),
          ),
        ),
      ],
    );
  }
}
