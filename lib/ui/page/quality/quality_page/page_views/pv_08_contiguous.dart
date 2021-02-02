import 'package:flutter/material.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/DotEnum.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/widget/icon_part_widget.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/widget/title_part_widget.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class Pv08Contiguous extends StatelessWidget
    with Responsive
    implements IPageViewSelection {
  QualityProvider _qualityProvider;
  @override
  Dot dot;

  @override
  IconData iconData = Icons.location_city;

  @override
  double shortestSide;

  @override
  String title = 'Bina Bitişik Nizam Mı?';

  @override
  bool check() {
    if (_qualityProvider.contiguous != ContiguousAnswer.INIT) {
      dot = Dot.DONE;
      return true;
    } else {
      dot = Dot.NOT_DONE;
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _qualityProvider = context
        .watch<QualityProvider>(); //Provider.of<QualityProvider>(context);
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Icon(
                  Icons.done,
                  color: Colors.blue[800],
                  size: 32,
                ),
                color: (_qualityProvider.contiguous == ContiguousAnswer.YES)
                    ? Colors.green[200]
                    : Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: () {
                  _qualityProvider.setContiguous(ContiguousAnswer.YES);
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
                color: (_qualityProvider.contiguous == ContiguousAnswer.NO)
                    ? Colors.red[200]
                    : Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: () {
                  _qualityProvider.setContiguous(ContiguousAnswer.NO);
                  // bittiKontrol();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
