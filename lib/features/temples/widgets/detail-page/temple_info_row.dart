import 'package:flutter/material.dart';
import '../../models/temples_type.dart';

class TempleInfoRow extends StatelessWidget {
  final Temple temple;
  const TempleInfoRow({super.key, required this.temple});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Colors.purple),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(temple.location),
                Text("Cách bạn khoảng ${temple.distanceKm} km",
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.map, color: Colors.purple)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border, color: Colors.purple)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share, color: Colors.purple)),
        ],
      ),
    );
  }
}
