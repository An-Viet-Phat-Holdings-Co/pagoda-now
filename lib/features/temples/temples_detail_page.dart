import 'package:flutter/material.dart';

class TemplesDetailPage extends StatelessWidget {
  final String name;
  final String description;

  const TemplesDetailPage({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(description, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
