import 'package:flutter/material.dart';
import '../../community_detail_page.dart';
import '../../models/community_post.dart';

class ForumPostsDisplay extends StatelessWidget {
  const ForumPostsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = [
      CommunityPost(
        title: "Chào mừng đến với Diễn đàn",
        author: "Admin",
        content: "Đây là bài viết đầu tiên của cộng đồng 🌸",
      ),
      CommunityPost(
        title: "Pháp thoại cuối tuần",
        author: "Thầy Minh",
        content: "Mời quý vị tham gia buổi pháp thoại vào chủ nhật 🙏",
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Diễn đàn", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...posts.map((post) => Card(
              child: ListTile(
                title: Text(post.title),
                subtitle: Text("Tác giả: ${post.author}"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommunityDetailPage(post: post),
                    ),
                  );
                },
              ),
            )),
      ],
    );
  }
}
