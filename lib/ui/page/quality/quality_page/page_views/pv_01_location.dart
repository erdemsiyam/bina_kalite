import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/quality/location_pick_page/location_pick_page.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/DotEnum.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class Pv01Location extends StatelessWidget
    with Responsive
    implements IPageViewSelection {
  QualityProvider _qualityProvider;
  @override
  IconData iconData = Icons.location_on;
  @override
  String title = 'Konum';
  @override
  Dot dot;
  @override
  double shortestSide;

  final Widget Function() onLocationComplete;

  Pv01Location(this.shortestSide, {@required this.onLocationComplete});
  @override
  Widget build(BuildContext context) {
    _qualityProvider = Provider.of<QualityProvider>(context);
    deviceType = shortestSide;
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: (_qualityProvider.locationState == LocationState.INIT)
              ? girilmediState(context)
              : (_qualityProvider.locationState == LocationState.LOADING)
                  ? aliniyorState()
                  : (_qualityProvider.locationState == LocationState.DONE)
                      ? girildiState()
                      : [],
        ),
      ),
    );
  }

  @override
  bool check() {
    return (_qualityProvider.location != null) ? true : false;
    // TODO : dot ları burada verebilirsin
  }

  List<Widget> girilmediState(BuildContext context) {
    return [
      SizedBox(height: 30),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Şu anki Konumum',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue[800],
            ),
          ),
          color: Colors.blue[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          onPressed: () async {
            switch (await _qualityProvider.getLocationFromDevice()) {
              case DeviceLocationResultState.SERVICE_NOT_ALLOW:
                _showCustomDialog(
                    context, 'Konum Servisi', 'Konum servisi çalışmamaktadır.');
                break;
              case DeviceLocationResultState.PERMISSION_NOT_ALLOW:
                _showCustomDialog(
                    context, 'Konum İzni', 'Lütfen konum izini veriniz.');
                break;
              case DeviceLocationResultState.DONE:
                onLocationComplete.call();
                break;
              case DeviceLocationResultState.INIT:
                break;
            }
          },
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Center(
        child: GestureDetector(
          child: Text(
            'Haritadan Seç',
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          ),
          onTap: () async {
            await _qualityProvider.getLocationFromMap(
              await Navigator.push<LatLng>(
                context,
                MaterialPageRoute(
                  builder: (context) => LocationPickPage(),
                ),
              ),
            );
            switch (_qualityProvider.manuelLocationResultState) {
              case ManuelLocationResultState.INIT:
                _showCustomDialog(context, 'Konum Seçimi', 'Konum seçilemedi.');
                break;
              case ManuelLocationResultState.DONE:
                onLocationComplete.call();
                break;
            }
          },
        ),
      ),
    ];
  }

  List<Widget> aliniyorState() {
    return [
      Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue[400],
        ),
      )
    ];
  }

  List<Widget> girildiState() {
    return [
      SizedBox(height: 10),
      Center(
        child: Icon(
          Icons.done,
          size: 80,
          color: Colors.green[200],
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Center(
        child: IconButton(
          icon: Icon(Icons.refresh),
          iconSize: 26,
          color: Colors.grey[200],
          onPressed: () => _qualityProvider.deleteLocationInformation(),
        ),
      ),
    ];
  }

  _showCustomDialog(BuildContext context, String title, String subTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(subTitle),
          actions: <Widget>[
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
