import 'package:flutter/material.dart';

import 'splash_screen.dart';

void main() {
  runApp(const OxyTrackApp());
}

class OxyTrackApp extends StatelessWidget {
  const OxyTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OxyTrack',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1F7AE0),
          brightness: Brightness.light,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
