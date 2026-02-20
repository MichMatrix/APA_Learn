import 'package:flutter/material.dart';

class KnapsackBoardingBackground extends StatelessWidget {
  final Widget child;
  const KnapsackBoardingBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2E7DFF),
            Color(0xFF1D5CFF),
          ],
        ),
      ),
      child: child,
    );
  }
}
