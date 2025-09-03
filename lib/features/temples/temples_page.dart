import 'package:flutter/material.dart';
import '../../utils/layout.dart';
import 'widgets/filter_bar.dart';
import 'widgets/popular_temples_display.dart';
import 'widgets/all_temples_display.dart';

class TemplesPage extends StatelessWidget {
  const TemplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          FilterBar(),
          SizedBox(height: 24),
          PopularTemplesDisplay(),
          SizedBox(height: 32),
          AllTemplesDisplay(),
        ],
      ),
    );
  }
}
