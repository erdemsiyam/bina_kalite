import 'package:flutter/material.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/DotEnum.dart';
import 'package:ornek1/ui/utils/Responsive.dart';

enum Result { INIT, YES, NO }

class Pv05Corrosion extends StatelessWidget
    with Responsive
    implements IPageView {
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
    return (result != Result.INIT) ? true : false;
  }

  Result result;
  // TODO : BURADAYIZ
  @override
  Widget build(BuildContext context) {
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
                    color: (_korozyonVarMi == 1)
                        ? Colors.green[200]
                        : Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      if (_sonucErisildi) return;
                      setState(() {
                        _korozyonVarMi = 1;
                      });
                      bittiKontrol();
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
                    color: (_korozyonVarMi == 2)
                        ? Colors.green[200]
                        : Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {
                      if (_sonucErisildi) return;
                      setState(() {
                        _korozyonVarMi = 2;
                      });
                      bittiKontrol();
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
