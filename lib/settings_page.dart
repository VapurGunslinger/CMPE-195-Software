import 'package:flutter/material.dart';

import 'account_page.dart';
import 'login_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Settings'),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1E2B36),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            _SettingsCard(
              title: 'Account',
              subtitle: 'Manage your profile and data',
              icon: Icons.person_outline,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AccountPage()),
                );
              },
            ),
            _SettingsCard(
              title: 'Notifications',
              subtitle: 'Alerts for low oxygen or abnormal heart rate',
              icon: Icons.notifications_none_rounded,
              onTap: () {},
            ),
            _SettingsCard(
              title: 'Privacy',
              subtitle: 'Control sharing and security options',
              icon: Icons.shield_outlined,
              onTap: () {},
            ),
            _SettingsCard(
              title: 'App Preferences',
              subtitle: 'Theme, units, and more',
              icon: Icons.settings_outlined,
              onTap: () {},
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF2B7DE9),
                  side: const BorderSide(color: Color(0xFF2B7DE9)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                    (route) => false,
                  );
                },
                child: const Text('Log Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        leading: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF3FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF2B7DE9)),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
