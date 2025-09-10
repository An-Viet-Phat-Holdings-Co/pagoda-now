import 'package:flutter/material.dart';
import '../../models/community_post.dart';

class CommunityInfoRow extends StatelessWidget {
  final CommunityPost post;
  const CommunityInfoRow({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(child: Icon(Icons.person)),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.author, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("Ngày đăng: ${post.date ?? "Hôm nay"}"),
          ],
        ),
      ],
    );
  }
}
