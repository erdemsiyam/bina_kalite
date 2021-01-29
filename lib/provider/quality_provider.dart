import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

enum LocationState { NOT_DONE, LOADING, DONE }
enum DoneState { NOT_DONE, DONE }
enum LocationResultState { INIT, SERVICE_NOT_ALLOW, PERMISSION_NOT_ALLOW, DONE }

class QualityProvider with ChangeNotifier {
  /* STATES */
  LocationState locationState = LocationState.NOT_DONE;
  DoneState doneState = DoneState.NOT_DONE;
  LocationResultState locationResultState = LocationResultState.INIT;

  /* PROPERTIES */
  LatLng konum = null;
  int binaYasi = 0;
  int katSayisi = 1;
  int binaYuksekligi = 10;
  int korozyonVarMi = 0;
  int binaOturumAlani = 100;
  int zemindeMagazaVarMi = 0;
  int binaBitisikNizamMi = 0;
  bool sonucErisildi = false;

  Future<LocationResultState> getLocationFromDevice() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    locationState = LocationState.LOADING;
    notifyListeners();

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        locationResultState = LocationResultState.SERVICE_NOT_ALLOW;
        locationState = LocationState.NOT_DONE;
        notifyListeners();
        return locationResultState;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        locationResultState = LocationResultState.PERMISSION_NOT_ALLOW;
        locationState = LocationState.NOT_DONE;
        notifyListeners();
        return locationResultState;
      }
    }

    LocationData _locationData = await location.getLocation();
    konum = LatLng(_locationData.latitude, _locationData.longitude);

    locationResultState = LocationResultState.DONE;
    locationState = LocationState.DONE;
    notifyListeners();
    return locationResultState;
  }
}
