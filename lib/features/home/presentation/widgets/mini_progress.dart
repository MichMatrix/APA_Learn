import 'package:flutter/material.dart';

class MiniProgress extends StatelessWidget {
  final double value; // 0..1
  const MiniProgress({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: Colors.white.withOpacity(0.18),
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          minHeight: 8,
        ),
      ),
    );
  }
}