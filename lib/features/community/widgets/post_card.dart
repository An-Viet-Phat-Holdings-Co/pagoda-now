import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String author;
  final VoidCallback onTap;

  const PostCard({
    super.key,
    required this.title,
    required this.author,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("by $author"),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
