import 'package:flutter/material.dart';
import '../../models/community_post.dart';
import '../../community_detail_page.dart';

class CommunityRelatedGrid extends StatelessWidget {
  final CommunityPost current;
  const CommunityRelatedGrid({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    final related = [
      CommunityPost(
        title: "Pháp thoại trực tuyến",
        author: "Thích Tâm",
        content: "Buổi pháp thoại dành cho tất cả mọi người 🌼",
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Bài viết liên quan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: related.map((post) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CommunityDetailPage(post: post)),
                );
              },
              child: SizedBox(
                width: 160,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(post.title, style: const TextStyle(fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
