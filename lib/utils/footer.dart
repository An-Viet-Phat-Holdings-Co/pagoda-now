import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main footer content
        Container(
          color: Colors.grey.shade100,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Branding & Social
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.spa, color: Colors.purple, size: 36),
                        SizedBox(width: 10),
                        Text(
                          "Pagoda",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: 360, // 👈 adjust to taste
                      child: const Text(
                        "Kết nối cộng đồng Phật tử toàn cầu với chùa, sự kiện và tài nguyên Phật giáo. Hành trình tâm linh của bạn bắt đầu từ đây.",
                        style: TextStyle(fontSize: 14, height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Icon(Icons.facebook, size: 26, color: Colors.black54),
                        SizedBox(width: 14),
                        Icon(
                          Icons.ondemand_video,
                          size: 26,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 14),
                        Icon(Icons.camera_alt, size: 26, color: Colors.black54),
                        SizedBox(width: 14),
                        Icon(Icons.send, size: 26, color: Colors.black54),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 40),

              // Services
              Expanded(
                child: _FooterNav(
                  title: "Dịch vụ",
                  links: [
                    "Tìm chùa",
                    "Sự kiện Phật giáo",
                    "Cộng đồng",
                    "Pháp cụ",
                    "Từ thiện",
                  ],
                ),
              ),

              const SizedBox(width: 20),

              // Company
              Expanded(
                child: _FooterNav(
                  title: "Công ty",
                  links: [
                    "Về chúng tôi",
                    "Tin tức",
                    "Liên hệ",
                    "Tuyển dụng",
                    "Đối tác",
                  ],
                ),
              ),

              const SizedBox(width: 20),

              // Support
              Expanded(
                child: _FooterNav(
                  title: "Hỗ trợ",
                  links: [
                    "Trung tâm trợ giúp",
                    "Câu hỏi thường gặp",
                    "Hỗ trợ kỹ thuật",
                    "Phản hồi",
                    "Chính sách bảo mật",
                    "Điều khoản dịch vụ",
                  ],
                ),
              ),
            ],
          ),
        ),

        // Divider line
        Container(
          width: double.infinity,
          color: Colors.grey.shade300,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: const Center(
            child: Text(
              "© 2025 Pagoda. All rights reserved.",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }
}

class _FooterNav extends StatelessWidget {
  final String title;
  final List<String> links;

  const _FooterNav({required this.title, required this.links});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 12),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              link,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }
}
