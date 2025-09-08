import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../features/home/home_page.dart';
import '../features/community/community_page.dart';
import '../features/charity/charity_page.dart';
import '../features/temples/temples_page.dart';
import '../features/shop/shop_page.dart';
import '../features/events/events_page.dart';
import '../features/eats/eats_page.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final List<String> monkImages = [
    "https://images.unsplash.com/photo-1509099836639-18ba1795216d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80",
    "https://images.unsplash.com/photo-1504215680853-026ed2a45def?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80",
    "https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80",
  ];

  late String currentImage;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    currentImage = monkImages.first;

    // Rotate monk images every 2 minutes
    timer = Timer.periodic(const Duration(minutes: 2), (_) {
      setState(() {
        final available = monkImages
            .where((img) => img != currentImage)
            .toList();
        currentImage = available[Random().nextInt(available.length)];
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: theme.appBarTheme.backgroundColor ?? theme.colorScheme.surface,
        border: Border(bottom: BorderSide(color: theme.dividerColor)),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              InkWell(
                onTap: () => _navigateTo(context, const HomePage()),
                child: Row(
                  children: [
                    Icon(Icons.spa, color: theme.colorScheme.primary, size: 32),
                    const SizedBox(width: 10),
                    Text(
                      "Pagoda",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),

              // Center navigation (desktop only)
              if (!isMobile)
                Row(
                  children: [
                    _NavItem(
                      label: "Chùa",
                      onTap: () => _navigateTo(context, const TemplesPage()),
                    ),
                    _NavItem(
                      label: "Sự kiện",
                      onTap: () => _navigateTo(context, const EventsPage()),
                    ),
                    _NavItem(
                      label: "Cộng đồng",
                      onTap: () => _navigateTo(context, const CommunityPage()),
                    ),
                    _NavItem(
                      label: "Cửa hàng",
                      onTap: () => _navigateTo(context, const ShopPage()),
                    ),
                    _NavItem(
                      label: "Từ thiện",
                      onTap: () => _navigateTo(context, const CharityPage()),
                    ),
                    _NavItem(
                      label: "Ăn uống",
                      onTap: () => _navigateTo(context, const EatsPage()),
                    ),
                  ],
                ),

              // Actions (right side)
              Row(
                children: [
                  Icon(Icons.search, size: 24, color: theme.iconTheme.color),
                  const SizedBox(width: 12),
                  Icon(
                    Icons.notifications_outlined,
                    size: 24,
                    color: theme.iconTheme.color,
                  ),
                  const SizedBox(width: 12),

                  // Avatar with fallback
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: theme.colorScheme.surfaceVariant,
                    child: ClipOval(
                      child: Image.network(
                        currentImage,
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                        errorBuilder: (_, __, ___) {
                          return Icon(
                            Icons.person,
                            color: theme.colorScheme.onSurfaceVariant,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Hamburger (mobile only)
                  if (isMobile)
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.menu,
                        size: 28,
                        color: theme.iconTheme.color,
                      ),
                      onSelected: (value) {
                        switch (value) {
                          case "Chùa":
                            _navigateTo(context, const TemplesPage());
                            break;
                          case "Sự kiện":
                            _navigateTo(context, const EventsPage());
                            break;
                          case "Cộng đồng":
                            _navigateTo(context, const CommunityPage());
                            break;
                          case "Cửa hàng":
                            _navigateTo(context, const ShopPage());
                            break;
                          case "Từ thiện":
                            _navigateTo(context, const CharityPage());
                            break;
                          case "Ăn uống":
                            _navigateTo(context, const EatsPage());
                            break;
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(value: "Chùa", child: Text("Chùa")),
                        const PopupMenuItem(
                          value: "Sự kiện",
                          child: Text("Sự kiện"),
                        ),
                        const PopupMenuItem(
                          value: "Cộng đồng",
                          child: Text("Cộng đồng"),
                        ),
                        const PopupMenuItem(
                          value: "Cửa hàng",
                          child: Text("Cửa hàng"),
                        ),
                        const PopupMenuItem(
                          value: "Từ thiện",
                          child: Text("Từ thiện"),
                        ),
                        const PopupMenuItem(
                          value: "Ăn uống",
                          child: Text("Ăn uống"),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NavItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: theme.textTheme.bodyMedium?.color,
          ),
        ),
      ),
    );
  }
}
