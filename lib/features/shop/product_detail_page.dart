import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String name;
  final double price;
  final String description;

  const ProductDetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              color: Colors.grey[300], // placeholder for product image
              alignment: Alignment.center,
              child: Text("Image", style: TextStyle(color: Colors.grey[700])),
            ),
            const SizedBox(height: 20),
            Text(name,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("\$${price.toStringAsFixed(2)}",
                style: const TextStyle(
                    fontSize: 18, color: Colors.green, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            Text(description, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Added to cart")),
                  );
                },
                child: const Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
