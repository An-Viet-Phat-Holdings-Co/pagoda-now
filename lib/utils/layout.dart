import 'package:flutter/material.dart';
import 'topbar.dart';
import 'hero.dart';
import 'footer.dart';
import 'mailing.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  const AppLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HeroSection(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: child,
                  ),
                  const MailingSection(),
                  const FooterSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
