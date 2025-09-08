import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../temples_detail_page.dart';
import '../accessories/temple_card.dart';
import '../../models/temples_type.dart';

class PopularTemplesDisplay extends StatelessWidget {
  const PopularTemplesDisplay({super.key});

  Future<List<Temple>> fetchPopularTemples() async {
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
    }).toList();

    temples.sort((a, b) => b.popularity.compareTo(a.popularity));
    return temples.take(5).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Chùa nổi bật",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 250,
          child: FutureBuilder<List<Temple>>(
            future: fetchPopularTemples(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("Không có chùa nổi bật."));
              }

              final temples = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(16),
                itemCount: temples.length,
                itemBuilder: (context, index) {
                  final temple = temples[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: TempleCard(
                      name: temple.name,
                      location: temple.location,
                      imageUrl: temple.imageUrl,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TemplesDetailPage(temple: temple),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
