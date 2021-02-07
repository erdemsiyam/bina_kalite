import 'package:flutter/material.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/enums.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/widget/icon_part_widget.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/widget/title_part_widget.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class Pv05Corrosion extends StatelessWidget
    with Responsive
    implements IPageView {
  QualityProvider _qualityProvider;
  @override
  SeenState seenState = SeenState.NOT;

  @override
  IconData iconData = Icons.water_damage;

  @override
  double shortestSide;

  @override
  String title = 'Korozyon Var Mı?';

  @override
  bool checkAnswer() {
    return _qualityProvider.corrosion != CorrosionAnswer.INIT;
    // if (_qualityProvider.corrosion != CorrosionAnswer.INIT) {
    //   dot = Dot.DONE;
    //   return true;
    // } else {
    //   dot = Dot.NOT_DONE;
    //   return false;
    // }
  }

  @override
  Widget build(BuildContext context) {
    _qualityProvider = context.watch<QualityProvider>();
    _qualityProvider.setIcon(iconData);
    _qualityProvider.setTitle(title);
    return Expanded(
      child: Container(
        child: Column(
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Icon(
                      Icons.done,
                      color: Colors.blue[800],
                      size: 32,
                    ),
                    color: (_qualityProvider.corrosion == CorrosionAnswer.YES)
                        ? Colors.green[200]
                        : Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      _qualityProvider.setCorrosion(CorrosionAnswer.YES);
                      // bittiKontrol();
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Icon(
                      Icons.close,
                      color: Colors.blue[800],
                      size: 32,
                    ),
                    color: (_qualityProvider.corrosion == CorrosionAnswer.NO)
                        ? Colors.red[200]
                        : Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      _qualityProvider.setCorrosion(CorrosionAnswer.NO);
                      // bittiKontrol();
                    },
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
