import 'package:flutter/material.dart';
import '../../utils/layout.dart';
import './models/temples_type.dart';
import './widgets/detail-page/all_imports.dart';

class TemplesDetailPage extends StatelessWidget {
  final Temple temple;
  const TemplesDetailPage({super.key, required this.temple});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TempleHeroCarousel(title: temple.name, images: [temple.imageUrl]),
            const SizedBox(height: 16),
            TempleInfoRow(temple: temple),
            const SizedBox(height: 16),
            TempleIntro(temple: temple),
            const SizedBox(height: 16),
            TempleTabs(),
            const SizedBox(height: 16),
            TempleRelatedGrid(current: temple),
          ],
        ),
      ),
    );
  }
}
