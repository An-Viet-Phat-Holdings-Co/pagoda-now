import 'package:flutter/material.dart';
import 'charity_detail_page.dart';
import 'widgets/charity_card.dart';

class CharityPage extends StatelessWidget {
  const CharityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Charity & Giving")),
      body: ListView(
        children: [
          CharityCard(
            title: "Food Donation Drive",
            description: "Help us distribute meals to the needy 🍲",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CharityDetailPage(
                    title: "Food Donation Drive",
                    content: "We are organizing a food drive this weekend to support families in need. Join us in spreading kindness 🙏",
                  ),
                ),
              );
            },
          ),
          CharityCard(
            title: "Temple Renovation Fund",
            description: "Support our temple maintenance and renovations 🏯",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CharityDetailPage(
                    title: "Temple Renovation Fund",
                    content: "Contribute to the renovation of our community temple. Every donation counts 🌸",
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
