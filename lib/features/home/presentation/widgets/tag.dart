import 'package:flutter/material.dart';
import '../../../../core/colors/app_colors.dart';

class Tag extends StatelessWidget {
  final String text;
  final Color? tint;
  final Color? textColor;
  final IconData? icon;

  const Tag({super.key, 
    required this.text,
    this.tint,
    this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bg = tint ?? AppColors.primary.withOpacity(0.10);
    final fg = textColor ?? AppColors.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: fg),
            const SizedBox(width: 6),
          ],
          Text(
            text,
            style: TextStyle(
              color: fg,
              fontWeight: FontWeight.w800,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}