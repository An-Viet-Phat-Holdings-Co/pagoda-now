import 'package:flutter/material.dart';
import 'topbar.dart';
import 'hero.dart';
import 'footer.dart';
import 'mailing.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  final bool isHome;

  const AppLayout({
    super.key,
    required this.child,
    this.isHome = false, // 👈 defaults to false
  });

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
                  if (isHome) const HeroSection(), // homepage only
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: child,
                  ),
                  if (isHome) const MailingSection(), // homepage only
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
