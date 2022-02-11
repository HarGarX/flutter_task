// ignore: file_names
// ignore: file_names
// ignore: file_names
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_task_remote/features/enter_wight/data/models/wight_model.dart';

// ignore: file_names
class WightDAO {
  // ignore: file_names
  final DatabaseReference wightsRef =
      // ignore: deprecated_member_use
      FirebaseDatabase.instance.reference().child('wights');
// ignore: file_names
  void saveMessage(Wight wight) {
    // ignore: file_names
    wightsRef.push().set(wight.toJson());
  }

  Query getWightQuery() {
    return wightsRef.orderByChild('wights');
  }
}
