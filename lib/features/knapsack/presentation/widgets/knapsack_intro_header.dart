import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class KnapsackIntroHeader extends StatelessWidget {
  const KnapsackIntroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Image.asset(
              'assets/images/knapsack/backpack.png',
              width: 76,
              height: 76,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Icon(Icons.backpack_rounded, size: 56),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                t.knapsackIntroHeaderText,
                style: const TextStyle(fontSize: 15, height: 1.25, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
