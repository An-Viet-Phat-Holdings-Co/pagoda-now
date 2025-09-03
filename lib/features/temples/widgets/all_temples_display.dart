import 'package:flutter/material.dart';
import '../mock_db/temples_data.dart';  // ✅ absolute import
import '../temples_detail_page.dart';
import 'temple_card.dart';

class AllTemplesDisplay extends StatelessWidget {
  const AllTemplesDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Tất cả Chùa",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        GridView.builder(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: allTemples.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final temple = allTemples[index];
            return TempleCard(
              name: temple["name"]!,
              location: temple["location"]!,
              imageUrl: temple["image"]!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TemplesDetailPage(
                      name: temple["name"]!,
                      description: "Thông tin chi tiết về ${temple["name"]}.",
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
