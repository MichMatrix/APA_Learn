import 'package:flutter/material.dart';
import '../../../../../core/colors/app_colors.dart';

class KnapsackBoardingCta extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const KnapsackBoardingCta({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.rocket_launch_rounded, size: 20),
          ],
        ),
      ),
    );
  }
}
