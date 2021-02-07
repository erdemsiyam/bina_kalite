import 'package:flutter/material.dart';
import 'package:ornek1/ui/utils/Responsive.dart';

class IconPartWidget extends StatelessWidget with Responsive {
  IconData iconData;
  double shortestSide;
  IconPartWidget({
    @required this.iconData,
    @required this.shortestSide,
  });
  @override
  Widget build(BuildContext context) {
    deviceType = shortestSide;
    return Container(
      height: fit(150, 200, 280, 340),
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(
          fit(20, 26, 32, 38),
        ),
        decoration: BoxDecoration(
          color: Colors.white30,
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconData,
          size: fit(110, 130, 200, 240),
          color: Colors.blue,
        ),
      ),
    );
  }
}
