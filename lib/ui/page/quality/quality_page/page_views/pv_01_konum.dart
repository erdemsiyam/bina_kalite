import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/page/quality/location_pick_page/location_pick_page.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/DotEnum.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

// enum KonumState { GIRILMEDI, ALINIYOR, GIRILDI }

class Pv01Konum extends StatefulWidget implements IPageView {
  @override
  IconData iconData = Icons.location_on;
  @override
  String title = 'Konum';
  @override
  Dot dot;
  @override
  double shortestSide;

  final Widget Function() onLocationComplete;
  LatLng konum;

  Pv01Konum(this.shortestSide, {@required this.onLocationComplete});
  @override
  _Pv01KonumState createState() => _Pv01KonumState();
}

class _Pv01KonumState extends State<Pv01Konum> with Responsive {
  QualityProvider _qualityProvider;
  @override
  Widget build(BuildContext context) {
    _qualityProvider = Provider.of<QualityProvider>(context);
    deviceType = widget.shortestSide;
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: (_qualityProvider.locationState == LocationState.NOT_DONE)
              ? girilmediState()
              : (_qualityProvider.locationState == LocationState.LOADING)
                  ? aliniyorState()
                  : (_qualityProvider.locationState == LocationState.DONE)
                      ? girildiState()
                      : [],
        ),
      ),
    );
  }

  List<Widget> girilmediState() {
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
              case LocationResultState.SERVICE_NOT_ALLOW:
                showCustomDialog(
                    context, 'Konum Servisi', 'Konum servisi çalışmamaktadır.');
                break;
              case LocationResultState.PERMISSION_NOT_ALLOW:
                showCustomDialog(
                    context, 'Konum İzni', 'Lütfen konum izini veriniz.');
                break;
              case LocationResultState.DONE:
                widget.onLocationComplete.call();
                break;
              default:
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
            widget.konum = await Navigator.push<LatLng>(
              context,
              MaterialPageRoute(
                builder: (context) => LocationPickPage(),
              ),
            );
            if (widget.konum != null) {
              setState(() {
                konumState = KonumState.GIRILDI;
                widget.onComplete.call();
              });
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
          onPressed: () {
            setState(() {
              konumState = KonumState.GIRILMEDI;
            });
          },
        ),
      ),
    ];
  }

  Future<bool> getLocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    LocationData _locationData = await location.getLocation();
    widget.konum = LatLng(_locationData.latitude, _locationData.longitude);
    return true;
  }

  showCustomDialog(BuildContext context, String title, String subTitle) {
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
