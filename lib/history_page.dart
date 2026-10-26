import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final weekLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final spo2Values = [92, 94, 96, 95, 98, 97, 99];
    final heartValues = [84, 78, 81, 75, 83, 80, 77];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('History'),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1E2B36),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'View your oxygen and heart rate trends',
                style: TextStyle(fontSize: 16, color: Color(0xFF4F5D75)),
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  _FilterChip(label: 'Week', selected: true),
                  SizedBox(width: 8),
                  _FilterChip(label: 'Month'),
                  SizedBox(width: 8),
                  _FilterChip(label: 'Year'),
                ],
              ),
              const SizedBox(height: 18),
              _TrendCard(
                title: 'Oxygen Readings (SpO₂)',
                values: spo2Values,
                labels: weekLabels,
                color: const Color(0xFF2B7DE9),
              ),
              const SizedBox(height: 18),
              _TrendCard(
                title: 'Heart Rate (bpm)',
                values: heartValues,
                labels: weekLabels,
                color: const Color(0xFFEC5D6A),
              ),
              const SizedBox(height: 16),
              const Text(
                'Average Readings (This Week)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E2B36),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Expanded(
                    child: _AverageCard(
                      label: 'SpO₂',
                      value: '97%',
                      accent: Color(0xFF2B7DE9),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _AverageCard(
                      label: 'Heart Rate',
                      value: '72 bpm',
                      accent: Color(0xFFEC5D6A),
                    ),
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

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, this.selected = false});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: selected ? const Color(0xFF2B7DE9) : const Color(0xFFE9EEF6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : const Color(0xFF1E2B36),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _TrendCard extends StatelessWidget {
  const _TrendCard({
    required this.title,
    required this.values,
    required this.labels,
    required this.color,
  });

  final String title;
  final List<int> values;
  final List<String> labels;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E2B36),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: CustomPaint(
              painter: _LineChartPainter(values: values, color: color),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: labels
                      .map(
                        (label) => Text(
                          label,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AverageCard extends StatelessWidget {
  const _AverageCard({
    required this.label,
    required this.value,
    required this.accent,
  });

  final String label;
  final String value;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: accent,
            ),
          ),
        ],
      ),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  const _LineChartPainter({required this.values, required this.color});

  final List<int> values;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();
    final max = values.reduce((a, b) => a > b ? a : b).toDouble();
    final min = values.reduce((a, b) => a < b ? a : b).toDouble();
    final range = (max - min).clamp(1, 1000).toDouble();

    for (var i = 0; i < values.length; i++) {
      final x = size.width * (i / (values.length - 1));
      final y = size.height -
          ((values[i].toDouble() - min) / range) * (size.height - 20) -
          10;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);

    final dotPaint = Paint()..color = color;
    for (var i = 0; i < values.length; i++) {
      final x = size.width * (i / (values.length - 1));
      final y = size.height -
          ((values[i].toDouble() - min) / range) * (size.height - 20) -
          10;
      canvas.drawCircle(Offset(x, y), 4, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _LineChartPainter oldDelegate) => true;
}
