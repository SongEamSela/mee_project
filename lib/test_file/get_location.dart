import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:meeproject/services/location_service.dart';
import 'package:provider/provider.dart';

import '../datamodels/user_location.dart';

class GetLocation extends StatefulWidget {
  @override
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {

  Geolocator _geolocator = new Geolocator();
  Position userloaction;
  double lat,long;
  Future<Position> _future;


  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    _future = _getLocation() ;
    long = userloaction.longitude;

  }


  @override
  Widget build(BuildContext context) {
    UserLocation userLocation  = Provider.of<UserLocation>(context);
    lat = userLocation.longitude;
    long = userLocation.latitude;
    return Scaffold(
      body: Center(
        child: Text('Location lat: $lat, long: $long'),),
    );
  }

   Future<Position> _getLocation() async {
     var currentLocation;
     try {
       currentLocation = await _geolocator.getCurrentPosition();
     } catch (e) {
       currentLocation = null;
     }
     return currentLocation;
   }

}


//class GetLocation extends StatelessWidget {
//
//  @override
//  // ignore: must_call_super
//  void initState(){
//    super.initState();
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    UserLocation userLocation  = Provider.of<UserLocation>(context);
//    return Scaffold(
//      body: Center(
//        child: Text('Location lat: ${userLocation.latitude}, long: ${userLocation.longitude}'),),
//    );
//  }
//}