import 'package:flutter/material.dart';

Widget priceRow(String label, Color color, String value) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      const SizedBox(height: 4),
      Text(
        value,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ],
  );
}