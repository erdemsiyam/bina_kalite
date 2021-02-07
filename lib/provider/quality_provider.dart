import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:ornek1/service/model/quality_request_model.dart';
import 'package:ornek1/service/model/quality_response_model.dart';
import 'package:ornek1/service/web_service.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/abstract/IPageView.dart';
import 'package:ornek1/ui/page/quality/quality_page/page_views/enum/enums.dart';

class QualityProvider with ChangeNotifier {
  /* STATES */
  LocationState locationState;
  DeviceLocationResultState deviceLocationResultState;
  ManuelLocationResultState manuelLocationResultState;
  DoneState doneState;

  /* PROPERTIES */
  List<IPageView> pageViews;
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
  int _currentPvIndex = 0;

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
    checkAll();
    return deviceLocationResultState;
  }

  ManuelLocationResultState getLocationFromMap(LatLng latLng) {
    if (latLng != null) {
      location = latLng;
      locationState = LocationState.DONE;
      manuelLocationResultState = ManuelLocationResultState.DONE;
      notifyListeners();
      checkAll();
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
    checkAll();
  }

  void setFloors(int val) {
    floors = val;
    notifyListeners();
    checkAll();
  }

  void setHeight(int val) {
    height = val;
    notifyListeners();
    checkAll();
  }

  void setCorrosion(CorrosionAnswer answer) {
    corrosion = answer;
    notifyListeners();
    checkAll();
  }

  void setArea(int val) {
    area = val;
    notifyListeners();
    checkAll();
  }

  void setShop(ShopAnswer answer) {
    shop = answer;
    notifyListeners();
    checkAll();
  }

  void setContiguous(ContiguousAnswer answer) {
    contiguous = answer;
    notifyListeners();
    checkAll();
  }

  void reset() {
    if (pageViews != null) {
      for (IPageView pv in pageViews) {
        pv.seenState = SeenState.NOT;
      }
      if (pageViews.length > 1) {
        pageViews[0].seenState = SeenState.NOW;
      }
    }
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
    _currentPvIndex = 0;
    notifyListeners();
    // maxProgress = 0;
    // currentProgress = 0;
  }

  void checkAll() {
    // Görülmeyen varsa çık, (1 tane seen olmamalı çünkü son ekran onda)
    if (pageViews.where((x) => x.seenState != SeenState.SEEN).length > 1)
      return;

    // Cevaplanmayan varsa çık
    for (IPageView pv in pageViews) {
      if (!pv.checkAnswer()) return;
    }

    // hepsi tamam ise, son ekran(seen olmayan), seen yapılır
    pageViews.where((x) => x.seenState != SeenState.SEEN).first.seenState =
        SeenState.SEEN;

    // Veriler başarılı alındı, sonuç gelir
    _getResult();

    // int loc_index = 0;
    // for (IPageViewSelection pv in pageViews) {
    //   if (++loc_index > index && loc_index < pageViews.length + 1) {
    //     return;
    //   }
    //   if (pv.check() && pv.answer != Answer.DONE) {
    //     pv.answer = Answer.DONE;
    //     notifyListeners();
    //     continue;
    //   } else if (!pv.check() && pv.answer != Answer.NOT_DONE) {
    //     pv.answer = Answer.NOT_DONE;
    //     notifyListeners();
    //     continue;
    //   }
    //   if (pv.answer == Answer.INIT) {
    //     notifyListeners();
    //     return;
    //   }
    // }

    // TODO : sayfayı 9.sayfaya götür
    // onSelectionComplete(loc_index).call();
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
    QualityResponseModel resModel;
    resModel = await WebService().getQuality(reqModel);

    if (resModel.httpCode == 200) {
      doneState = DoneState.DONE;
      result = resModel.result;
      resultText = resModel.resultText;
    } else {
      doneState = DoneState.FAIL;
    }
    notifyListeners();
  }

  // Common UI Changes
  setIcon(IconData iconData) {
    this.iconData = iconData;
    // notifyListeners();
  }

  setTitle(String title) {
    this.title = title;
    // notifyListeners();
  }

  setSeen(int newIndex) {
    pageViews[_currentPvIndex].seenState = SeenState.SEEN;
    pageViews[newIndex].seenState = SeenState.NOW;
    _currentPvIndex = newIndex;
    notifyListeners();
  }
}
