import 'package:flutter/material.dart';

class TempleHeroCarousel extends StatelessWidget {
  final String title;
  final List<String> images;
  const TempleHeroCarousel({super.key, required this.title, required this.images});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          images.isNotEmpty ? images.first : "https://picsum.photos/400",
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [Shadow(color: Colors.black54, blurRadius: 6)],
            ),
          ),
        ),
      ],
    );
  }
}
