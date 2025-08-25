import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  Future<void> addData(String path, Map<String, dynamic> data) async {
    await _db.collection(path).add(data);
  }

  Stream<QuerySnapshot> getData(String path) {
    return _db.collection(path).snapshots();
  }
}
