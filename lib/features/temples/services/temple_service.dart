import 'dart:developer'; // for log()
import 'package:firebase_database/firebase_database.dart';
import '../models/temples_type.dart';

class TempleService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref("temples");

  Future<List<Temple>> fetchAllTemples() async {
    log("📡 Fetching temples from Firebase Realtime Database...");

    final snapshot = await _dbRef.get();

    if (!snapshot.exists) {
      log("⚠️ No data found at /temples");
      return [];
    }

    // Print raw snapshot
    log("✅ Raw snapshot value: ${snapshot.value}");

    final data = snapshot.value as Map<dynamic, dynamic>;

    // Print number of temples fetched
    log("📊 Found ${data.length} temples in Firebase");

    // Loop over each temple for inspection
    data.forEach((key, value) {
      log("Temple key: $key → value: $value");
    });

    final temples = data.values
        .map((temple) => Temple.fromMap(Map<String, dynamic>.from(temple)))
        .toList();

    // Print mapped objects
    for (var temple in temples) {
      log("🏯 Temple mapped: ${temple.name}, ${temple.location}, ${temple.imageUrl}");
    }

    return temples;
  }
}
