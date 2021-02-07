import 'package:flutter/material.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/enums.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/widget/icon_part_widget.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/widget/title_part_widget.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class Pv07Shop extends StatelessWidget with Responsive implements IPageView {
  QualityProvider _qualityProvider;

  @override
  SeenState seenState = SeenState.NOT;

  @override
  IconData iconData = Icons.fastfood;

  @override
  double shortestSide;

  @override
  String title = 'Zemin Katta Dükkan Var Mı?';

  @override
  bool checkAnswer() {
    return _qualityProvider.shop != ShopAnswer.INIT;
  }

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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(
                      vertical: fit(16, 20, 28, 38),
                      horizontal: fit(24, 30, 42, 60),
                    ),
                    child: Icon(
                      Icons.done,
                      color: Colors.blue[800],
                      size: fit(28, 32, 48, 60),
                    ),
                    color: (_qualityProvider.shop == ShopAnswer.YES)
                        ? Colors.green[200]
                        : Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        fit(14, 20, 30, 36),
                      ),
                    ),
                    onPressed: () {
                      _qualityProvider.setShop(ShopAnswer.YES);
                    },
                  ),
                ),
                Container(
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(
                      vertical: fit(16, 20, 28, 38),
                      horizontal: fit(24, 30, 42, 60),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.blue[800],
                      size: fit(28, 32, 48, 60),
                    ),
                    color: (_qualityProvider.shop == ShopAnswer.NO)
                        ? Colors.red[200]
                        : Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        fit(14, 20, 30, 36),
                      ),
                    ),
                    onPressed: () {
                      _qualityProvider.setShop(ShopAnswer.NO);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
