import 'package:flutter/material.dart';

class TemplesMapPage extends StatelessWidget {
  const TemplesMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map background placeholder
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://spark-builder.s3.us-east-1.amazonaws.com/image/2025/8/13/66d2824f-870f-4aba-b38c-1865484e5837.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Example markers
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            left: MediaQuery.of(context).size.width * 0.5,
            child: IconButton(
              icon: const Icon(Icons.temple_buddhist, color: Colors.purple, size: 40),
              onPressed: () {
                Navigator.pushNamed(context, '/templeDetail');
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: MediaQuery.of(context).size.width * 0.6,
            child: IconButton(
              icon: const Icon(Icons.account_balance, color: Colors.purple, size: 36),
              onPressed: () {
                Navigator.pushNamed(context, '/templeDetail');
              },
            ),
          ),

          // Back Button
          Positioned(
            top: 40,
            left: 16,
            child: ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text("Quay lại Danh sách"),
            ),
          ),

          // Filter Button
          Positioned(
            top: 40,
            right: 16,
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: filter temples by type
              },
              icon: const Icon(Icons.filter_list),
              label: const Text("Chủng loại Chùa"),
            ),
          ),
        ],
      ),
    );
  }
}
