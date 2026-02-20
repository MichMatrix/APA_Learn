import 'package:flutter/material.dart';
import '../../../../core/colors/app_colors.dart';
import 'tag.dart';

class MissionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? asset;
  final IconData? icon;
  final String badgeLeft;
  final String badgeRight;
  final String difficultyLabel;

  final String guideLabel;
  final String playLabel;

  final VoidCallback onGuide;
  final VoidCallback onPlay;

  const MissionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.badgeLeft,
    required this.badgeRight,
    required this.difficultyLabel,
    required this.onGuide,
    required this.onPlay,
    required this.guideLabel,
    required this.playLabel,
    this.asset,
    this.icon,
  });

  Color _difficultyColor() {
    switch (difficultyLabel.toLowerCase()) {
      case 'easy':
      case 'fácil':
        return AppColors.success;
      case 'medium':
      case 'médio':
        return AppColors.warning;
      default:
        return AppColors.danger;
    }
  }

  @override
  Widget build(BuildContext context) {
    final diffColor = _difficultyColor();

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Center(
                    child: asset != null
                        ? Image.asset(
                            asset!,
                            width: 34,
                            height: 34,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => const Icon(Icons.school),
                          )
                        : Icon(icon ?? Icons.school, size: 30, color: AppColors.primary),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(color: AppColors.textMuted, height: 1.25),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Tag(text: badgeLeft),
                Tag(text: badgeRight),
                Tag(
                  text: difficultyLabel,
                  tint: diffColor.withOpacity(0.14),
                  textColor: diffColor,
                  icon: Icons.shield_rounded,
                ),
              ],
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onGuide,
                    icon: const Icon(Icons.info_outline_rounded, size: 18),
                    label: Text(guideLabel),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: onPlay,
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: Text(playLabel),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
