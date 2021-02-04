import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/DotEnum.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/widget/icon_part_widget.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/widget/title_part_widget.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class Pv04Height extends StatelessWidget
    with Responsive
    implements IPageViewSelection {
  QualityProvider _qualityProvider;
  @override
  Dot dot = Dot.INIT;

  @override
  IconData iconData = Icons.format_line_spacing;

  @override
  double shortestSide;

  @override
  String title = 'Bina Yüksekliği';

  @override
  bool check() {
    // dot = Dot.DONE;
    return true;
  }

  int initValue = 9;
  int minValue = 3;
  int stepValue = 3;
  int maxValue = 60;

  @override
  Widget build(BuildContext context) {
    _qualityProvider = context.watch<QualityProvider>();
    _qualityProvider.setIcon(iconData);
    _qualityProvider.setTitle(title);
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 30),
        IconPartWidget(iconData: iconData),
        TitlePartWidget(title: title),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberPicker.integer(
              initialValue: _qualityProvider.height ?? initValue,
              minValue: minValue,
              step: stepValue,
              maxValue: maxValue,
              textStyle: TextStyle(
                fontSize: 20,
                color: Colors.grey[300],
              ),
              selectedTextStyle: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
              highlightSelectedValue: true,
              onChanged: (numy) {
                _qualityProvider.setHeight(numy);
                // bittiKontrol();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                'm',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
