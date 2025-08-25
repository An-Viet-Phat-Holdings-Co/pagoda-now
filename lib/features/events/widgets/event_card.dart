import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final VoidCallback onTap;

  const EventCard({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date, style: const TextStyle(color: Colors.grey)),
            Text(location, style: const TextStyle(color: Colors.blueGrey)),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
