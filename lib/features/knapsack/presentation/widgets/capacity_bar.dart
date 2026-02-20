import 'package:flutter/material.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class CapacityBar extends StatelessWidget {
  final int used;
  final int capacity;

  const CapacityBar({
    super.key,
    required this.used,
    required this.capacity,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = capacity == 0 ? 0.0 : (used / capacity).clamp(0.0, 1.0);
    final t = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.scale_rounded, size: 18, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(
              t.weightLabel(used, capacity),
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
            const Spacer(),
            Text(
              '${(ratio * 100).round()}%',
              style: const TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: ratio),
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            builder: (_, v, __) {
              return LinearProgressIndicator(
                value: v,
                minHeight: 10,
                backgroundColor: AppColors.border,
                valueColor: AlwaysStoppedAnimation<Color>(
                  v < 0.75 ? AppColors.primary : (v < 1 ? AppColors.warning : AppColors.danger),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
