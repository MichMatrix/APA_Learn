import 'package:flutter/material.dart';
import '../../../../../core/colors/app_colors.dart';

class GuideAlgoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<String> bullets;

  final String badge;
  final Color? badgeColor;

  const GuideAlgoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.bullets,
    required this.badge,
    this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    final b = badgeColor ?? AppColors.warning;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Icon(icon, color: AppColors.primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: AppColors.textMuted,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: b.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Text(
                    badge,
                    style: TextStyle(fontWeight: FontWeight.w900, color: b),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...bullets.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('•  ', style: TextStyle(fontWeight: FontWeight.w900)),
                    Expanded(
                      child: Text(
                        e,
                        style: const TextStyle(fontWeight: FontWeight.w700, height: 1.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
