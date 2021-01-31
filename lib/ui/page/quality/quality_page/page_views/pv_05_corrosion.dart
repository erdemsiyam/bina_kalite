import 'package:flutter/material.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/DotEnum.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class Pv05Corrosion extends StatelessWidget
    with Responsive
    implements IPageViewSelection {
  QualityProvider _qualityProvider;
  @override
  Dot dot;

  @override
  IconData iconData = Icons.water_damage;

  @override
  double shortestSide;

  @override
  String title = 'Korozyon Var Mı?';

  @override
  bool check() {
    if (_qualityProvider.corrosion != CorrosionAnswer.INIT) {
      dot = Dot.DONE;
      return true;
    } else {
      dot = Dot.NOT_DONE;
      return false;
    }
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
