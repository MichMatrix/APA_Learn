import '../../../../l10n/app_localizations.dart';
import '../knapsack_items.dart';
import 'item_model.dart';
import 'shop_offer.dart';

enum KnapsackDifficulty { beginner, intermediate, advanced }

extension KnapsackDifficultyX on KnapsackDifficulty {
  String get id => switch (this) {
        KnapsackDifficulty.beginner => 'beginner',
        KnapsackDifficulty.intermediate => 'intermediate',
        KnapsackDifficulty.advanced => 'advanced',
      };

  static KnapsackDifficulty fromId(String? id) {
    switch (id) {
      case 'intermediate':
        return KnapsackDifficulty.intermediate;
      case 'advanced':
        return KnapsackDifficulty.advanced;
      case 'beginner':
      default:
        return KnapsackDifficulty.beginner;
    }
  }

  String title(AppLocalizations t) => switch (this) {
        KnapsackDifficulty.beginner => t.knapsackDifficultyBeginnerTitle,
        KnapsackDifficulty.intermediate => t.knapsackDifficultyIntermediateTitle,
        KnapsackDifficulty.advanced => t.knapsackDifficultyAdvancedTitle,
      };

  String subtitle(AppLocalizations t) => switch (this) {
        KnapsackDifficulty.beginner => t.knapsackDifficultyBeginnerSubtitle,
        KnapsackDifficulty.intermediate => t.knapsackDifficultyIntermediateSubtitle,
        KnapsackDifficulty.advanced => t.knapsackDifficultyAdvancedSubtitle,
      };

  int get defaultCapacity => switch (this) {
        KnapsackDifficulty.beginner => 10,
        KnapsackDifficulty.intermediate => 12,
        KnapsackDifficulty.advanced => 14,
      };

  int get minCapacity => switch (this) {
        KnapsackDifficulty.beginner => 6,
        KnapsackDifficulty.intermediate => 8,
        KnapsackDifficulty.advanced => 10,
      };

  int get maxCapacity => switch (this) {
        KnapsackDifficulty.beginner => 14,
        KnapsackDifficulty.intermediate => 18,
        KnapsackDifficulty.advanced => 22,
      };

  int get maxItemsAvailable => switch (this) {
        KnapsackDifficulty.beginner => 5,
        KnapsackDifficulty.intermediate => 8,
        KnapsackDifficulty.advanced => 10,
      };

  bool get showHints => this == KnapsackDifficulty.beginner;
  bool get showOptimalOnResult => this != KnapsackDifficulty.beginner;
  bool get hasTimer => this == KnapsackDifficulty.advanced;

  /// Retorna as ofertas do "shop" por dificuldade.
  /// - Não depende da ordem do catálogo
  /// - Permite override de weight/value por nível
  /// - Garante exatamente [maxItemsAvailable] ofertas únicas (preenche com itens restantes se faltar)
  List<ShopOffer> shopOffers() {
    ItemModel byId(String id) =>
        KnapsackItems.items.firstWhere((e) => e.id == id);

    ShopOffer offer(
      String id, {
      required int qty,
      int? weight,
      int? value,
    }) {
      return ShopOffer(
        base: byId(id),
        qty: qty,
        weight: weight,
        value: value,
      );
    }

    final core = <ShopOffer>[
      ...switch (this) {
        KnapsackDifficulty.beginner => [
            offer('coin', qty: 3, weight: 1, value: 2),
            offer('watch', qty: 2, weight: 1, value: 4),
            offer('book', qty: 2, weight: 3, value: 5),
            offer('phone', qty: 1, weight: 2, value: 6),
            offer('gem', qty: 1, weight: 2, value: 8),
          ],
        KnapsackDifficulty.intermediate => [
            offer('coin', qty: 2, weight: 1, value: 2),
            offer('watch', qty: 1, weight: 1, value: 4),
            offer('phone', qty: 2, weight: 2, value: 6),
            offer('tablet', qty: 1, weight: 3, value: 7),
            offer('kindle', qty: 1, weight: 2, value: 6),
            offer('headphone', qty: 1, weight: 2, value: 5),
            offer('book', qty: 1, weight: 3, value: 5),
            offer('gem', qty: 1, weight: 3, value: 9),
          ],
        KnapsackDifficulty.advanced => [
            offer('console', qty: 1, weight: 6, value: 12),
            offer('glass_vr', qty: 1, weight: 5, value: 10),
            offer('tablet', qty: 1, weight: 4, value: 7),
            offer('gem', qty: 1, weight: 4, value: 11),
            offer('headphone', qty: 1, weight: 3, value: 6),
            offer('kindle', qty: 1, weight: 3, value: 6),
            offer('phone', qty: 1, weight: 3, value: 7),
            offer('book', qty: 1, weight: 4, value: 6),
            offer('watch', qty: 1, weight: 2, value: 4),
            offer('coin', qty: 1, weight: 2, value: 2),
          ],
      }
    ];

    final target = maxItemsAvailable;


    final dedup = <ShopOffer>[];
    final used = <String>{};
    for (final o in core) {
      final id = o.base.id;
      if (used.add(id)) dedup.add(o);
    }

    if (dedup.length >= target) return dedup.take(target).toList();


    for (final it in KnapsackItems.items) {
      if (dedup.length >= target) break;
      if (used.contains(it.id)) continue;
      dedup.add(ShopOffer(base: it, qty: 1));
      used.add(it.id);
    }

    return dedup;
  }
}
