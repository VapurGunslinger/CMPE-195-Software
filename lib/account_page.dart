import 'package:flutter/material.dart';

import 'auth_storage.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool _isEditing = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController(text: '29 years');
  final _conditionController = TextEditingController(text: 'Hypertension monitoring');

  @override
  void initState() {
    super.initState();
    _loadAccount();
  }

  Future<void> _loadAccount() async {
    final account = await AuthStorage.getSavedAccount();
    if (!mounted) return;
    setState(() {
      _nameController.text = account['name'] ?? 'Jane Doe';
      _emailController.text = account['email'] ?? 'janedoe@email.com';
      _ageController.text = account['age'] ?? '29 years';
      _conditionController.text = account['condition'] ?? 'Hypertension monitoring';
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    _conditionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(_isEditing ? 'Edit Account' : 'Account'),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1E2B36),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundColor: Color(0xFF2B7DE9),
                      child: Icon(Icons.person, size: 32, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _isEditing
                          ? TextField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                              ),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1E2B36),
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _nameController.text,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1E2B36),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _emailController.text,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Patient Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E2B36),
                ),
              ),
              const SizedBox(height: 12),
              if (_isEditing)
                Column(
                  children: [
                    _EditField(label: 'Name', controller: _nameController),
                    _EditField(label: 'Email', controller: _emailController),
                    _EditField(label: 'Age', controller: _ageController),
                    _EditField(label: 'Condition', controller: _conditionController),
                  ],
                )
              else
                Column(
                  children: [
                    _InfoTile(label: 'Age', value: _ageController.text),
                    _InfoTile(label: 'Condition', value: _conditionController.text),
                    _InfoTile(label: 'Last Check-In', value: '9:41 AM today'),
                  ],
                ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B7DE9),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () async {
                    if (_isEditing) {
                      final messenger = ScaffoldMessenger.maybeOf(context);

                      await AuthStorage.updateAccount(
                        name: _nameController.text.trim(),
                        email: _emailController.text.trim(),
                        age: _ageController.text.trim(),
                        condition: _conditionController.text.trim(),
                      );

                      if (!mounted) return;

                      setState(() {
                        _isEditing = false;
                      });

                      messenger?.showSnackBar(
                        const SnackBar(content: Text('Account updated successfully.')),
                      );
                    } else {
                      setState(() {
                        _isEditing = true;
                      });
                    }
                  },
                  child: Text(_isEditing ? 'Save Account' : 'Edit Account'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EditField extends StatelessWidget {
  const _EditField({
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF64748B),
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E2B36),
            ),
          ),
        ],
      ),
    );
  }
}
