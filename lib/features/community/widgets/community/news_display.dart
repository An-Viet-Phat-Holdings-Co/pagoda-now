import 'package:flutter/material.dart';

class CommunityNewsDisplay extends StatelessWidget {
  const CommunityNewsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Tin tức", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            title: const Text("Tin tức Phật giáo: Đại lễ Vu Lan"),
            subtitle: const Text("Ngày 15 tháng 7 âm lịch"),
            onTap: () {
              // TODO: link to news detail
            },
          ),
        ),
      ],
    );
  }
}
