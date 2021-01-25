import 'package:flutter/material.dart';
import 'package:ornek1/ui/constants/text_styles.dart';
import 'package:ornek1/ui/utils/responsive.dart';

class PrefacePart extends StatelessWidget with Responsive {
  final double shortestSide;
  final String title = 'Hayatın Değerli.';
  final String subTitle =
      'Sevdikleriniz ile birlikte daha fazla vakit gerçimeniz için çalışıyoruz...';
  PrefacePart(this.shortestSide);
  @override
  Widget build(BuildContext context) {
    deviceType = shortestSide;
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: fit(
            tsBuyukBaslik1_350,
            tsBuyukBaslik1_450,
            tsBuyukBaslik1_550,
            tsBuyukBaslik1_bigest,
          ),
        ),
        SizedBox(height: shortestSide / 20),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: fit(50, 50, 80, 180),
          ),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: fit(
              tsKucukAciklama1_350,
              tsKucukAciklama1_450,
              tsKucukAciklama1_550,
              tsKucukAciklama1_bigest,
            ),
          ),
        ),
      ],
    );
  }
}
