import 'package:flutter/material.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/models/knapsack_difficulty.dart';

class DifficultyCard extends StatelessWidget {
  final KnapsackDifficulty difficulty;
  final bool selected;
  final VoidCallback onTap;

  const DifficultyCard({
    super.key,
    required this.difficulty,
    required this.selected,
    required this.onTap,
  });

  IconData get _icon => switch (difficulty) {
        KnapsackDifficulty.beginner => Icons.emoji_objects_rounded,
        KnapsackDifficulty.intermediate => Icons.extension_rounded,
        KnapsackDifficulty.advanced => Icons.local_fire_department_rounded,
      };

  Color get _accent => switch (difficulty) {
        KnapsackDifficulty.beginner => AppColors.success,
        KnapsackDifficulty.intermediate => AppColors.primary,
        KnapsackDifficulty.advanced => AppColors.warning,
      };

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? _accent.withOpacity(0.12) : AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected ? _accent.withOpacity(0.55) : AppColors.border,
            width: selected ? 2 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  )
                ]
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: _accent.withOpacity(0.14),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Icon(_icon, color: _accent),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    difficulty.title(t),
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: selected ? _accent : AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    difficulty.subtitle(t),
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      height: 1.2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _Tag(text: t.difficultyTagItems(difficulty.maxItemsAvailable),
                        accent: _accent),
                      _Tag(text: t.difficultyTagCapacity(difficulty.minCapacity, difficulty.maxCapacity),
                        accent: _accent),
                      if (difficulty.showHints) _Tag(text: t.difficultyTagHints, accent: _accent),
                      if (difficulty.hasTimer) _Tag(text: t.difficultyTagTimer, accent: _accent),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              selected ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
              color: selected ? _accent : AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  final Color accent;

  const _Tag({required this.text, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: accent.withOpacity(0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: accent,
          fontWeight: FontWeight.w900,
          fontSize: 12,
        ),
      ),
    );
  }
}
