import 'package:flutter/material.dart';

Widget itemsNumberRow(String label, Color color, String value) {
  return Row(
    children: [
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
      const SizedBox(width: 6),
      Text(
        "$label: ",
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  );
}
