import 'package:flutter/material.dart';
import 'post_detail_page.dart';
import 'widgets/post_card.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Community")),
      body: ListView(
        children: [
          PostCard(
            title: "Welcome to Pagoda Community",
            author: "Admin",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostDetailPage(
                    title: "Welcome to Pagoda Community",
                    content: "This is the first community post! 🌸",
                  ),
                ),
              );
            },
          ),
          PostCard(
            title: "Upcoming Dharma Talk",
            author: "Thay Minh",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostDetailPage(
                    title: "Upcoming Dharma Talk",
                    content: "Join us this weekend for a special Dharma talk 🙏",
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
