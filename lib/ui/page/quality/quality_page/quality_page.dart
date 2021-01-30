import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_01_location.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_02_age.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_03_floors.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_04_height.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_05_corrosion.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_06_area.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_07_shop.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_08_contiguous.dart';
import 'package:provider/provider.dart';

class QualityPage extends StatefulWidget {
  @override
  _QualityPage createState() => _QualityPage();
}

class _QualityPage extends State<QualityPage> {
  // NEWEST
  double shortestSide;
  List<IPageView> _pageViews = [];
  QualityProvider _qualityProvider;
  // OLDY
  int _currentPage = 0;
  List<Widget> _slidePages = [];
  List<bool> _pageHatalar = List<bool>.generate(9, (i) => true);
  final PageController _pageController = PageController(initialPage: 0);
  // KonumState _konumState = KonumState.Girilmedi;
  // LatLng _konum = null;
  // int _binaYasi = 0;
  // int _katSayisi = 1;
  // int _binaYuksekligi = 10;
  // int _korozyonVarMi = 0;
  // int _binaOturumAlani = 100;
  // int _zemindeMagazaVarMi = 0;
  // int _binaBitisikNizamMi = 0;
  // bool _sonucErisildi = false;
  // SonucState _sonucState = SonucState.Bos;
  // int _sonucRiskSeviye = 0;
  // String _sonucYazi = '';
  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // New
    _qualityProvider = Provider.of<QualityProvider>(context);
    shortestSide = MediaQuery.of(context).size.shortestSide;
    print('shortestSide :  ' + shortestSide.toString());
    if (_pageViews.length == 0) {
      _pageViews.add(
        Pv01Location(
          shortestSide,
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
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Sabit değişir Kısım
              // Icon
              (_pageViews[_currentPage] is IPageViewSelection)
                  ? Container(
                      height: 240,
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          (_pageViews[_currentPage] as IPageViewSelection)
                              .iconData,
                          size: 100,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  : Container(),
              // Başlık
              (_pageViews[_currentPage] is IPageViewSelection)
                  ? Container(
                      alignment: Alignment.center,
                      height: 60,
                      child: Text(
                        (_pageViews[_currentPage] as IPageViewSelection).title,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.blue[900],
                        ),
                      ),
                    )
                  : Container(),
              // Değişir Kısım (PageView)
              Expanded(
                child: PageView.builder(
                  physics: _pageViewPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: (int index) {
                    veriKontrol(index); // TODO
                    // TODO son sorudaysa, sonuc sayfasına gitme
                    if (_qualityProvider.doneState != DoneState.DONE &&
                        index == 8 &&
                        _currentPage == 7) {
                      _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                      return;
                    }
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _pageViews.length,
                  itemBuilder: (ctx, i) => _pageViews[i] as Widget,
                ),
              ),
              // Noktalar Kısım
              (_qualityProvider.doneState != DoneState.DONE)
                  ? Container(
                      height: 60,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < _slidePages.length - 1; i++)
                            if (i > _currentPage)
                              _slideDot(2)
                            else if (i == _currentPage)
                              _slideDot(1)
                            else if (!_pageHatalar[i])
                              _slideDot(3)
                            else if (i < _currentPage)
                              _slideDot(0)
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

  Widget _slideDot(int type) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: (type == 2) ? 8 : 12,
      width: (type == 2) ? 8 : 12,
      decoration: BoxDecoration(
        color: (type == 0)
            ? Colors.green[200]
            : (type == 1)
                ? Colors.blue[800]
                : (type == 3)
                    ? Colors.red
                    : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  bool veriKontrol(int nereyeKadarKontrol) {
    bool sonuc = true;
    // if (nereyeKadarKontrol > 0) {
    //   if (_konum == null) {
    //     _pageHatalar[0] = false;
    //     sonuc = false;
    //   } else
    //     _pageHatalar[0] = true;
    // }

    // if (nereyeKadarKontrol > 4) {
    //   if (_korozyonVarMi == 0) {
    //     _pageHatalar[4] = false;
    //     sonuc = false;
    //   } else
    //     _pageHatalar[4] = true;
    // }
    // if (nereyeKadarKontrol > 6) {
    //   if (_zemindeMagazaVarMi == 0) {
    //     _pageHatalar[6] = false;
    //     sonuc = false;
    //   } else
    //     _pageHatalar[6] = true;
    // }
    // if (nereyeKadarKontrol > 7) {
    //   if (_binaBitisikNizamMi == 0) {
    //     _pageHatalar[7] = false;
    //     sonuc = false;
    //   } else
    //     _pageHatalar[7] = true;
    // }
    return sonuc;
  }

  bittiKontrol() async {
    if (!veriKontrol(8)) return;

    _sonucErisildi = true;
    // 9.(sonuç) sayfasına kadar sayfa ileri ittirilir
    int duration = (_currentPage == 7) ? 600 : 200;
    while (_currentPage <= 8) {
      await _pageController.nextPage(
        duration: Duration(milliseconds: duration),
        curve: Curves.easeIn,
      );
      _currentPage++;
    }

    await sonucGetir();
  }

  void sonucGetir() async {
    setState(() {
      _sonucState = SonucState.Getiriliyor;
    });
    final body = {
      // "konum": _konum,
      // "binaYasi": _binaYasi,
      // "katSayisi": _katSayisi,
      // "binaYuksekligi": _binaYuksekligi,
      // "korozyonVarMi": _korozyonVarMi,
      // "binaOturumAlani": _binaOturumAlani,
      // "zemindeMagazaVarMi": _zemindeMagazaVarMi,
      // "binaBitisikNizamMi": _binaBitisikNizamMi
    };
    final jsonString = json.encode(body);
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    await http
        .post('http://10.0.2.2:8000/', headers: headers, body: jsonString)
        .then((value) {
      Map<String, dynamic> resp = json.decode(value.body);
      _sonucRiskSeviye = int.parse(resp['sonucRiskSeviye'].toString());
      _sonucYazi = resp['sonucYazi'].toString();
      var x = 1;
    });
    setState(() {
      _sonucState = SonucState.Getirildi;
    });
  }

  // NEW
  ScrollPhysics _pageViewPhysics() {
    if (_qualityProvider.locationState == LocationState.INIT ||
        _qualityProvider.locationState == LocationState.LOADING ||
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
}

enum KonumState { Girilmedi, Aliniyor, Girildi }
enum SonucState { Bos, Getiriliyor, Getirildi }
