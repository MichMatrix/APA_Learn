import 'package:flutter/material.dart';
import '../../../../../../core/colors/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';

class GuideHero extends StatelessWidget {
  const GuideHero({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Card(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Opacity(
              opacity: 0.18,
              child: Image.asset(
                'assets/images/background/pack_person_looking_sun.png',
                fit: BoxFit.cover,
                height: 180,
                width: double.infinity,
                errorBuilder: (_, __, ___) => const SizedBox(height: 180),
              ),
            ),
          ),

          // overlay content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Text(
                     t.knapsackGuideHeroBadge,
                    style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.primary),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  t.knapsackGuideHeroTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  t.knapsackGuideHeroSubtitle,
                  style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
