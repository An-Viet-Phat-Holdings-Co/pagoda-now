import 'package:flutter/material.dart';
import 'router.dart';
import 'theme.dart';

class PagodaNowApp extends StatelessWidget {
  const PagodaNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pagoda Now",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,       // light theme
      darkTheme: AppTheme.dark,    // dark theme support
      themeMode: ThemeMode.system, // 👈 respects system setting automatically
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
