import 'package:flutter/material.dart';
import '../../../../../core/colors/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';

class ValueChip extends StatelessWidget {
  final int value;
  const ValueChip({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.success.withOpacity(0.14),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.auto_awesome_rounded, size: 18, color: AppColors.success),
          const SizedBox(width: 8),
          Text(
            t.valueLabel(value),
            style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.success),
          ),
        ],
      ),
    );
  }
}
