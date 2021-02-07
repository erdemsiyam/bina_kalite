import 'package:flutter/material.dart';
import 'package:ornek1/ui/constants/text_styles.dart';
import 'package:ornek1/ui/utils/Responsive.dart';

class TitlePartWidget extends StatelessWidget with Responsive {
  String title;
  double shortestSide;
  TitlePartWidget({
    @required this.title,
    @required this.shortestSide,
  });
  @override
  Widget build(BuildContext context) {
    deviceType = shortestSide;
    return Container(
      alignment: Alignment.center,
      height: fit(100, 120, 180, 220),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: fit(
          tsTitle1_350,
          tsTitle1_450,
          tsTitle1_550,
          tsTitle1_bigest,
        ),
      ),
    );
  }
}
