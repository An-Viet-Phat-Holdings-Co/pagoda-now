import 'package:flutter/material.dart';
import '../features/home/home_page.dart';
import '../features/community/community_page.dart';
import '../features/charity/charity_page.dart';
import '../features/temples/temples_page.dart';
import '../features/shop/shop_page.dart';
import '../features/events/events_page.dart';
import '../features/eats/eats_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/community':
        return MaterialPageRoute(builder: (_) => const CommunityPage());
      case '/charity':
        return MaterialPageRoute(builder: (_) => const CharityPage());
      case '/temples':
        return MaterialPageRoute(builder: (_) => const TemplesPage());
      case '/shop':
        return MaterialPageRoute(builder: (_) => const ShopPage());
      case '/events':
        return MaterialPageRoute(builder: (_) => const EventsPage());
      case '/eats':
        return MaterialPageRoute(builder: (_) => const EatsPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("404 - Page not found")),
          ),
        );
    }
  }
}
