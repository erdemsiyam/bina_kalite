import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/DotEnum.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class Pv06Area extends StatelessWidget
    with Responsive
    implements IPageViewSelection {
  QualityProvider _qualityProvider;
  @override
  Dot dot;

  @override
  IconData iconData = Icons.my_location;

  @override
  double shortestSide;

  @override
  String title = 'Bina Oturum Alanı';

  @override
  bool check() {
    dot = Dot.DONE;
    return true;
  }

  int initValue = 100;
  int minValue = 50;
  int stepValue = 50;
  int maxValue = 500;

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
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberPicker.integer(
                  initialValue: initValue,
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
                    _qualityProvider.setArea(numy);
                    // bittiKontrol();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text(
                    'm²',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
