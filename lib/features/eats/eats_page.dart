import 'package:flutter/material.dart';
import 'eats_detail_page.dart';
import 'widgets/eat_card.dart';

class EatsPage extends StatelessWidget {
  const EatsPage({super.key}); // 👈 const is fine here, no fields

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Eats")),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          EatCard(
            title: "Vegetarian Pho",
            description: "A fragrant bowl of noodles with fresh herbs.",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EatsDetailPage( // 👈 remove const
                    title: "Vegetarian Pho",
                    description:
                        "A fragrant bowl of noodles with fresh herbs. Popular among monks and devotees for its simplicity and freshness.",
                  ),
                ),
              );
            },
          ),
          EatCard(
            title: "Banh Mi",
            description: "Crispy baguette with pickles and tofu.",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EatsDetailPage( // 👈 remove const
                    title: "Banh Mi",
                    description:
                        "Crispy baguette with pickles and tofu. A Vietnamese classic with a vegetarian twist.",
                  ),
                ),
              );
            },
          ),
          EatCard(
            title: "Spring Rolls",
            description: "Fresh rolls with veggies and peanut dip.",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EatsDetailPage( // 👈 remove const
                    title: "Spring Rolls",
                    description:
                        "Fresh rolls with veggies and peanut dip. A healthy snack option for mindful eating.",
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
