import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:meeproject/datamodels/user_location.dart';
import 'package:meeproject/services/location_service.dart';


class GeoCurrentLocation extends StatefulWidget {
  @override
  _GeoCurrentLocationState createState() => _GeoCurrentLocationState();
}

class _GeoCurrentLocationState extends State<GeoCurrentLocation> {

  Geolocator geolocator = Geolocator();
  Position userLocation;
  static double lat,long;

  LocationData currentLocation;
  Location location;
  
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    location = new Location();

    location.onLocationChanged.listen((LocationData cl) async {
      currentLocation = cl ;
    });
    // _getLocation().then((position) {
    //   userLocation = position;
    //   // lat = position.latitude;
    //   // long = position.longitude;
    // });
    

    // geolocator.getPositionStream(LocationOptions(
    //   accuracy: LocationAccuracy.best, timeInterval: 1000)).listen((position) async{
    //   _getLocation().then((value) {
    //     userLocation = value;
    //     // setState(() {
    //     //   userLocation = value;
    //     // });
    // });
    // });

    

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              userLocation == null
                  ? CircularProgressIndicator()
                  : Text("Location:" +
                      currentLocation.latitude.toString() +
                      " " +
                      currentLocation.longitude.toString()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    _updatePosition().then((value){
                      
                    });
                  },
                  color: Colors.blue,
                  child: Text(
                    "Get Location",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(initialCameraPosition: CameraPosition(
                  target: LatLng(currentLocation.altitude,currentLocation.longitude),
                  zoom: 15,),
                  myLocationEnabled: true,
                  compassEnabled: true,),
              ),
            ],
          ),
        ),
    );
  }

  // Future<Position> _getLocation() async {
  //   var currentLocation;
  //   try {
  //     currentLocation = await geolocator.getCurrentPosition(
  //         desiredAccuracy:LocationAccuracy.best);
  //   } catch (e) {
  //     currentLocation = null;
  //   }
  //   return currentLocation;
  // }

  Future<LocationData> _updatePosition() async {
    var clocation;
    try{
      clocation = await location.getLocation();
    }catch(e){
      clocation = null;
    }
    return clocation;
  }
  
}