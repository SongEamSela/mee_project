import 'package:cloud_firestore/cloud_firestore.dart';

class LocationRecord {

  final String rid;

  LocationRecord(this.rid);

  final CollectionReference locationTracingCollection = Firestore.instance.collection('UserLocationHistory');
  Future updateUserData (String deviceID ,double lat, double long) async {
    return await locationTracingCollection.document(rid).setData({
      'Device ID': deviceID,
      'Latitude': lat,
      'Longitude': long,
    });
  }

  Stream<QuerySnapshot> get data {
    return locationTracingCollection.snapshots();
  }

}