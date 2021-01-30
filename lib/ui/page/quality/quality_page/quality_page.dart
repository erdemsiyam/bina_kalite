import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
import 'package:numberpicker/numberpicker.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_01_location.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_02_age.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_03_floors.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/pv_04_height.dart';
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
  int _binaOturumAlani = 100;
  int _zemindeMagazaVarMi = 0;
  int _binaBitisikNizamMi = 0;
  bool _sonucErisildi = false;
  SonucState _sonucState = SonucState.Bos;
  int _sonucRiskSeviye = 0;
  String _sonucYazi = '';
  @override
  void initState() {
    super.initState();
    // OLD
    _slidePages.add(_page6());
    _slidePages.add(_page7());
    _slidePages.add(_page8());
    _slidePages.add(_page9()); // Sonuç Sayfası
  }

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
              Container(
                height: 240,
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _pageViews[_currentPage].iconData,
                    size: 100,
                    color: Colors.blue,
                  ),
                ),
              ),
              // Başlık
              Container(
                alignment: Alignment.center,
                height: 60,
                child: Text(
                  _pageViews[_currentPage].title,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.blue[900],
                  ),
                ),
              ),
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

  Widget _logo(IconData selectedIcon) {
    return Container(
      height: 240,
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white30,
          shape: BoxShape.circle,
        ),
        child: Icon(
          selectedIcon,
          size: 100,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _baslik(String icerik) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      child: Text(
        icerik,
        style: TextStyle(
          fontSize: 26,
          color: Colors.blue[900],
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

  Widget _page6() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Logo
        _logo(Icons.my_location),
        _baslik('Bina Oturum Alanı'),
        // Soru İçeriği
        Expanded(
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
                      initialValue: _binaOturumAlani,
                      minValue: 50,
                      step: 50,
                      maxValue: 500,
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
                        if (_sonucErisildi) return;
                        setState(() {
                          _binaOturumAlani = numy;
                        });
                        bittiKontrol();
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
        ),
      ],
    );
  }

  Widget _page7() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Logo
        _logo(Icons.fastfood),
        _baslik('Zemin Katta Dükkan Var Mı?'),
        // Soru İçeriği
        Expanded(
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
                        color: (_zemindeMagazaVarMi == 1)
                            ? Colors.green[200]
                            : Colors.blue[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        onPressed: () {
                          if (_sonucErisildi) return;
                          setState(() {
                            _zemindeMagazaVarMi = 1;
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
                        color: (_zemindeMagazaVarMi == 2)
                            ? Colors.green[200]
                            : Colors.blue[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        onPressed: () {
                          if (_sonucErisildi) return;
                          setState(() {
                            _zemindeMagazaVarMi = 2;
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
        ),
      ],
    );
  }

  Widget _page8() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Logo
        _logo(Icons.location_city),
        _baslik('Bina Bitişik Nizam Mı?'),
        // Soru İçeriği
        Expanded(
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
                        color: (_binaBitisikNizamMi == 1)
                            ? Colors.green[200]
                            : Colors.blue[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        onPressed: () {
                          if (_sonucErisildi) return;
                          setState(() {
                            _binaBitisikNizamMi = 1;
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
                        color: (_binaBitisikNizamMi == 2)
                            ? Colors.green[200]
                            : Colors.blue[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        onPressed: () {
                          if (_sonucErisildi) return;
                          setState(() {
                            _binaBitisikNizamMi = 2;
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
        ),
      ],
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

    if (nereyeKadarKontrol > 4) {
      if (_korozyonVarMi == 0) {
        _pageHatalar[4] = false;
        sonuc = false;
      } else
        _pageHatalar[4] = true;
    }
    if (nereyeKadarKontrol > 6) {
      if (_zemindeMagazaVarMi == 0) {
        _pageHatalar[6] = false;
        sonuc = false;
      } else
        _pageHatalar[6] = true;
    }
    if (nereyeKadarKontrol > 7) {
      if (_binaBitisikNizamMi == 0) {
        _pageHatalar[7] = false;
        sonuc = false;
      } else
        _pageHatalar[7] = true;
    }
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
      "binaOturumAlani": _binaOturumAlani,
      "zemindeMagazaVarMi": _zemindeMagazaVarMi,
      "binaBitisikNizamMi": _binaBitisikNizamMi
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

  Widget _page9() {
    if (_sonucState == SonucState.Getiriliyor)
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _baslik('İşleniyor...'),
          Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue[400],
              ),
            ),
          ),
        ],
      );
    if (_sonucState == SonucState.Getirildi)
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Column(
                children: [
                  Text(
                    _sonucYazi,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(height: 20),
                  RaisedButton(
                    color: Colors.blue[100],
                    child: Text(
                      'Detay Göster',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 18,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                height: 40,
                width: (_sonucRiskSeviye == 1) ? 350 : 50,
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: (_sonucRiskSeviye == 1)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Düşük Risk",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      )
                    : Container(),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 40,
                width: (_sonucRiskSeviye == 2) ? 350 : 50,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: (_sonucRiskSeviye == 2)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Orta Risk",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      )
                    : Container(),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 40,
                width: (_sonucRiskSeviye == 3) ? 350 : 50,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: (_sonucRiskSeviye == 3)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Yüksek Risk",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      )
                    : Container(),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 40,
                width: (_sonucRiskSeviye == 4) ? 350 : 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: (_sonucRiskSeviye == 4)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Çok Yüksek Risk",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      )
                    : Container(),
              ),
            ],
          ),
          SizedBox(height: 10),
          IconButton(
            icon: Icon(
              Icons.refresh,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _currentPage = 0;
                _pageHatalar = List<bool>.generate(9, (i) => true);
                // _konumState = KonumState.Girilmedi;
                // _konum = null;
                // _binaYasi = 0;
                // _katSayisi = 1;
                // _binaYuksekligi = 9;
                // _korozyonVarMi = 0;
                _binaOturumAlani = 100;
                _zemindeMagazaVarMi = 0;
                _binaBitisikNizamMi = 0;
                _sonucErisildi = false;
                _sonucState = SonucState.Bos;
                _sonucRiskSeviye = 0;
                _sonucYazi = "";
                _pageController.jumpToPage(0);
              });
            },
          ),
        ],
      );
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
