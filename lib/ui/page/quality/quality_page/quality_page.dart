import 'package:flutter/material.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/enums.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_01_location.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_02_age.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_03_floors.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_04_height.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_05_corrosion.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_06_area.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_07_shop.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_08_contiguous.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/result_page.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class QualityPage extends StatefulWidget {
  @override
  _QualityPage createState() => _QualityPage();
}

class _QualityPage extends State<QualityPage> with Responsive {
  // NEWEST
  double shortestSide;
  List<IPageView> _pageViews = [];
  QualityProvider _qualityProvider;
  // OLDY
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    shortestSide = MediaQuery.of(context).size.shortestSide; //320; // TODO
    deviceType = shortestSide;
    print('quality ss : ${MediaQuery.of(context).size.shortestSide}');
    _qualityProvider = context
        .watch<QualityProvider>(); //Provider.of<QualityProvider>(context);
    if (_pageViews.length == 0) {
      _pageViews.add(
        Pv01Location(
          onLocationComplete: pageView1CompleteAnimate,
        ),
      );
      _pageViews.add(Pv02Age());
      _pageViews.add(Pv03Floors());
      _pageViews.add(Pv04Height());
      _pageViews.add(Pv05Corrosion());
      _pageViews.add(Pv06Area());
      _pageViews.add(Pv07Shop());
      _pageViews.add(Pv08Contiguous());
      _qualityProvider.pageViews = _pageViews;
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[200],
              Colors.blue[300],
              Colors.blue[400],
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.0),
            stops: [0.0, 0.5, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            fit(10, 20, 30, 20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: fit(40, 60, 90, 140)),
              // (PageView)
              Expanded(
                child: (_qualityProvider.doneState == DoneState.INIT)
                    ? PageView.builder(
                        physics: _pageViewPhysics(),
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: (int index) {
                          _qualityProvider.setSeen(index);
                        },
                        itemCount: _pageViews.length,
                        itemBuilder: (ctx, i) => _pageViews[i] as Widget,
                      )
                    : ResultPage(),
              ),
              // Noktalar Kısım
              (_qualityProvider.doneState != DoneState.DONE)
                  ? Container(
                      height: 60,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (IPageView pv in _pageViews) _dot(pv)
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  ScrollPhysics _pageViewPhysics() {
    if (_qualityProvider.locationState == LocationState.INIT ||
        _qualityProvider.locationState == LocationState.LOADING ||
        _qualityProvider.doneState == DoneState.LOADING ||
        _qualityProvider.doneState == DoneState.FAIL ||
        _qualityProvider.doneState == DoneState.DONE) {
      return NeverScrollableScrollPhysics();
    } else {
      return AlwaysScrollableScrollPhysics();
    }
  }

  void pageView1CompleteAnimate() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 800),
      curve: Curves.easeIn,
    );
  }

  Widget _dot(IPageView pv) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(
        horizontal: fit(8, 10, 16, 22),
      ),
      height: (pv.seenState == SeenState.NOW)
          ? fit(10, 12, 16, 24)
          : fit(6, 8, 12, 16),
      width: (pv.seenState == SeenState.NOW)
          ? fit(10, 12, 16, 24)
          : fit(6, 8, 12, 16),
      decoration: BoxDecoration(
        color: (pv.seenState == SeenState.SEEN && pv.checkAnswer())
            ? Colors.green[200]
            : (pv.seenState == SeenState.SEEN)
                ? Colors.red
                : (pv.seenState == SeenState.NOT ||
                        pv.seenState == SeenState.NOW)
                    ? Colors.blue[800]
                    : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
