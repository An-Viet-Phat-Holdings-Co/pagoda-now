import 'package:flutter/material.dart';
import '../../utils/layout.dart';
import './models/community_post.dart';
import './widgets/detail-page/all_imports.dart';

class CommunityDetailPage extends StatelessWidget {
  final CommunityPost post;

  const CommunityDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero image or banner
            if (post.imageUrl != null)
              CommunityHeroBanner(title: post.title, imageUrl: post.imageUrl!),
            const SizedBox(height: 16),

            // Author + metadata row
            CommunityInfoRow(post: post),
            const SizedBox(height: 16),

            // Main content
            CommunityPostContent(post: post),
            const SizedBox(height: 16),

            // Tabs for Comments / Related
            CommunityTabs(post: post),
            const SizedBox(height: 16),

            // Related community posts
            CommunityRelatedGrid(current: post),
          ],
        ),
      ),
    );
  }
}
