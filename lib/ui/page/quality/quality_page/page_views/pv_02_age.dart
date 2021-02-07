import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/constants/text_styles.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/enums.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/widget/icon_part_widget.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/widget/title_part_widget.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class Pv02Age extends StatelessWidget with Responsive implements IPageView {
  QualityProvider _qualityProvider;
  @override
  SeenState seenState = SeenState.NOT;

  @override
  IconData iconData = Icons.local_convenience_store;

  @override
  double shortestSide;

  @override
  String title = 'Bina Yaşı';

  int initValue = 0;
  int minValue = 0;
  int maxValue = 100;

  @override
  bool checkAnswer() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    shortestSide = MediaQuery.of(context).size.shortestSide;
    deviceType = shortestSide;
    _qualityProvider = context.watch<QualityProvider>();
    _qualityProvider.setIcon(iconData);
    _qualityProvider.setTitle(title);
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        IconPartWidget(
          iconData: iconData,
          shortestSide: shortestSide,
        ),
        TitlePartWidget(
          title: title,
          shortestSide: shortestSide,
        ),
        Expanded(
          child: Center(
            child: NumberPicker.integer(
              initialValue: _qualityProvider.age ?? initValue,
              minValue: minValue,
              maxValue: maxValue,
              textStyle: fit(
                tsNumberPickerDeaktif_350,
                tsNumberPickerDeaktif_450,
                tsNumberPickerDeaktif_550,
                tsNumberPickerDeaktif_bigest,
              ),
              selectedTextStyle: fit(
                tsNumberPickerAktif_350,
                tsNumberPickerAktif_450,
                tsNumberPickerAktif_550,
                tsNumberPickerAktif_bigest,
              ),
              highlightSelectedValue: true,
              onChanged: (numy) {
                _qualityProvider.setAge(numy);
              },
            ),
          ),
        ),
      ],
    );
  }
}
