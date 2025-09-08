import 'dart:developer'; // for log()
import 'package:flutter/material.dart';
import '../../temples_detail_page.dart';
import '../accessories/temple_card.dart';
import '../../services/temple_service.dart';
import '../../models/temples_type.dart';

class AllTemplesDisplay extends StatelessWidget {
  const AllTemplesDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final service = TempleService();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Tất cả Chùa",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),

        // Firebase Data
        FutureBuilder<List<Temple>>(
          future: service.fetchAllTemples(),
          builder: (context, snapshot) {
            // Loading state
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            // Error state
            if (snapshot.hasError) {
              log("❌ Firebase error: ${snapshot.error}");
              return Center(
                child: Text(
                  "❌ Error loading temples: ${snapshot.error}",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            // Empty state
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              log("⚠️ No temples found in Firebase.");
              return const Center(child: Text("Không có chùa nào."));
            }

            final temples = snapshot.data!;
            log("✅ Temples fetched: ${temples.length}");
            for (var t in temples) {
              log("🏯 ${t.name} — ${t.location} — ${t.imageUrl}");
            }

            return Column(
              children: [
                // Debug info at the top
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "📊 Loaded ${temples.length} temples",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Grid of temples
                GridView.builder(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: temples.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final temple = temples[index];

                    return TempleCard(
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
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
