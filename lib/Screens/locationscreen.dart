import 'dart:async';

import 'package:device_id/device_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meeproject/location_database/locationrecord.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<LocationData> locationData = [];

  TextStyle textStyleH1 =
  TextStyle(color: Colors.black, fontWeight: FontWeight.bold);
  Completer<GoogleMapController> _controller = Completer();

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  Timer timer;
  bool loading = false;
  int _rid = 0;

  String _deviceID = 'Unknown';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDeviceId();
    timer =
        Timer.periodic(Duration(seconds: 10), (timer) {
          _getCurrentLocation();
          _rid++;
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  Future<void> initDeviceId() async{
    String deviceId ;
    try{
      deviceId = await DeviceId.getID;
    } on PlatformException catch(e){
      print(e.message);
    }
    if(!mounted) return;

    setState(() {
      _deviceID = deviceId;
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Tracking Location',
          style: textStyleH1,
        ),
      ),
      body: _currentPosition == null ? Center(child: CircularProgressIndicator(),) : Column(
        children: <Widget>[
          Expanded(
              flex: 7,
              child: GoogleMap(
                mapType: MapType.normal,
                mapToolbarEnabled: false,
                scrollGesturesEnabled: true,
                zoomGesturesEnabled: true,
                trafficEnabled: true,
                compassEnabled: true,
                indoorViewEnabled: true,
                rotateGesturesEnabled: true,
                tiltGesturesEnabled: true,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      _currentPosition.latitude, _currentPosition.longitude),
                  zoom: 14.4746,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              )),
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Tracking Current location',
                    style: textStyleH1,
                  ),
                  Expanded(
                      child:  ListView.builder(
                          itemCount: locationData.length,
                          itemBuilder: (BuildContext context, index) {
                            int indexRow = index + 1;
                            return ListTile(
                              leading: Text(indexRow.toString()),
                              title: Text(locationData[index].adr + ""
                                  "\nLat: " +
                                  locationData[index].lat +
                                  " Log: " +
                                  locationData[index].log),
                            );
                          }))
                ],
              ))
        ],
      ),
    );
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _recordLocation(_deviceID, _currentPosition.latitude, _currentPosition.longitude);
        _getAddressFromLatLng(position);
      });
    }).catchError((e) {
      print(e);
    });
  }

  _recordLocation (String did ,double lat,double long) async{
    try{
      await LocationRecord(_rid.toString()).updateUserData(_deviceID,lat, long);
    }catch(e){
      print(e);
    }
  }

  _getAddressFromLatLng(position) async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        locationData.add(LocationData("${place.locality}, ${place
            .postalCode}, ${place.country}",position.latitude.toString(), position
            .longitude.toString()));
        print(locationData);

      });
    } catch (e) {
      print(e);
    }
  }
}


class LocationData {
  String adr;
  String lat;
  String log;
  LocationData(this.adr,this.lat, this.log);
}