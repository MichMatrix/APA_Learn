import '../data/models/item_model.dart';

class KnapsackSolveResult {
  final int optimalValue;
  final List<int> pickedIndexes;
  const KnapsackSolveResult({
    required this.optimalValue,
    required this.pickedIndexes,
  });
}

/// Knapsack 0/1 por Programação Dinâmica
KnapsackSolveResult solveKnapsackDP({
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

  // reconstrução dos itens escolhidos
  var c = capacity;
  final picked = <int>[];
  for (var i = n; i >= 1; i--) {
    if (dp[i][c] != dp[i - 1][c]) {
      picked.add(i - 1);
      c -= items[i - 1].weight;
    }
  }
  picked.setRange(0, picked.length, picked.reversed);

  return KnapsackSolveResult(
    optimalValue: dp[n][capacity],
    pickedIndexes: picked,
  );
}
