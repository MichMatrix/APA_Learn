import 'item_model.dart';

class ShopOffer {
  final ItemModel base;
  final int qty;

  /// Overrides por dificuldade (opcional)
  final int? weight;
  final int? value;

  const ShopOffer({
    required this.base,
    required this.qty,
    this.weight,
    this.value,
  });

  ItemModel get item => base.copyWith(
    weight: weight ?? base.weight,
    value: value ?? base.value,
  );
}
