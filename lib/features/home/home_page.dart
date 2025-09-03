import 'package:flutter/material.dart';
import '../../utils/layout.dart';
import 'widgets/categories_section.dart';
import 'widgets/personalized_section.dart';
// import 'widgets/events_section.dart';
import 'widgets/news_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      isHome: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CategoriesSection(), 
          SizedBox(height: 32),
          PersonalizedSection(),
          SizedBox(height: 32),
          // EventsSection(),
          SizedBox(height: 32),
          NewsSection(),
        ],
      ),
    );
  }
}
