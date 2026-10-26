import 'package:flutter/material.dart';

import 'auth_storage.dart';
import 'create_account_page.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool get _canLogin =>
      _emailController.text.trim().isNotEmpty &&
      _passwordController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _loadSavedAccount();
  }

  Future<void> _loadSavedAccount() async {
    final account = await AuthStorage.getSavedAccount();
    if (!mounted) return;
    setState(() {
      _emailController.text = account['email'] ?? '';
      _passwordController.text = account['password'] ?? '';
    });
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email and password.')),
      );
      return;
    }

    final savedAccount = await AuthStorage.getSavedAccount();
    final savedEmail = savedAccount['email'] ?? '';
    final savedPassword = savedAccount['password'] ?? '';

    if (savedEmail.isEmpty || savedPassword.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No saved account found. Please create one first.')),
      );
      return;
    }

    if (email != savedEmail || password != savedPassword) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect email or password.')),
      );
      return;
    }

    await AuthStorage.setLoggedIn(value: true);
    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MainPage()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Center(
                child: Column(
                  children: const [
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFF2B7DE9),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 48,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'OxyTrack',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1E2B36),
                        letterSpacing: -1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E2B36),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Log in to monitor your health.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF4F5D75),
                ),
              ),
              const SizedBox(height: 28),
              const SizedBox(height: 20),
              _TextField(
                label: 'Email',
                icon: Icons.email_outlined,
                controller: _emailController,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 16),
              _TextField(
                label: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
                controller: _passwordController,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password reset is coming soon.'),
                      ),
                    );
                  },
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(height: 12),
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
                  onPressed: _canLogin ? _login : null,
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Color(0xFF4F5D75)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const CreateAccountPage()),
                      );
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
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
    required this.controller,
    this.isPassword = false,
    this.onChanged,
  });

  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      onChanged: onChanged,
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

