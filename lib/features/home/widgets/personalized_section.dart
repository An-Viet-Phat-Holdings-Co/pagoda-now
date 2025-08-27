import 'package:flutter/material.dart';

class PersonalizedSection extends StatelessWidget {
  const PersonalizedSection({super.key});

  @override
  Widget build(BuildContext context) {
    // "Database" of 10 images
    final items = [
      {
        "title": "Hướng dẫn thiền",
        "subtitle": "Kỹ thuật cơ bản",
        "img":
            "https://images.unsplash.com/photo-1625395694544-079d163b769b?w=600&h=400&fit=crop&q=80",
      },
      {
        "title": "Kiến trúc chùa",
        "subtitle": "Vẻ đẹp truyền thống",
        "img":
            "https://images.unsplash.com/photo-1741318793971-8a52ac2dc36c?w=600&h=400&fit=crop&q=80",
      },
      {
        "title": "Lễ Phật Đản 2025",
        "subtitle": "Sự kiện quan trọng",
        "img":
            "https://images.unsplash.com/photo-1747296807719-bcb83f52e366?w=600&h=400&fit=crop&q=80",
      },
      {
        "title": "Ẩm thực chay",
        "subtitle": "Món ngon ngày lễ",
        "img":
            "https://images.unsplash.com/photo-1598449426314-8b02525e8733?w=600&h=400&fit=crop&q=80",
      },
      {
        "title": "Thiền ngoài trời",
        "subtitle": "Tự do & tĩnh lặng",
        "img":
            "https://images.unsplash.com/photo-1717241748642-4743593f3859?w=600&h=400&fit=crop&q=80",
      },
      {
        "title": "Pháp thoại",
        "subtitle": "Lòng từ bi",
        "img":
            "https://images.unsplash.com/flagged/photo-1571972657458-083eea79555a?w=600&h=400&fit=crop&q=80",
      },
      {
        "title": "Chùa Bái Đính",
        "subtitle": "Tu sửa hoàn tất",
        "img":
            "https://images.unsplash.com/photo-1649747933254-546684290ddf?w=600&h=400&fit=crop&q=80",
      },
      {
        "title": "Kiến trúc Á Đông",
        "subtitle": "Cổ kính & trang nghiêm",
        "img":
            "https://images.unsplash.com/photo-1706806595208-0e823368f240?w=600&h=400&fit=crop&q=80",
      },
      {
        "title": "Chương trình từ thiện",
        "subtitle": "Giúp đỡ trẻ em",
        "img":
            "https://images.unsplash.com/photo-1593113616828-6f22bca04804?w=600&h=400&fit=crop&q=80",
      },
      {
        "title": "Ẩm thực Phật giáo",
        "subtitle": "Thanh đạm & bổ dưỡng",
        "img":
            "https://images.unsplash.com/photo-1689150571822-1b573b695391?w=600&h=400&fit=crop&q=80",
      },
    ];

    // Only show 6 out of 10
    final displayItems = items.take(6).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Dành cho bạn",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 images per row → 2 rows = 6 images
            childAspectRatio: 1, // Taller to fit image + caption
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: displayItems.length,
          itemBuilder: (context, index) {
            final item = displayItems[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  Expanded(
                    child: Image.network(
                      item["img"]!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  // Bottom "thingy" with text
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey.shade300,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["title"]!,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item["subtitle"]!,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
