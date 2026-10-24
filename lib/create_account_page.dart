import 'package:flutter/material.dart';

import 'main_page.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.zero,
              ),
              const SizedBox(height: 8),
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1E2B36),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Join OxyTrack to start monitoring your health.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF4F5D75),
                ),
              ),
              const SizedBox(height: 24),
              _SocialLoginButton(
                label: 'Sign up with Google',
                icon: 'G',
                accent: const Color(0xFFEAF3FF),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const MainPage()),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('or'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20),
              const _TextField(label: 'Full Name', icon: Icons.person_outline),
              const SizedBox(height: 16),
              const _TextField(label: 'Email', icon: Icons.email_outlined),
              const SizedBox(height: 16),
              const _TextField(
                label: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              const _TextField(
                label: 'Confirm Password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 22),
              SizedBox(
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B7DE9),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const MainPage()),
                    );
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'By creating an account, you agree to our Terms of Service and Privacy Policy.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF64748B),
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    required this.label,
    required this.icon,
    this.isPassword = false,
  });

  final String label;
  final IconData icon;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: const Color(0xFFF3F7FB),
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  const _SocialLoginButton({
    required this.label,
    required this.icon,
    required this.accent,
    required this.onPressed,
  });

  final String label;
  final String icon;
  final Color accent;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: const Color(0xFF1E2B36),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: onPressed,
        icon: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              icon,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF2B7DE9),
              ),
            ),
          ),
        ),
        label: Text(
          label,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
