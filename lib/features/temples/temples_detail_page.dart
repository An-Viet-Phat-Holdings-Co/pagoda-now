import 'package:flutter/material.dart';

class TemplesDetailPage extends StatelessWidget {
  final String name;
  final String description;

  const TemplesDetailPage({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final images = [
      "https://images.unsplash.com/photo-1646939614046-b977204e65e7",
      "https://images.unsplash.com/photo-1730211718552-add67e351764",
      "https://images.unsplash.com/photo-1679201504529-4fa9146c6b1c",
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(name),
          backgroundColor: Colors.purple,
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.yellow,
            tabs: [
              Tab(text: "Giới thiệu"),
              Tab(text: "Hoạt động"),
              Tab(text: "Hình ảnh"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: About
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            // Tab 2: Activities placeholder
            const Center(
              child: Text("Danh sách các hoạt động tại chùa..."),
            ),
            // Tab 3: Photos carousel
            PageView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) => Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
