import 'package:flutter/material.dart';

class LivestreamDisplay extends StatelessWidget {
  const LivestreamDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Phát trực tiếp", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.videocam, color: Colors.red),
            title: const Text("Livestream: Thiền sáng Chủ nhật"),
            subtitle: const Text("Bắt đầu lúc 7:00 AM"),
            onTap: () {
              // TODO: link to livestream player page
            },
          ),
        ),
      ],
    );
  }
}
