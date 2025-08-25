import 'package:flutter/material.dart';
import '../community/community_page.dart';
import '../charity/charity_page.dart';
import '../temples/temples_page.dart';
import '../shop/shop_page.dart';
import '../events/events_page.dart';
import 'widgets/home_section_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagoda Now"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            HomeSectionButton(
              title: "Community",
              icon: Icons.people,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CommunityPage()),
              ),
            ),
            HomeSectionButton(
              title: "Charity",
              icon: Icons.volunteer_activism,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CharityPage()),
              ),
            ),
            HomeSectionButton(
              title: "Temples",
              icon: Icons.temple_buddhist,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TemplesPage()),
              ),
            ),
            HomeSectionButton(
              title: "Shop",
              icon: Icons.store,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ShopPage()),
              ),
            ),
            HomeSectionButton(
              title: "Events",
              icon: Icons.event,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const EventsPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
