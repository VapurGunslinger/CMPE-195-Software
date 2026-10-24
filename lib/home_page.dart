import 'package:flutter/material.dart';

import 'account_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Welcome, Name!'),
        titleTextStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1E2B36),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AccountPage()),
              );
            },
            icon: const Icon(Icons.account_circle_outlined, size: 30),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Your health, our priority',
                style: TextStyle(fontSize: 16, color: Color(0xFF4F5D75)),
              ),
              const SizedBox(height: 18),
              Row(
                children: const [
                  Expanded(
                    child: _HealthMetricCard(
                      title: 'Oxygen Saturation',
                      value: '98',
                      unit: '%SpO₂',
                      color: Color(0xFFCFE8FF),
                      icon: Icons.favorite,
                      iconColor: Color(0xFF2B7DE9),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _HealthMetricCard(
                      title: 'Heart Rate',
                      value: '72',
                      unit: 'bpm',
                      color: Color(0xFFF7D7DF),
                      icon: Icons.favorite_outline,
                      iconColor: Color(0xFFEC5D6A),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Row(
                children: [
                  Icon(Icons.fiber_manual_record, color: Colors.green, size: 14),
                  SizedBox(width: 8),
                  Text('Connected', style: TextStyle(color: Color(0xFF2E7D32))),
                  Spacer(),
                  Text('Last updated: 9:41 AM', style: TextStyle(color: Color(0xFF64748B))),
                ],
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B7DE9),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Start Monitoring',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Readings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E2B36),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('View All'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ...List.generate(4, (index) {
                final readings = [
                  {'time': '9:40 AM', 'spo2': '98%', 'bpm': '72 bpm'},
                  {'time': '9:39 AM', 'spo2': '97%', 'bpm': '70 bpm'},
                  {'time': '9:38 AM', 'spo2': '98%', 'bpm': '73 bpm'},
                  {'time': '9:37 AM', 'spo2': '96%', 'bpm': '68 bpm'},
                ];
                final item = readings[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        item['time']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1E2B36),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        item['spo2']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF2B7DE9),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 18),
                      Text(
                        item['bpm']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1E2B36),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(Icons.chevron_right, color: Color(0xFF64748B)),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _HealthMetricCard extends StatelessWidget {
  const _HealthMetricCard({
    required this.title,
    required this.value,
    required this.unit,
    required this.color,
    required this.icon,
    required this.iconColor,
  });

  final String title;
  final String value;
  final String unit;
  final Color color;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF1E2B36),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1E2B36),
                ),
              ),
              const SizedBox(width: 6),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  unit,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4F5D75),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
