import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
        titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
        titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      primarySwatch: Colors.deepPurple,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent),
        titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white70),
        titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white60),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
    );
  }
}
