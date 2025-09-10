import 'package:flutter/material.dart';
import '../../utils/layout.dart';
import './widgets/community/filter_bar.dart';
import './widgets/community/forum_posts_display.dart';
import './widgets/community/livestream_display.dart';
import './widgets/community/news_display.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // Filter tabs like Forum | Livestream | News
            CommunityFilterBar(),
            SizedBox(height: 24),

            // Section: Forum posts
            ForumPostsDisplay(),
            SizedBox(height: 32),

            // Section: Livestream highlights
            LivestreamDisplay(),
            SizedBox(height: 32),

            // Section: Community news
            CommunityNewsDisplay(),
          ],
        ),
      ),
    );
  }
}
