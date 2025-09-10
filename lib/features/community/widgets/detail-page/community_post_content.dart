import 'package:flutter/material.dart';
import '../../models/community_post.dart';

class CommunityPostContent extends StatelessWidget {
  final CommunityPost post;
  const CommunityPostContent({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Text(
      post.content,
      style: const TextStyle(fontSize: 16, height: 1.6),
    );
  }
}
