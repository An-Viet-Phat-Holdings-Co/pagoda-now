import 'package:flutter/material.dart';

class CommunityFilterBar extends StatelessWidget {
  const CommunityFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChoiceChip(
          label: const Text("Diễn đàn"),
          selected: true,
          onSelected: (_) {},
        ),
        const SizedBox(width: 8),
        ChoiceChip(
          label: const Text("Phát trực tiếp"),
          selected: false,
          onSelected: (_) {},
        ),
        const SizedBox(width: 8),
        ChoiceChip(
          label: const Text("Tin tức"),
          selected: false,
          onSelected: (_) {},
        ),
      ],
    );
  }
}
