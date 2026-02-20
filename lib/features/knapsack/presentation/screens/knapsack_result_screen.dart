import 'package:flutter/material.dart';

import '../../../../app/routes/routes.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/utils/feedback_fx.dart';
import '../../../../core/widgets/confetti_overlay.dart';
import '../../../../l10n/app_localizations.dart';
import '../../data/models/item_model.dart';

class KnapsackResultScreen extends StatefulWidget {
  static const route = '/knapsack-result';
  const KnapsackResultScreen({super.key});

  @override
  State<KnapsackResultScreen> createState() => _KnapsackResultScreenState();
}

class _KnapsackResultScreenState extends State<KnapsackResultScreen> {
  bool _playConfetti = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final computed = _compute(context);
      if (computed.grade == _Grade.great) {
        setState(() => _playConfetti = true);
        FeedbackFx.great();
      } else if (computed.grade == _Grade.ok) {
        FeedbackFx.success();
      } else {
        FeedbackFx.fail();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final r = _compute(context);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: Text(t.knapsackResultTitle)),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            _Badge(grade: r.grade),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                _titleForGrade(r.grade, t),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            if (r.optimalValue > 0)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.10),
                                  borderRadius: BorderRadius.circular(999),
                                  border: Border.all(color: AppColors.border),
                                ),
                                child: Text(
                                  t.knapsackResultPctOfOptimal(r.ratioPct),
                                  style: const TextStyle(fontWeight: FontWeight.w900),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        Row(
                          children: [
                            const Icon(Icons.backpack_rounded, color: AppColors.primary),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                t.knapsackResultCapacityUsedWeight(r.capacity, r.usedWeight),
                                style: const TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.success.withOpacity(0.14),
                                borderRadius: BorderRadius.circular(999),
                                border: Border.all(color: AppColors.border),
                              ),
                              child: Text(
                                t.knapsackResultValue(r.playerValue),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.success,
                                ),
                              ),
                            ),
                          ],
                        ),

                        if (r.optimalValue > 0) ...[
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: _MiniInfo(
                                  icon: Icons.auto_awesome_rounded,
                                  label: t.knapsackResultOptimalDpLabel,
                                  value: '${r.optimalValue}',
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: _MiniInfo(
                                  icon: Icons.show_chart_rounded,
                                  label: t.knapsackResultGapLabel,
                                  value: '${(r.optimalValue - r.playerValue).clamp(0, 999999)}',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                if (r.suggestion != null) ...[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        children: [
                          const Icon(Icons.tips_and_updates_rounded),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              r.suggestion!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                ],

                Expanded(
                  child: Card(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(14),
                      itemCount: r.selected.length,
                      separatorBuilder: (_, __) => const Divider(height: 18),
                      itemBuilder: (_, i) {
                        final it = r.selected[i];
                        return Row(
                          children: [
                            Image.asset(
                              it.asset,
                              width: 42,
                              height: 42,
                              fit: BoxFit.contain,
                              errorBuilder: (_, __, ___) => const Icon(Icons.inventory_2_outlined),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                it.name,
                                style: const TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ),
                            _SmallStat(icon: Icons.fitness_center_rounded, text: '${it.weight}'),
                            const SizedBox(width: 8),
                            _SmallStat(
                              icon: Icons.star_rounded,
                              text: '${it.value}',
                              color: AppColors.success,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                if (r.showOptimalSection) ...[
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: () => _showOptimalBottomSheet(
                        context: context,
                        t: t,
                        items: r.items,
                        pickedIndexes: r.optimalPickedIndexes,
                        capacity: r.capacity,
                        optimalValue: r.optimalValue,
                      ),
                      icon: const Icon(Icons.visibility_rounded),
                      label: Text(t.knapsackResultSeeOptimalCta),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.refresh_rounded),
                        label: Text(t.knapsackResultRetryCta),
                      ),
                    ),
                    const SizedBox(width: 10),

                    if (r.pass)
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () {
                            final next = _nextDifficulty(r.difficultyId);

                            Navigator.popUntil(context, (route) => route.isFirst);

                            Navigator.pushNamed(
                              context,
                              AppRoutes.knapsackIntro,
                              arguments: {'difficulty': next},
                            );
                          },
                          icon: const Icon(Icons.arrow_forward_rounded),
                          label: Text(t.knapsackResultNextLevelCta),
                        ),
                      )
                    else
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                          icon: const Icon(Icons.home_rounded),
                          label: Text(t.knapsackResultHomeCta),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),

        ConfettiOverlay(
          play: _playConfetti,
          origin: Alignment.topCenter,
          count: 120,
          duration: const Duration(milliseconds: 1600),
        ),
      ],
    );
  }

  _Computed _compute(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final args = ModalRoute.of(context)?.settings.arguments as Map?;

    final capacity = (args?['capacity'] as int?) ?? 12;
    final difficultyId = (args?['difficulty'] as String?) ?? 'beginner';

    final selected = (args?['selected'] as List<ItemModel>?) ?? const <ItemModel>[];
    final items = (args?['items'] as List<ItemModel>?) ?? const <ItemModel>[];

    final used = selected.fold<int>(0, (s, i) => s + i.weight);
    final value = selected.fold<int>(0, (s, i) => s + i.value);

    final dp = items.isEmpty ? null : _solveKnapsackDP(capacity: capacity, items: items);
    final optimalValue = dp?.optimalValue ?? 0;

    final ratio = optimalValue <= 0 ? 0.0 : (value / optimalValue);
    final ratioPct = (ratio * 100).clamp(0, 999).toInt();

    final grade = _gradeFromRatio(ratio, difficultyId);
    final pass = ratio >= _passThreshold(difficultyId);

    final suggestion = _buildSuggestion(
      t: t,
      difficultyId: difficultyId,
      capacity: capacity,
      usedWeight: used,
      playerValue: value,
      optimalValue: optimalValue,
      items: items,
      selected: selected,
      optimalPickedIndexes: dp?.pickedIndexes ?? const <int>[],
    );

    final showOptimalSection = _isIntermediateOrAdvanced(difficultyId) && dp != null;

    return _Computed(
      capacity: capacity,
      difficultyId: difficultyId,
      selected: selected,
      items: items,
      usedWeight: used,
      playerValue: value,
      optimalValue: optimalValue,
      ratio: ratio,
      ratioPct: ratioPct,
      grade: grade,
      pass: pass,
      suggestion: suggestion,
      showOptimalSection: showOptimalSection,
      optimalPickedIndexes: dp?.pickedIndexes ?? const <int>[],
    );
  }
}

/* -----------------------------
   Computed model
------------------------------ */

class _Computed {
  final int capacity;
  final String difficultyId;

  final List<ItemModel> selected;
  final List<ItemModel> items;

  final int usedWeight;
  final int playerValue;
  final int optimalValue;

  final double ratio;
  final int ratioPct;

  final _Grade grade;
  final bool pass;

  final String? suggestion;
  final bool showOptimalSection;

  final List<int> optimalPickedIndexes;

  const _Computed({
    required this.capacity,
    required this.difficultyId,
    required this.selected,
    required this.items,
    required this.usedWeight,
    required this.playerValue,
    required this.optimalValue,
    required this.ratio,
    required this.ratioPct,
    required this.grade,
    required this.pass,
    required this.suggestion,
    required this.showOptimalSection,
    required this.optimalPickedIndexes,
  });
}

/* -----------------------------
   DP solver (0/1 knapsack)
------------------------------ */

class _DpResult {
  final int optimalValue;
  final List<int> pickedIndexes;
  const _DpResult({required this.optimalValue, required this.pickedIndexes});
}

_DpResult _solveKnapsackDP({
  required int capacity,
  required List<ItemModel> items,
}) {
  final n = items.length;
  final dp = List.generate(n + 1, (_) => List.filled(capacity + 1, 0));

  for (var i = 1; i <= n; i++) {
    final w = items[i - 1].weight;
    final v = items[i - 1].value;
    for (var c = 0; c <= capacity; c++) {
      dp[i][c] = dp[i - 1][c];
      if (w <= c) {
        final cand = dp[i - 1][c - w] + v;
        if (cand > dp[i][c]) dp[i][c] = cand;
      }
    }
  }

  var c = capacity;
  final picked = <int>[];
  for (var i = n; i >= 1; i--) {
    if (dp[i][c] != dp[i - 1][c]) {
      picked.add(i - 1);
      c -= items[i - 1].weight;
    }
  }

  final ordered = picked.reversed.toList();

  return _DpResult(optimalValue: dp[n][capacity], pickedIndexes: ordered);
}

/* -----------------------------
   Grading + helpers
------------------------------ */

enum _Grade { fail, ok, great }

double _passThreshold(String diffId) {
  switch (diffId) {
    case 'beginner':
      return 0.75;
    case 'intermediate':
      return 0.85;
    case 'advanced':
      return 0.90;
    default:
      return 0.80;
  }
}

_Grade _gradeFromRatio(double ratio, String diffId) {
  final pass = _passThreshold(diffId);
  if (ratio >= 0.90) return _Grade.great;
  if (ratio >= pass) return _Grade.ok;
  return _Grade.fail;
}

String _titleForGrade(_Grade g, AppLocalizations t) {
  switch (g) {
    case _Grade.great:
      return t.knapsackResultGreatTitle;
    case _Grade.ok:
      return t.knapsackResultOkTitle;
    case _Grade.fail:
      return t.knapsackResultFailTitle;
  }
}

bool _isIntermediateOrAdvanced(String diffId) =>
    diffId == 'intermediate' || diffId == 'advanced';

String _nextDifficulty(String diffId) {
  switch (diffId) {
    case 'beginner':
      return 'intermediate';
    case 'intermediate':
      return 'advanced';
    default:
      return 'advanced';
  }
}

String? _buildSuggestion({
  required AppLocalizations t,
  required String difficultyId,
  required int capacity,
  required int usedWeight,
  required int playerValue,
  required int optimalValue,
  required List<ItemModel> items,
  required List<ItemModel> selected,
  required List<int> optimalPickedIndexes,
}) {
  if (items.isEmpty || optimalValue <= 0) return null;

  final ratio = playerValue / optimalValue;
  final waste = capacity - usedWeight;

  if (waste >= 2) {
    final candidates = items
        .where((it) => it.weight <= waste && !selected.any((s) => s.id == it.id))
        .toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (candidates.isNotEmpty) {
      final it = candidates.first;
      return t.knapsackResultSuggestionLeftoverWithItem(waste, it.name, it.weight, it.value);
    }
    return t.knapsackResultSuggestionLeftoverGeneric(waste);
  }

  if (_isIntermediateOrAdvanced(difficultyId) && ratio < 0.90) {
    final optimalItems = optimalPickedIndexes.map((i) => items[i]).toList();
    final missing = optimalItems.where((it) => !selected.any((s) => s.id == it.id)).toList();
    if (missing.isNotEmpty) {
      final it = missing.first;
      return t.knapsackResultSuggestionTryInclude(it.name, it.weight, it.value);
    }
  }

  if (ratio < 0.75) {
    return t.knapsackResultSuggestionGenericLow;
  }

  return null;
}

/* -----------------------------
   Optimal solution bottom sheet
------------------------------ */

void _showOptimalBottomSheet({
  required BuildContext context,
  required AppLocalizations t,
  required List<ItemModel> items,
  required List<int> pickedIndexes,
  required int capacity,
  required int optimalValue,
}) {
  final picked = pickedIndexes.map((i) => items[i]).toList();
  final used = picked.fold<int>(0, (s, i) => s + i.weight);

  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (_) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(Icons.auto_awesome_rounded),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      t.knapsackResultOptimalSheetTitle,
                      style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          t.knapsackResultCapacityUsedWeight(capacity, used),
                          style: const TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.success.withOpacity(0.14),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Text(
                          t.knapsackResultValue(optimalValue),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: AppColors.success,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: picked.length,
                  separatorBuilder: (_, __) => const Divider(height: 14),
                  itemBuilder: (_, i) {
                    final it = picked[i];
                    return Row(
                      children: [
                        Image.asset(
                          it.asset,
                          width: 38,
                          height: 38,
                          fit: BoxFit.contain,
                          errorBuilder: (_, __, ___) => const Icon(Icons.inventory_2_outlined),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            it.name,
                            style: const TextStyle(fontWeight: FontWeight.w900),
                          ),
                        ),
                        _SmallStat(icon: Icons.fitness_center_rounded, text: '${it.weight}'),
                        const SizedBox(width: 8),
                        _SmallStat(
                          icon: Icons.star_rounded,
                          text: '${it.value}',
                          color: AppColors.success,
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(t.knapsackResultCloseCta),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

/* -----------------------------
   UI bits
------------------------------ */

class _Badge extends StatelessWidget {
  final _Grade grade;
  const _Badge({required this.grade});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    late final Color c;
    late final IconData icon;
    late final String label;

    switch (grade) {
      case _Grade.fail:
        c = AppColors.warning;
        icon = Icons.error_outline_rounded;
        label = t.knapsackResultBadgeFail;
        break;
      case _Grade.ok:
        c = AppColors.primary;
        icon = Icons.thumb_up_alt_outlined;
        label = t.knapsackResultBadgeOk;
        break;
      case _Grade.great:
        c = AppColors.success;
        icon = Icons.emoji_events_outlined;
        label = t.knapsackResultBadgeGreat;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: c.withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: c),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(fontWeight: FontWeight.w900, color: c)),
        ],
      ),
    );
  }
}

class _MiniInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _MiniInfo({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w900),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}

class _SmallStat extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;

  const _SmallStat({required this.icon, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: c.withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: c),
          const SizedBox(width: 6),
          Text(text, style: TextStyle(color: c, fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}
