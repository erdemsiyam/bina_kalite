import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

enum LocationState { INIT, LOADING, DONE }
enum DeviceLocationResultState {
  INIT,
  SERVICE_NOT_ALLOW,
  PERMISSION_NOT_ALLOW,
  DONE
}
enum ManuelLocationResultState { INIT, DONE }
enum CorrosionAnswer { INIT, YES, NO }
enum ShopAnswer { INIT, YES, NO }
enum ContiguousAnswer { INIT, YES, NO }
enum DoneState { INIT, LOADING, DONE }

class QualityProvider with ChangeNotifier {
  /* STATES */
  LocationState locationState = LocationState.INIT;
  DeviceLocationResultState deviceLocationResultState =
      DeviceLocationResultState.INIT;
  ManuelLocationResultState manuelLocationResultState =
      ManuelLocationResultState.INIT;
  DoneState doneState = DoneState.INIT;

  /* PROPERTIES */
  LatLng location;
  int age;
  int floors;
  int height;
  CorrosionAnswer corrosion;
  int area;
  ShopAnswer shop;
  ContiguousAnswer contiguous;

  Future<DeviceLocationResultState> getLocationFromDevice() async {
    Location locationService = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    locationState = LocationState.LOADING;
    notifyListeners();

    _serviceEnabled = await locationService.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await locationService.requestService();
      if (!_serviceEnabled) {
        deviceLocationResultState = DeviceLocationResultState.SERVICE_NOT_ALLOW;
        locationState = LocationState.INIT;
        notifyListeners();
        return deviceLocationResultState;
      }
    }

    _permissionGranted = await locationService.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await locationService.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        deviceLocationResultState =
            DeviceLocationResultState.PERMISSION_NOT_ALLOW;
        locationState = LocationState.INIT;
        notifyListeners();
        return deviceLocationResultState;
      }
    }

    LocationData _locationData = await locationService.getLocation();
    location = LatLng(_locationData.latitude, _locationData.longitude);

    deviceLocationResultState = DeviceLocationResultState.DONE;
    locationState = LocationState.DONE;
    notifyListeners();
    return deviceLocationResultState;
  }

  Future<ManuelLocationResultState> getLocationFromMap(LatLng latLng) {
    if (latLng != null) {
      location = latLng;
      locationState = LocationState.DONE;
      manuelLocationResultState = ManuelLocationResultState.DONE;
      notifyListeners();
    } else {
      locationState = LocationState.INIT;
      manuelLocationResultState = ManuelLocationResultState.INIT;
      notifyListeners();
    }
  }

  void deleteLocationInformation() {
    location = null;
    manuelLocationResultState = ManuelLocationResultState.INIT;
    deviceLocationResultState = DeviceLocationResultState.INIT;
    locationState = LocationState.INIT;
    notifyListeners();
  }

  void setAge(int val) {
    age = val;
    notifyListeners();
  }

  void setFloors(int val) {
    floors = val;
    notifyListeners();
  }

  void setHeight(int val) {
    height = val;
    notifyListeners();
  }

  void setCorrosion(CorrosionAnswer answer) {
    corrosion = answer;
    notifyListeners();
  }

  void setArea(int val) {
    area = val;
    notifyListeners();
  }

  void setShop(ShopAnswer answer) {
    shop = answer;
    notifyListeners();
  }

  void setContiguous(ContiguousAnswer answer) {
    contiguous = answer;
    notifyListeners();
  }
}
