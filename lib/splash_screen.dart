import 'dart:async';
import 'package:flutter/material.dart';

import 'auth_storage.dart';
import 'login_page.dart';
import 'main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1500), () async {
      if (!mounted) return;

      final isLoggedIn = await AuthStorage.isLoggedIn();
      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => isLoggedIn ? const MainPage() : const LoginPage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFB9D9F7), Color(0xFFEFF6FF)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFF2B7DE9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 64,
                    ),
                  ),
                ),
                SizedBox(height: 28),
                Text(
                  'OxyTrack',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E2B36),
                    letterSpacing: -1.5,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Monitor Your Health, Anytime',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF4F5D75),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
