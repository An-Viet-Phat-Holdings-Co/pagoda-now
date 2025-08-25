import 'package:flutter/material.dart';
import 'events_detail_page.dart';
import 'widgets/event_card.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Events")),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          EventCard(
            title: "Full Moon Ceremony",
            date: "August 30, 2025",
            location: "Lotus Temple, HCMC",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EventsDetailPage(
                    title: "Full Moon Ceremony",
                    date: "August 30, 2025",
                    location: "Lotus Temple, HCMC",
                    description:
                        "A traditional Buddhist full moon ceremony with chanting, offerings, and meditation.",
                  ),
                ),
              );
            },
          ),
          EventCard(
            title: "Charity Fundraiser",
            date: "September 10, 2025",
            location: "Pagoda Hall, Hanoi",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EventsDetailPage(
                    title: "Charity Fundraiser",
                    date: "September 10, 2025",
                    location: "Pagoda Hall, Hanoi",
                    description:
                        "A community event to raise funds for education and healthcare projects.",
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
