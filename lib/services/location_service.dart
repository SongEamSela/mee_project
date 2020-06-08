import 'dart:async';

import 'package:location/location.dart';
import 'package:meeproject/datamodels/user_location.dart';

class LocationService{
  UserLocation _currentLocation;

  Location location = Location();

  StreamController<UserLocation> locationController = 
    StreamController<UserLocation>.broadcast();

    LocationService(){
      location.requestPermission().then((granted){
        if(granted != null){
          location.onLocationChanged.listen((locationData){
            if(locationData != null){
              locationController.add(UserLocation(
                latitude: locationData.altitude,
                longitude: locationData.longitude));
            }
          });
        }
      });
    }

     Stream<UserLocation> get locationStream 
     {
       return locationController.stream;
     }

  Future<UserLocation> getLocation() async {
    try{
      var userlocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userlocation.altitude,
        longitude: userlocation.longitude
        );
    }catch(e){
      print('Colud not get the location');
    }

    return _currentLocation;
  }
}