import 'package:flutter/material.dart';
import 'package:ornek1/ui/constants/text_styles.dart';

class PrefacePart extends StatelessWidget {
  final double shortestSide;
  final String title = 'Hayatın Değerli.';
  final String subTitle =
      'Sevdikleriniz ile birlikte daha fazla vakit gerçimeniz için çalışıyoruz...';
  PrefacePart(this.shortestSide);
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

  Widget get size350 => Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: tsBuyukBaslik1_350,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: tsKucukAciklama1_350,
            ),
          ),
        ],
      );
  Widget get size450 => Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: tsBuyukBaslik1_450,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: tsKucukAciklama1_450,
            ),
          ),
        ],
      );
  Widget get size550 => Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: tsBuyukBaslik1_550,
          ),
          SizedBox(height: shortestSide / 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: tsKucukAciklama1_550,
            ),
          ),
        ],
      );
  Widget get bigest => Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: tsBuyukBaslik1_bigest,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 180),
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: tsKucukAciklama1_bigest,
            ),
          ),
        ],
      );
}
