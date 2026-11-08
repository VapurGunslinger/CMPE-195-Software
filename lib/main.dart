import 'package:flutter/material.dart';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'splash_screen.dart';

void main() {

// Start scanning for BLE devices

  FlutterBluePlus.startScan(timeout: Duration(seconds: 4));

  // Listen to scan results
  var subscription = FlutterBluePlus.scanResults.listen((results) {

    for (ScanResult r in results) {

      print('${r.device.name} found! rssi: ${r.rssi}');

    }

  });
  // Stop scanning

  FlutterBluePlus.stopScan();



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
