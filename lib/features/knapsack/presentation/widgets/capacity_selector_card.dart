import 'package:flutter/material.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/models/knapsack_difficulty.dart';

class CapacitySelectorCard extends StatelessWidget {
  final KnapsackDifficulty difficulty;
  final int capacity;
  final ValueChanged<int> onChanged;

  const CapacitySelectorCard({
    super.key,
    required this.difficulty,
    required this.capacity,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final min = difficulty.minCapacity.toDouble();
    final max = difficulty.maxCapacity.toDouble();
    final divisions = (max - min).round();
    final t = AppLocalizations.of(context)!;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t.capacityCardTitle, style: const TextStyle(fontWeight: FontWeight.w900)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    t.capacityCardSubtitle,
                    style: const TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Text(
                    '$capacity',
                    style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Slider(
              value: capacity.toDouble().clamp(min, max),
              min: min,
              max: max,
              divisions: divisions <= 0 ? null : divisions,
              label: '$capacity',
              onChanged: (v) => onChanged(v.round()),
            ),
          ],
        ),
      ),
    );
  }
}
