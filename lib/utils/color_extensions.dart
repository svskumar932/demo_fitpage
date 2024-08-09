import 'package:flutter/material.dart';

extension StringExtensions on String {
  Color toColor() {
    switch (this) {
      case 'green':
        return Colors.green;
      case 'red':
        return Colors.red;
      default:
        return Colors.grey; // Default color if not found
    }
  }
}
