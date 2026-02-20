import 'package:flutter/material.dart';

class KnapsackBoardingHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String highlight;

  const KnapsackBoardingHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.highlight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        _IconBadge(),
        const SizedBox(height: 14),

        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.92),
            fontSize: 15,
            fontWeight: FontWeight.w600,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          highlight,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w900,
            height: 1.25,
          ),
        ),
      ],
    );
  }
}

class _IconBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(Icons.backpack_rounded, size: 64, color: Colors.white),
        SizedBox(height: 6),
      ],
    );
  }
}
