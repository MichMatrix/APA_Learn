import 'item_model.dart';

class KnapsackState {
  final int capacity;
  final List<ItemModel> selected;

  const KnapsackState({
    required this.capacity,
    required this.selected,
  });

  int get usedWeight => selected.fold(0, (s, i) => s + i.weight);
  int get totalValue => selected.fold(0, (s, i) => s + i.value);
  bool get isOver => usedWeight > capacity;
}
