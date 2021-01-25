import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPickPage extends StatefulWidget {
  @override
  _LocationPickPageState createState() => _LocationPickPageState();
}

class _LocationPickPageState extends State<LocationPickPage> {
  GoogleMapController mapController;
  String searchAddr;
  List<Marker> markers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(39.925533, 32.866287),
              zoom: 10.0,
            ),
            markers: markers.toSet(),
            onTap: pickLocation,
          ),
          Positioned(
            top: 30,
            right: 15,
            left: 15,
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Adres Giriniz',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 25, top: 10, bottom: 6),
                  suffix: IconButton(
                    icon: Icon(Icons.search),
                    iconSize: 20,
                    onPressed: searchNavigate,
                    color: Colors.green,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchAddr = value;
                  });
                },
              ),
            ),
          ),
          (markers.length > 0)
              ? Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: RaisedButton(
                    child: Text('Seçili Konumu Al'),
                    onPressed: () {
                      Navigator.pop<LatLng>(context, markers[0].position);
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void searchNavigate() {}
  void pickLocation(LatLng konum) {
    setState(() {
      if (markers.length > 0) {
        markers.clear();
      }
      markers.add(Marker(position: konum, markerId: MarkerId('1')));
    });
  }
}
