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

class Pv03Floors extends StatelessWidget with Responsive implements IPageView {
  QualityProvider _qualityProvider;
  @override
  SeenState seenState = SeenState.NOT;

  @override
  IconData iconData = Icons.upgrade;

  @override
  double shortestSide;

  @override
  String title = 'Kat Sayısı';

  @override
  bool checkAnswer() {
    return true;
  }

  int initValue = 1;
  int minValue = 1;
  int maxValue = 100;

  @override
  Widget build(BuildContext context) {
    _qualityProvider = context.watch<QualityProvider>();
    _qualityProvider.setIcon(iconData);
    _qualityProvider.setTitle(title);
    shortestSide = MediaQuery.of(context).size.shortestSide;
    deviceType = shortestSide;
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
              initialValue: _qualityProvider.floors ?? initValue,
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
                _qualityProvider.setFloors(numy);
                // bittiKontrol();
              },
            ),
          ),
        ),
      ],
    );
  }
}
