import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:ornek1/service/model/quality_request_model.dart';
import 'package:ornek1/service/model/quality_response_model.dart';
import 'package:ornek1/service/web_service.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/DotEnum.dart';

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
enum DoneState { INIT, LOADING, FAIL, DONE }
enum ResultAnswer { INIT, LOW_RISK, MEDIUM_RISK, HIGH_RISK, VERY_HIGH_RISK }

class QualityProvider with ChangeNotifier {
  /* STATES */
  LocationState locationState;
  DeviceLocationResultState deviceLocationResultState;
  ManuelLocationResultState manuelLocationResultState;
  DoneState doneState;

  /* PROPERTIES */
  LatLng location; // konum
  int age; // bina yaşı
  int floors; // kat sayısı
  int height; // bina yüksekliği
  CorrosionAnswer corrosion; // korozyon var mı
  int area; // oturum alanı
  ShopAnswer shop; // zemin katta dükkan var mı
  ContiguousAnswer contiguous; // bitişik nizam mı
  // Results
  String resultText;
  ResultAnswer result;
  // Common Parts
  String title;
  IconData iconData;

  QualityProvider() {
    reset();
  }

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

  ManuelLocationResultState getLocationFromMap(LatLng latLng) {
    if (latLng != null) {
      location = latLng;
      locationState = LocationState.DONE;
      manuelLocationResultState = ManuelLocationResultState.DONE;
      notifyListeners();
      return manuelLocationResultState;
    } else {
      locationState = LocationState.INIT;
      manuelLocationResultState = ManuelLocationResultState.INIT;
      notifyListeners();
      return manuelLocationResultState;
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

  void reset() {
    locationState = LocationState.INIT;
    deviceLocationResultState = DeviceLocationResultState.INIT;
    manuelLocationResultState = ManuelLocationResultState.INIT;
    doneState = DoneState.INIT;
    location = null;
    age = 0;
    floors = 1;
    height = 9;
    corrosion = CorrosionAnswer.INIT;
    area = 100;
    shop = ShopAnswer.INIT;
    contiguous = ContiguousAnswer.INIT;
    resultText = null;
    result = ResultAnswer.INIT;
    // maxProgress = 0;
    // currentProgress = 0;
  }

  void checkAll(List<IPageView> pageViews) {
    for (IPageViewSelection pv
        in pageViews.where((x) => x is IPageViewSelection)) {
      if (pv.dot != Dot.DONE) {
        notifyListeners();
        return;
      }
    }
    _getResult();
  }

  void _getResult() async {
    doneState = DoneState.LOADING;
    notifyListeners();

    QualityRequestModel reqModel = QualityRequestModel(
      location: location,
      age: age,
      floors: floors,
      height: height,
      corrosion: corrosion,
      area: area,
      shop: shop,
      contiguous: contiguous,
    );
    QualityResponseModel resModel = await WebService().getQuality(reqModel);

    if (resModel.httpCode == 200) {
      doneState = DoneState.LOADING;
    } else {
      doneState = DoneState.FAIL;
    }
    notifyListeners();
  }

  // Common UI Changes
  setIcon(IconData iconData) {
    this.iconData = iconData;
    notifyListeners();
  }

  setTitle(String title) {
    this.title = title;
    notifyListeners();
  }
}
