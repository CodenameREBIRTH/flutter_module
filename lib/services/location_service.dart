import 'dart:async';

import 'package:flutter_module/datamodels/user_location.dart';
import 'package:location/location.dart';

class LocationServices {
  UserLocation currentLocation;

  Location location = Location();
  StreamController<UserLocation> locationController =
      StreamController<UserLocation>.broadcast();

  Stream<UserLocation> get locationStream => locationController.stream;

  LocationServices() {
    location.requestPermission().then((granted){
      if(granted){
        location.onLocationChanged().listen((locationData){
          if(locationData != null) {
            locationController.add(UserLocation(
              locationData.latitude, locationData.longitude
            ));};
          });
        }});
      }


  Future<UserLocation> getLocation() async {
    try{
      LocationData userlocation = await location.getLocation();
      currentLocation = UserLocation(
        userlocation.latitude, userlocation.longitude
      );
    }catch(e) {
      print('$e');
    }
    return currentLocation;
  }
}