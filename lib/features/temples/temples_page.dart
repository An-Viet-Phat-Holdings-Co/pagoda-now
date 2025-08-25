import 'package:flutter/material.dart';
import 'temples_detail_page.dart';
import 'widgets/temple_card.dart';

class TemplesPage extends StatelessWidget {
  const TemplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Temples")),
      body: ListView(
        children: [
          TempleCard(
            name: "Giac Lam Pagoda",
            location: "Ho Chi Minh City",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TemplesDetailPage(
                    name: "Giac Lam Pagoda",
                    description:
                        "One of the oldest temples in Saigon, built in 1744. Known for its historical significance and peaceful atmosphere.",
                  ),
                ),
              );
            },
          ),
          TempleCard(
            name: "Tran Quoc Pagoda",
            location: "Hanoi",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TemplesDetailPage(
                    name: "Tran Quoc Pagoda",
                    description:
                        "The oldest Buddhist temple in Hanoi, located on West Lake, dating back to the 6th century.",
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
