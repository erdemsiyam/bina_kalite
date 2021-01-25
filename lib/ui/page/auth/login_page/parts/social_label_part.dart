import 'package:flutter/material.dart';
import 'package:ornek1/ui/constants/text_styles.dart';
import 'package:ornek1/ui/utils/responsive.dart';

class SocialLabelPart extends StatelessWidget with Responsive {
  final double shortestSide;
  final String labelText = 'Sosyal Medya İle';
  SocialLabelPart(this.shortestSide);
  @override
  Widget build(BuildContext context) {
    deviceType = shortestSide;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: fit(20, 30, 40, 50),
              right: fit(15, 20, 25, 30),
            ),
            child: Divider(
              color: Theme.of(context).disabledColor,
            ),
          ),
        ),
        Text(
          labelText,
          textAlign: TextAlign.center,
          style: fit(
            tsKucukAciklama1_350,
            tsKucukAciklama1_450,
            tsKucukAciklama1_550,
            tsKucukAciklama1_bigest,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: fit(20, 30, 40, 50),
              left: fit(15, 20, 25, 30),
            ),
            child: Divider(
              color: Theme.of(context).disabledColor,
            ),
          ),
        ),
      ],
    );
  }
}
