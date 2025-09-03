import 'package:flutter/material.dart';
import '../mock_db/temples_data.dart';  // ✅ absolute import
import '../temples_detail_page.dart';
import 'temple_card.dart';

class PopularTemplesDisplay extends StatelessWidget {
  const PopularTemplesDisplay({super.key});

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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(16),
            itemCount: popularTemples.length,
            itemBuilder: (context, index) {
              final temple = popularTemples[index];
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: TempleCard(
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
