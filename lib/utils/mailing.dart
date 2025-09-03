import 'package:flutter/material.dart';

class MailingSection extends StatelessWidget {
  const MailingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: BoxDecoration(
            color: colorScheme.surface, // theme-aware background
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Đăng ký nhận tin",
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Nhận thông báo sự kiện, bài viết và tin tức Phật giáo mới nhất.",
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),

              // Email + button row
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Nhập email của bạn",
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: colorScheme.surfaceContainerLowest,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      final email = emailController.text.trim();
                      if (email.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Đăng ký với: $email"),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Đăng ký"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
