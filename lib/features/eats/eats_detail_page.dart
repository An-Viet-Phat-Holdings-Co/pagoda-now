import 'package:flutter/material.dart';

class EatsDetailPage extends StatelessWidget {
  final String title;
  final String description;

  const EatsDetailPage({ // 👈 you can keep const here
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
