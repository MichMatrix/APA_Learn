import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1E5EFF);
  static const Color onPrimary = Colors.white;

  static const Color background = Color(0xFFF6F9FF);
  static const Color surface = Colors.white;

  static const Color success = Color(0xFF2ED47A);
  static const Color warning = Color(0xFFFFB020);
  static const Color danger  = Color(0xFFFF3B30);
  static const Color info    = Color(0xFF6C63FF);

  static const Color text = Color(0xFF0E1A2B);
  static const Color textMuted = Color(0xFF6B7A90);
  static const Color border = Color(0xFFE3ECFF);

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E5EFF), Color(0xFF4EA8FF)],
  );
}
