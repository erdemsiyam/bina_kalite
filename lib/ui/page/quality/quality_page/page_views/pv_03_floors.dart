import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/DotEnum.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/widget/icon_part_widget.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/widget/title_part_widget.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class Pv03Floors extends StatelessWidget
    with Responsive
    implements IPageViewSelection {
  QualityProvider _qualityProvider;
  @override
  Dot dot;

  @override
  IconData iconData = Icons.upgrade;

  @override
  double shortestSide;

  @override
  String title = 'Kat Sayısı';

  @override
  bool check() {
    dot = Dot.DONE;
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 30),
        IconPartWidget(iconData: iconData),
        TitlePartWidget(title: title),
        NumberPicker.integer(
          initialValue: _qualityProvider.floors ??initValue,
          minValue: minValue,
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
            _qualityProvider.setFloors(numy);
            // bittiKontrol();
          },
        ),
      ],
    );
  }
}
