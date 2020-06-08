import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class FireMap extends StatefulWidget {
  @override
  _FireMapState createState() => _FireMapState();
}

class _FireMapState extends State<FireMap> {

static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(11.5500, 104.9167),
    zoom: 10,
  );

  CameraPosition _position = _kInitialPosition;
  GoogleMapController _mapController;
  Location location = new Location();
  LocationData _lastMapPosition;

  Firestore firestore = Firestore.instance;
  Geoflutterfire geo = Geoflutterfire();

  @override
  void initState(){
    super.initState();
    location.onLocationChanged..listen((location) async{
      
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(initialCameraPosition: _position,
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          compassEnabled: true,
          onCameraMove: _updateCameraPosition,
          ),
          
        ],
      ),
    );
  }
  _onMapCreated(GoogleMapController controller){
    setState(() {
      _mapController = controller;
      
    });
  }

  _updateCameraPosition(CameraPosition position){
    setState(() {
      _position = position;
    });
  }

  // void _getLocation() async {
  //   if (await location.hasPermission() != null) {
  //       LocationData pos = await location.getLocation();
  //       setState(() {
  //           print(pos.runtimeType);
  //           _lastMapPosition = pos;
  //       });
  //   } else {
  //       await location.requestPermission();
  //   }
  // }

  // _animateToUser() async {
  //   var pos = await Location.getLocation();
  //   _mapController.animateCamera(CameraUpdate.newCameraPosition(
  //     CameraPosition(target: LatLng(pos['latitude'],pos['longitude']),
  //     zoom: 17.0,)
  //     )
  //   );
  // }
  
}