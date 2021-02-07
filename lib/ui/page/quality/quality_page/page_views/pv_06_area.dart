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

class Pv06Area extends StatelessWidget with Responsive implements IPageView {
  QualityProvider _qualityProvider;
  @override
  SeenState seenState = SeenState.NOT;

  @override
  IconData iconData = Icons.my_location;

  @override
  double shortestSide;

  @override
  String title = 'Bina Oturum Alanı';

  @override
  bool checkAnswer() {
    // dot = Dot.DONE;
    return true;
  }

  int initValue = 100;
  int minValue = 50;
  int stepValue = 50;
  int maxValue = 500;

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
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              NumberPicker.integer(
                initialValue: _qualityProvider.area ?? initValue,
                minValue: minValue,
                step: stepValue,
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
                  _qualityProvider.setArea(numy);
                },
              ),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 50.0,
                      left: 10,
                    ),
                    child: Text(
                      'm²',
                      style: fit(
                        tsLabel1_350,
                        tsLabel1_450,
                        tsLabel1_550,
                        tsLabel1_bigest,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
