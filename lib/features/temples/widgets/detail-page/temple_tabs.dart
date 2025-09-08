import 'package:flutter/material.dart';

class TempleTabs extends StatelessWidget {
  const TempleTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.grey,
            tabs: [Tab(text: "Lịch Lễ"), Tab(text: "Sự kiện")],
          ),
          SizedBox(
            height: 180,
            child: TabBarView(
              children: [
                _buildList([
                  ("Lễ Phật Đản", "15/4 Âm lịch"),
                  ("Lễ Vu Lan", "15/7 Âm lịch"),
                ]),
                _buildList([
                  ("Khóa tu mùa hè", "01/07 - 15/07"),
                  ("Pháp thoại hàng tuần", "Thứ Bảy, 19:00"),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<(String, String)> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, i) {
        final (title, date) = items[i];
        return ListTile(
          leading: const Icon(Icons.event, color: Colors.purple),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(date),
        );
      },
    );
  }
}
