import 'package:flutter/material.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/enums.dart';
import 'package:ornek1/ui/utils/IResponsive.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class Pv09Result extends StatelessWidget
    with Responsive
    implements IResponsive {
  //with Responsive implements IPageView {
  QualityProvider _qualityProvider;

  @override
  double shortestSide;

  final void Function() onRestart;

  Pv09Result({@required this.onRestart});

  @override
  Widget build(BuildContext context) {
    _qualityProvider = context
        .watch<QualityProvider>(); // Provider.of<QualityProvider>(context);
    switch (_qualityProvider.doneState) {
      case DoneState.LOADING:
        return loading();
      case DoneState.DONE:
        return done();
      case DoneState.FAIL:
        return fail();
      case DoneState.INIT:
        return Container();
      default:
        return Container();
    }
  }

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
                  _qualityProvider.resultText ?? "70.satır",
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
        _riskLevel("Düşük Risk", Colors.green[400],
            _qualityProvider.result == ResultAnswer.LOW_RISK),
        _riskLevel("Orta Risk", Colors.yellow,
            _qualityProvider.result == ResultAnswer.MEDIUM_RISK),
        _riskLevel("Yüksek Risk", Colors.orange,
            _qualityProvider.result == ResultAnswer.HIGH_RISK),
        _riskLevel("Çok Yüksek Risk", Colors.red,
            _qualityProvider.result == ResultAnswer.VERY_HIGH_RISK),
        SizedBox(height: 10),
        IconButton(
          icon: Icon(
            Icons.refresh,
            size: 40,
            color: Colors.white,
          ),
          onPressed: () {
            _qualityProvider.reset();

            // onRestart.call();

            // setState(() {
            //   _currentPage = 0;
            //   _pageHatalar = List<bool>.generate(9, (i) => true);
            // _konumState = KonumState.Girilmedi;
            // _konum = null;
            // _binaYasi = 0;
            // _katSayisi = 1;
            // _binaYuksekligi = 9;
            // _korozyonVarMi = 0;
            // _binaOturumAlani = 100;
            // _zemindeMagazaVarMi = 0;
            // _binaBitisikNizamMi = 0;
            //   _sonucErisildi = false;
            //   _sonucState = SonucState.Bos;
            //   _sonucRiskSeviye = 0;
            //   _sonucYazi = "";
            //   _pageController.jumpToPage(0);
            // });
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
        icerik ?? " 144.satır",
        style: TextStyle(
          fontSize: 26,
          color: Colors.blue[900],
        ),
      ),
    );
  }

  Widget _riskLevel(String text, Color color, bool selected) {
    return Row(
      children: [
        Container(
          height: 40,
          width: (selected) ? 350 : 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: (selected)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      text ?? "174.satır",
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
    );
  }

  Widget fail() {
    // TODO : 9.sayfa http fail durumunda
    return Container();
  }
}
