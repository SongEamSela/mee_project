import 'package:flutter/material.dart';
import 'package:meeproject/Screens/locationscreen.dart';
import 'package:meeproject/services/location_service.dart';
import 'package:meeproject/test_file/location_update.dart';
import 'package:meeproject/test_file/show_current_location.dart';
import 'package:provider/provider.dart';
import 'Screens/signupscreen.dart';
import 'datamodels/user_location.dart';
import 'test_file/get_location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          theme: ThemeData(
          primarySwatch: Colors.blue,
          ),
          title: 'Flutter Demo',
          home: SignupScreen(),
    );
  }
}




// class _MyAppState extends State<MyApp> {
//   final Map<String, Marker> _markers = {};
//   Future<void> _onMapCreated(GoogleMapController controller) async {
//     final googleOffices = await locations.getGoogleOffices();
//     setState(() {
//       _markers.clear();
//       for (final office in googleOffices.offices) {
//         final marker = Marker(
//           markerId: MarkerId(office.name),
//           position: LatLng(office.lat, office.lng),
//           infoWindow: InfoWindow(
//             title: office.name,
//             snippet: office.address,
//           ),
//         );
//         _markers[office.name] = marker;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Google Office Locations'),
//             backgroundColor: Colors.green[700],
//           ),
//           body: GoogleMap(
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: const LatLng(0, 0),
//               zoom: 2,
//             ),
//             markers: _markers.values.toSet(),
//           ),
//         ),
//       );
// }