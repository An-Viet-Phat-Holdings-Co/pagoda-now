import 'package:flutter/material.dart';
import '../../utils/layout.dart';
import './widgets/accessories/filter_bar.dart';
import './widgets/main-page/popular_temples_display.dart';
import './widgets/main-page/all_temples_display.dart';

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
