import 'package:flutter/material.dart';

class EventsDetailPage extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String description;

  const EventsDetailPage({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 6),
            Text(location,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey)),
            const SizedBox(height: 20),
            Text(description, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("You are registered!")),
                  );
                },
                child: const Text("Register for Event"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
