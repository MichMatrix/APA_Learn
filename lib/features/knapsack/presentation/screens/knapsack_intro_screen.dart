import 'package:flutter/material.dart';
import '../../../../app/routes/routes.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/models/knapsack_difficulty.dart';
import '../widgets/capacity_selector_card.dart';
import '../widgets/difficulty_card.dart';
import '../widgets/knapsack_intro_header.dart';

class KnapsackIntroScreen extends StatefulWidget {
  static const route = '/intro-knap-screen';
  const KnapsackIntroScreen({super.key});

  @override
  State<KnapsackIntroScreen> createState() => _KnapsackIntroScreenState();
}

class _KnapsackIntroScreenState extends State<KnapsackIntroScreen> {
  KnapsackDifficulty selected = KnapsackDifficulty.beginner;
  late int capacity;

  @override
  void initState() {
    super.initState();
    capacity = selected.defaultCapacity;
  }

  void _selectDifficulty(KnapsackDifficulty d) {
    setState(() {
      selected = d;

      final min = d.minCapacity;
      final max = d.maxCapacity;

      if (capacity < min || capacity > max) {
        capacity = d.defaultCapacity;
      }
    });
  }

  void _start() {
    Navigator.pushNamed(
      context,
      AppRoutes.knapsackPlay,
      arguments: {
        'capacity': capacity,
        'difficulty': selected.id,
      },
    );
  }

  String _hintText(AppLocalizations t) {
    return switch (selected) {
      KnapsackDifficulty.beginner => t.knapsackIntroHintBeginner,
      KnapsackDifficulty.intermediate => t.knapsackIntroHintIntermediate,
      KnapsackDifficulty.advanced => t.knapsackIntroHintAdvanced,
    };
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(t.knapsackIntroAppBarTitle)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const KnapsackIntroHeader(),
            const SizedBox(height: 14),

            Text(
              t.knapsackIntroChooseDifficulty,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
            ),
            const SizedBox(height: 10),

            DifficultyCard(
              difficulty: KnapsackDifficulty.beginner,
              selected: selected == KnapsackDifficulty.beginner,
              onTap: () => _selectDifficulty(KnapsackDifficulty.beginner),
            ),
            const SizedBox(height: 10),
            DifficultyCard(
              difficulty: KnapsackDifficulty.intermediate,
              selected: selected == KnapsackDifficulty.intermediate,
              onTap: () => _selectDifficulty(KnapsackDifficulty.intermediate),
            ),
            const SizedBox(height: 10),
            DifficultyCard(
              difficulty: KnapsackDifficulty.advanced,
              selected: selected == KnapsackDifficulty.advanced,
              onTap: () => _selectDifficulty(KnapsackDifficulty.advanced),
            ),

            const SizedBox(height: 14),

            CapacitySelectorCard(
              difficulty: selected,
              capacity: capacity,
              onChanged: (v) => setState(() => capacity = v),
            ),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: FilledButton.icon(
                onPressed: _start,
                icon: const Icon(Icons.play_arrow_rounded),
                label: Text(t.knapsackIntroStartMission),
              ),
            ),
            const SizedBox(height: 10),

            Center(
              child: Text(
                _hintText(t),
                style: const TextStyle(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
