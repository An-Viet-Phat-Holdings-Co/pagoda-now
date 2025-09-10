import 'package:flutter/material.dart';
import '../../models/community_post.dart';

class CommunityTabs extends StatelessWidget {
  final CommunityPost post;
  const CommunityTabs({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: const [
          TabBar(
            tabs: [
              Tab(text: "Bình luận"),
              Tab(text: "Bài viết liên quan"),
            ],
          ),
          SizedBox(
            height: 200, // placeholder
            child: TabBarView(
              children: [
                Center(child: Text("Danh sách bình luận...")),
                Center(child: Text("Bài viết liên quan...")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
