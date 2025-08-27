import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"title": "Chùa", "icon": Icons.temple_buddhist, "route": "/temples"},
      {"title": "Sự kiện", "icon": Icons.event, "route": "/events"},
      {"title": "Cộng đồng", "icon": Icons.people, "route": "/community"},
      {"title": "Cửa hàng", "icon": Icons.store, "route": "/shop"},
      {"title": "Từ thiện", "icon": Icons.favorite, "route": "/charity"},
      {"title": "Món chay", "icon": Icons.eco, "route": "/eats"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Khám phá các danh mục",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(64),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 120,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final cat = categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, cat["route"] as String);
              },
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(cat["icon"] as IconData,
                        color: Colors.purple, size: 36),
                    const SizedBox(height: 8),
                    Text(cat["title"] as String,
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
