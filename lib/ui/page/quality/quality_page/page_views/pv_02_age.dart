import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/DotEnum.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class Pv02Age extends StatelessWidget
    with Responsive
    implements IPageViewSelection {
  QualityProvider _qualityProvider;
  @override
  Dot dot;

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
  bool check() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    _qualityProvider = Provider.of<QualityProvider>(context);
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NumberPicker.integer(
              initialValue: initValue,
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
                _qualityProvider.setAge(numy);
                // bittiKontrol();
              },
            ),
          ],
        ),
      ),
    );
  }
}
