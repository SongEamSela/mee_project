import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationUpdate extends StatefulWidget {
  @override
  _LocationUpdateState createState() => _LocationUpdateState();
}

class _LocationUpdateState extends State<LocationUpdate> {

  String _locationMessage = "";

  void _getCurrentLocation() async {

    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
       body: Align(
         child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text(_locationMessage),
               FlatButton(
                   onPressed: () {
                     _getCurrentLocation();
                   },
                   color: Colors.green,
                   child: Text("Find Location")
               )
             ]),
       )
    );
  }
}
