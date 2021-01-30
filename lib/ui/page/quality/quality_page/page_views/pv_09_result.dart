import 'package:flutter/material.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class Pv09Result extends StatelessWidget with Responsive implements IPageView {
  QualityProvider _qualityProvider;

  @override
  double shortestSide;

  @override
  Widget build(BuildContext context) {
    _qualityProvider = Provider.of<QualityProvider>(context);
    switch (_qualityProvider.doneState) {
      case DoneState.LOADING:
        return loading();
      case DoneState.DONE:
        return done();
      case DoneState.INIT:
        return Container();
      default:
        return Container();
    }
  }

  // TODO : Buradayız
  Widget loading() {
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
  }

  Widget done() {
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
              // _binaOturumAlani = 100;
              // _zemindeMagazaVarMi = 0;
              // _binaBitisikNizamMi = 0;
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
}
