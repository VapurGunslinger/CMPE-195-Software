// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulse_oximeter_app/login_page.dart';
import 'package:pulse_oximeter_app/main.dart';

void main() {
  testWidgets('OxyTrack splash screen shows app branding', (tester) async {
    await tester.pumpWidget(const OxyTrackApp());

    expect(find.text('OxyTrack'), findsOneWidget);
    expect(find.text('Monitor Your Health, Anytime'), findsOneWidget);
  });

  testWidgets('Login screen contains login action', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      ),
    );

    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Log In'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
  });
}
