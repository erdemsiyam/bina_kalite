import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ornek1/provider/quality_provider.dart';
import 'package:ornek1/ui/constants/text_styles.dart';
import 'package:ornek1/ui/page/quality/location_pick_page/location_pick_page.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/enums.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/widget/icon_part_widget.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/widget/title_part_widget.dart';
import 'package:ornek1/ui/utils/Responsive.dart';
import 'package:provider/provider.dart';

class Pv01Location extends StatelessWidget
    with Responsive
    implements IPageView {
  QualityProvider _qualityProvider;
  @override
  IconData iconData = Icons.location_on;
  @override
  String title = 'Konum';
  @override
  SeenState seenState = SeenState.NOW;
  @override
  double shortestSide;

  final void Function() onLocationComplete;

  Pv01Location({@required this.onLocationComplete});
  @override
  Widget build(BuildContext context) {
    _qualityProvider = context.watch<QualityProvider>();
    _qualityProvider.setIcon(iconData);
    _qualityProvider.setTitle(title);
    shortestSide = MediaQuery.of(context).size.shortestSide;
    deviceType = shortestSide;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconPartWidget(
          iconData: iconData,
          shortestSide: shortestSide,
        ),
        TitlePartWidget(
          title: title,
          shortestSide: shortestSide,
        ),
        (_qualityProvider.locationState == LocationState.INIT)
            ? girilmediState(context)
            : (_qualityProvider.locationState == LocationState.LOADING)
                ? aliniyorState()
                : (_qualityProvider.locationState == LocationState.DONE)
                    ? girildiState()
                    : Container(),
      ],
    );
  }

  @override
  bool checkAnswer() {
    return _qualityProvider.location != null;
  }

  Widget girilmediState(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: fit(30, 50, 60, 110),
            ),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(
                vertical: fit(16, 20, 26, 32),
              ),
              child: Text(
                'Şu anki Konumum',
                style: fit(
                  tsButton2_350,
                  tsButton2_450,
                  tsButton2_550,
                  tsButton2_bigest,
                ),
              ),
              color: Colors.blue[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  fit(16, 20, 26, 32),
                ),
              ),
              onPressed: () async {
                switch (await _qualityProvider.getLocationFromDevice()) {
                  case DeviceLocationResultState.SERVICE_NOT_ALLOW:
                    _showCustomDialog(context, 'Konum Servisi',
                        'Konum servisi çalışmamaktadır.');
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
            height: fit(20, 30, 40, 80),
          ),
          Center(
            child: GestureDetector(
              child: Text(
                'Haritadan Seç',
                style: fit(
                  tsTextButton2_350,
                  tsTextButton2_450,
                  tsTextButton2_550,
                  tsTextButton2_bigest,
                ),
              ),
              onTap: () async {
                _qualityProvider.getLocationFromMap(
                  await Navigator.push<LatLng>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationPickPage(),
                    ),
                  ),
                );
                switch (_qualityProvider.manuelLocationResultState) {
                  case ManuelLocationResultState.INIT:
                    _showCustomDialog(
                        context, 'Konum Seçimi', 'Konum seçilemedi.');
                    break;
                  case ManuelLocationResultState.DONE:
                    onLocationComplete.call();
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget aliniyorState() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: SizedBox(
              height: fit(30, 50, 70, 100),
              width: fit(30, 50, 70, 100),
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue[400],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget girildiState() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Icon(
              Icons.done,
              size: fit(60, 70, 100, 140),
              color: Colors.green[200],
            ),
          ),
          Center(
            child: IconButton(
              icon: Icon(Icons.refresh),
              iconSize: fit(24, 30, 40, 50),
              color: Colors.grey[200],
              onPressed: () => _qualityProvider.deleteLocationInformation(),
            ),
          ),
        ],
      ),
    );
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
