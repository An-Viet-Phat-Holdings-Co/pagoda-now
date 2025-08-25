import 'package:flutter/material.dart';

class TempleCard extends StatelessWidget {
  final String name;
  final String location;
  final VoidCallback onTap;

  const TempleCard({
    super.key,
    required this.name,
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: ListTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(location),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
