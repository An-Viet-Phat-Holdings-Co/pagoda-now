import 'package:flutter/material.dart';
import 'product_detail_page.dart';
import 'widgets/product_card.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shop")),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        padding: const EdgeInsets.all(12),
        children: [
          ProductCard(
            name: "Buddha Statue",
            price: 120.0,
            imageUrl: "assets/images/statue.png",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductDetailPage(
                    name: "Buddha Statue",
                    price: 120.0,
                    description:
                        "A beautifully hand-carved Buddha statue for your altar.",
                  ),
                ),
              );
            },
          ),
          ProductCard(
            name: "Prayer Beads",
            price: 25.0,
            imageUrl: "assets/images/beads.png",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductDetailPage(
                    name: "Prayer Beads",
                    price: 25.0,
                    description:
                        "Traditional mala beads used for meditation and chanting.",
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
