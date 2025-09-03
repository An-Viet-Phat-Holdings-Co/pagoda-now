import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // NOTE: requires Flutter with the new ColorScheme roles (see note below)
    final background = colorScheme.surfaceContainerHighest;

    return Column(
      children: [
        // Main footer content
        Container(
          color: background,
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
                      children: [
                        Icon(Icons.spa, color: colorScheme.primary, size: 36),
                        const SizedBox(width: 10),
                        Text(
                          "Pagoda",
                          style: textTheme.titleLarge?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: 360,
                      child: Text(
                        "Kết nối cộng đồng Phật tử toàn cầu với chùa, sự kiện và tài nguyên Phật giáo. Hành trình tâm linh của bạn bắt đầu từ đây.",
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.facebook, size: 26, color: theme.iconTheme.color),
                        const SizedBox(width: 14),
                        Icon(Icons.ondemand_video, size: 26, color: theme.iconTheme.color),
                        const SizedBox(width: 14),
                        Icon(Icons.camera_alt, size: 26, color: theme.iconTheme.color),
                        const SizedBox(width: 14),
                        Icon(Icons.send, size: 26, color: theme.iconTheme.color),
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
          color: theme.dividerColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              "© 2025 Pagoda. All rights reserved.",
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12,
                color: textTheme.bodySmall?.color?.withOpacity(0.7),
              ),
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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 12),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Text(
              link,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
