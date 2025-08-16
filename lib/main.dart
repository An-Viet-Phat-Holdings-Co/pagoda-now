import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pagoda',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Navbar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                Row(
                  children: const [
                    Icon(Icons.spa, color: Colors.deepPurple, size: 32),
                    SizedBox(width: 8),
                    Text(
                      "Pagoda",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
                // Menu
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text("Chùa"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Sự kiện"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Cộng đồng"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Cửa hàng"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Từ thiện"),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Hero Section
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  "https://images.unsplash.com/photo-1743485754042-75481fdb4504",
                  fit: BoxFit.cover,
                ),
                Container(color: Colors.black.withOpacity(0.3)),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Khám phá sự bình yên cùng Pagoda",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Kết nối với cộng đồng Phật giáo và các tài nguyên tâm linh",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 12,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 14,
                              ),
                            ),
                            icon: const Icon(Icons.map),
                            label: const Text("Khám phá ngay"),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 14,
                              ),
                            ),
                            icon: const Icon(Icons.event),
                            label: const Text("Xem thêm"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
