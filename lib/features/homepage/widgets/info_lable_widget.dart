import 'package:flutter/material.dart';

class InfoLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const InfoLabel({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
