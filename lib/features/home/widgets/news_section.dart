import 'dart:async';
import 'package:flutter/material.dart';

class NewsSection extends StatefulWidget {
  const NewsSection({super.key});

  @override
  State<NewsSection> createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;

  final news = [
    {
      "title": "Chùa Bái Đính hoàn thành tu sửa",
      "time": "2 giờ trước",
      "img":
          "https://images.unsplash.com/photo-1649747933254-546684290ddf?w=600&h=300"
    },
    {
      "title": "Hội nghị Phật giáo Việt Nam 2025",
      "time": "5 giờ trước",
      "img":
          "https://images.unsplash.com/photo-1689150571822-1b573b695391?w=600&h=300"
    },
    {
      "title": "Tuyển tình nguyện viên",
      "time": "1 ngày trước",
      "img":
          "https://images.unsplash.com/photo-1706806595208-0e823368f240?w=600&h=300"
    },
    {
      "title": "Khóa tu thiền cuối tuần",
      "time": "3 ngày trước",
      "img":
          "https://images.unsplash.com/photo-1717241748642-4743593f3859?w=600&h=300"
    },
    {
      "title": "Pháp thoại về lòng từ bi",
      "time": "4 ngày trước",
      "img":
          "https://images.unsplash.com/flagged/photo-1571972657458-083eea79555a?w=600&h=300"
    },
    {
      "title": "Chương trình từ thiện vùng cao",
      "time": "5 ngày trước",
      "img":
          "https://images.unsplash.com/photo-1593113616828-6f22bca04804?w=600&h=300"
    },
    {
      "title": "Ẩm thực chay mùa lễ",
      "time": "6 ngày trước",
      "img":
          "https://images.unsplash.com/photo-1598449426314-8b02525e8733?w=600&h=300"
    },
    {
      "title": "Triển lãm kiến trúc Phật giáo",
      "time": "1 tuần trước",
      "img":
          "https://images.unsplash.com/photo-1741318793971-8a52ac2dc36c?w=600&h=300"
    },
    {
      "title": "Hội thảo nghiên cứu Phật học",
      "time": "2 tuần trước",
      "img":
          "https://images.unsplash.com/photo-1747296807719-bcb83f52e366?w=600&h=300"
    },
    {
      "title": "Hoạt động cộng đồng tại chùa Linh Ứng",
      "time": "3 tuần trước",
      "img":
          "https://images.unsplash.com/photo-1706806595208-0e823368f240?w=600&h=300"
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    const double scrollStep = 1; // pixels per tick
    const Duration stepDuration = Duration(milliseconds: 50); // speed control

    _timer = Timer.periodic(stepDuration, (timer) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final current = _scrollController.offset;

        if (current >= maxScroll) {
          // jump back to start
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(current + scrollStep);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Tin tức cộng đồng",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // Auto-scroll carousel
        SizedBox(
          height: 220,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: news.length,
            padding: const EdgeInsets.only(right: 16),
            itemBuilder: (context, index) {
              final n = news[index];
              return Container(
                width: 260,
                margin: const EdgeInsets.only(left: 16),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        n["img"]!,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          n["title"]!,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          n["time"]!,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
