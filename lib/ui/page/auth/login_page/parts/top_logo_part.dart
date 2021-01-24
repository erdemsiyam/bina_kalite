import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopLogoPart extends StatelessWidget {
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
    return (shortestSide <= 350)
        ? size350
        : (shortestSide <= 450)
            ? size450
            : (shortestSide <= 550)
                ? size550
                : bigest;
  }

  Widget get size350 => Stack(
        alignment: Alignment.center,
        children: [
          Container(),
          Positioned(
            left: 80,
            top: -10,
            child: SvgPicture.asset(
              icon1Path,
              semanticsLabel: icon1Label,
              width: 80,
            ),
          ),
          SvgPicture.asset(
            icon2Path,
            semanticsLabel: icon2Label,
            width: 120,
          ),
          Positioned(
            right: 60,
            top: -10,
            child: SvgPicture.asset(
              icon3Path,
              semanticsLabel: icon3Label,
              width: 80,
            ),
          ),
        ],
      );
  Widget get size450 => Stack(
        alignment: Alignment.center,
        children: [
          Container(),
          Positioned(
            left: 100,
            top: -10,
            child: SvgPicture.asset(
              icon1Path,
              semanticsLabel: icon1Label,
              width: 110,
            ),
          ),
          SvgPicture.asset(
            icon2Path,
            semanticsLabel: icon2Label,
            width: 160,
          ),
          Positioned(
            right: 60,
            top: -10,
            child: SvgPicture.asset(
              icon3Path,
              semanticsLabel: icon3Label,
              width: 120,
            ),
          ),
        ],
      );
  Widget get size550 => Stack(
        alignment: Alignment.center,
        children: [
          Container(),
          Positioned(
            left: 130,
            top: 0,
            child: SvgPicture.asset(
              icon1Path,
              semanticsLabel: icon1Label,
              width: 140,
            ),
          ),
          SvgPicture.asset(
            icon2Path,
            semanticsLabel: icon2Label,
            width: 230,
          ),
          Positioned(
            right: 80,
            top: -10,
            child: SvgPicture.asset(
              icon3Path,
              semanticsLabel: icon3Label,
              width: 150,
            ),
          ),
        ],
      );
  Widget get bigest => Stack(
        alignment: Alignment.center,
        children: [
          Container(),
          Positioned(
            left: 230,
            top: -10,
            child: SvgPicture.asset(
              icon1Path,
              semanticsLabel: icon1Label,
              width: 150,
            ),
          ),
          SvgPicture.asset(
            icon2Path,
            semanticsLabel: icon2Label,
            width: 240,
          ),
          Positioned(
            right: 160,
            top: -10,
            child: SvgPicture.asset(
              icon3Path,
              semanticsLabel: icon3Label,
              width: 180,
            ),
          ),
        ],
      );
}
