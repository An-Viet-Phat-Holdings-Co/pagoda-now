import 'package:flutter/material.dart';

class EventsSection extends StatelessWidget {
  const EventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final events = [
      {
        "title": "Khóa tu thiền cuối tuần",
        "date": "15 Tháng 8, 2025",
        "img": "https://images.unsplash.com/photo-1717241748642-4743593f3859?w=320&h=180"
      },
      {
        "title": "Pháp thoại về lòng từ bi",
        "date": "20 Tháng 8, 2025",
        "img": "https://images.unsplash.com/flagged/photo-1571972657458-083eea79555a?w=320&h=180"
      },
      {
        "title": "Chương trình từ thiện",
        "date": "25 Tháng 8, 2025",
        "img": "https://images.unsplash.com/photo-1593113616828-6f22bca04804?w=320&h=180"
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Sự kiện sắp tới",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: events.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final e = events[index];
              return SizedBox(
                width: 220,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(e["img"]!,
                          height: 120, width: double.infinity, fit: BoxFit.cover),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(e["date"]!,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(e["title"]!,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
