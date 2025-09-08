import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../models/temples_type.dart';

class TempleRelatedGrid extends StatelessWidget {
  final Temple current;
  const TempleRelatedGrid({super.key, required this.current});

  Future<List<Temple>> fetchRelatedTemples() async {
    final db = FirebaseDatabase.instance.ref().child('temples');
    final snapshot = await db.get();

    if (!snapshot.exists || snapshot.value == null) return [];

    final rawData = snapshot.value as Map<dynamic, dynamic>;

    final temples = rawData.entries.map((entry) {
      final t = Map<dynamic, dynamic>.from(entry.value as Map);
      return Temple(
        name: t['name']?.toString() ?? '',
        description: t['description']?.toString() ?? '',
        location: t['location']?.toString() ?? '',
        distanceKm: (t['distanceKm'] != null)
            ? (t['distanceKm'] is int
                ? (t['distanceKm'] as int).toDouble()
                : t['distanceKm'] as double)
            : 0.0,
        imageUrl: t['imageUrl']?.toString() ?? '',
        popularity: (t['popularity'] != null)
            ? (t['popularity'] is int
                ? t['popularity'] as int
                : (t['popularity'] as double).toInt())
            : 0,
      );
    }).where((t) => t.name != current.name).take(4).toList();

    return temples;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Temple>>(
      future: fetchRelatedTemples(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("Không có chùa liên quan."));
        }

        final related = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: related.map((t) {
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(
                          t.imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(t.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text(t.location,
                              style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
