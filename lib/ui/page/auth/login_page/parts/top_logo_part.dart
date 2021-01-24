import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopLogoPart extends StatelessWidget {
  double shortestSide;
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
            left: 100,
            top: -10,
            child: SvgPicture.asset(
              'assets/images/auth/cloud3.svg',
              semanticsLabel: 'Cloud3',
              width: 110,
            ),
          ),
          SvgPicture.asset(
            'assets/images/auth/building1.svg',
            semanticsLabel: 'Building',
            width: 160,
          ),
          Positioned(
            right: 60,
            top: -10,
            child: SvgPicture.asset(
              'assets/images/auth/cloud1.svg',
              semanticsLabel: 'Cloud1',
              width: 120,
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
              'assets/images/auth/cloud3.svg',
              semanticsLabel: 'Cloud3',
              width: 110,
            ),
          ),
          SvgPicture.asset(
            'assets/images/auth/building1.svg',
            semanticsLabel: 'Building',
            width: 160,
          ),
          Positioned(
            right: 60,
            top: -10,
            child: SvgPicture.asset(
              'assets/images/auth/cloud1.svg',
              semanticsLabel: 'Cloud1',
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
            left: 100,
            top: -10,
            child: SvgPicture.asset(
              'assets/images/auth/cloud3.svg',
              semanticsLabel: 'Cloud3',
              width: 110,
            ),
          ),
          SvgPicture.asset(
            'assets/images/auth/building1.svg',
            semanticsLabel: 'Building',
            width: 160,
          ),
          Positioned(
            right: 60,
            top: -10,
            child: SvgPicture.asset(
              'assets/images/auth/cloud1.svg',
              semanticsLabel: 'Cloud1',
              width: 120,
            ),
          ),
        ],
      );
  Widget get bigest => Stack(
        alignment: Alignment.center,
        children: [
          Container(),
          Positioned(
            left: 100,
            top: -10,
            child: SvgPicture.asset(
              'assets/images/auth/cloud3.svg',
              semanticsLabel: 'Cloud3',
              width: 110,
            ),
          ),
          SvgPicture.asset(
            'assets/images/auth/building1.svg',
            semanticsLabel: 'Building',
            width: 160,
          ),
          Positioned(
            right: 60,
            top: -10,
            child: SvgPicture.asset(
              'assets/images/auth/cloud1.svg',
              semanticsLabel: 'Cloud1',
              width: 120,
            ),
          ),
        ],
      );
}
