import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController mapController;
  Location location = Location();
  Position userlocation;
  static LatLng latLng;
  Map<String, double> userLocation;

  @override
  void initState() {
    super.initState();
    location.onLocationChanged.listen((location) async {
      if(location == null){
        print("No location detected");
      }
      else{
        
      }
      // marker = await mapController?.addMarker(MarkerOptions(
      //   position: LatLng(location["latitude"], location["longitude"]),
      // ));
      // mapController?.moveCamera(
      //   CameraUpdate.newCameraPosition(
      //     CameraPosition(
      //       target: LatLng(
      //         location["latitude"],
      //         location["longitude"],
      //       ),
      //       zoom: 20.0,
      //     ),
      //   ),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   child: GoogleMap(
          //     onMapCreated: (GoogleMapController controller) {
          //       mapController = controller;
          //     },
          //     // options: GoogleMapOptions(
          //     //   cameraPosition: CameraPosition(
          //     //     target: LatLng(37.4219999, -122.0862462),
          //     //   ),
          //     //   myLocationEnabled: true,
          //     // ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Future<Map<String, double>> _getLocation() async {
    var currentLocation = <String, double>{};
    try {
      currentLocation = (await location.getLocation()) as Map<String, double>;
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

}