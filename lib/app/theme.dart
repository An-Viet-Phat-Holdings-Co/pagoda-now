import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}
