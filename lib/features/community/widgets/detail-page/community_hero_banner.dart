import 'package:flutter/material.dart';

class CommunityHeroBanner extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CommunityHeroBanner({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(imageUrl, fit: BoxFit.cover),
        ),
        const SizedBox(height: 12),
        Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
