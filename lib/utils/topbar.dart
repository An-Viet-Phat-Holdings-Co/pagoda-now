import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final List<String> monkImages = [
    "https://images.unsplash.com/photo-1549887534-4e4b2f4b5c1c?q=80&w=1920&h=1080&fit=crop", 
    // Monk meditating
    "https://images.unsplash.com/photo-1504215680853-026ed2a45def?q=80&w=1920&h=1080&fit=crop", 
    // Praying hands close-up
    "https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=1920&h=1080&fit=crop", 
    // Temple silhouette with monk
  ];

  late String currentImage;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    currentImage = monkImages.first;

    // Rotate monk images every 2 minutes
    timer = Timer.periodic(const Duration(minutes: 2), (_) {
      setState(() {
        final available = monkImages.where((img) => img != currentImage).toList();
        currentImage = available[Random().nextInt(available.length)];
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: const [
              Icon(Icons.spa, color: Colors.purple, size: 32),
              SizedBox(width: 10),
              Text(
                "Pagoda",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ],
          ),

          // Menu items
          Row(
            children: const [
              _NavItem(label: "Chùa"),
              _NavItem(label: "Sự kiện"),
              _NavItem(label: "Cộng đồng"),
              _NavItem(label: "Cửa hàng"),
              _NavItem(label: "Từ thiện"),
            ],
          ),

          // Actions
          Row(
            children: [
              const Icon(Icons.search, size: 24),
              const SizedBox(width: 12),
              const Icon(Icons.notifications_outlined, size: 24),
              const SizedBox(width: 12),

              // Avatar with fallback
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.shade200,
                child: ClipOval(
                  child: Image.network(
                    currentImage,
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                    errorBuilder: (_, __, ___) {
                      return const Icon(Icons.person, color: Colors.grey);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  const _NavItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
