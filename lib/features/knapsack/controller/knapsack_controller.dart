import 'package:flutter/foundation.dart';
import '../data/models/item_model.dart';
import '../data/models/knapsack_state.dart';

class KnapsackController extends ChangeNotifier {
  KnapsackState _state;
  KnapsackState get state => _state;

  KnapsackController({required int capacity})
      : _state = KnapsackState(capacity: capacity, selected: const []);

  bool tryAdd(ItemModel item) {
    final nextSelected = [..._state.selected, item];
    final nextState = KnapsackState(capacity: _state.capacity, selected: nextSelected);

    if (nextState.usedWeight <= nextState.capacity) {
      _state = nextState;
      notifyListeners();
      return true;
    }
    return false;
  }
  bool removeOne(ItemModel item) {
    final next = [..._state.selected];
    final idx = next.lastIndexWhere((i) => i.id == item.id);
    if (idx == -1) return false;

    next.removeAt(idx);
    _state = KnapsackState(capacity: _state.capacity, selected: next);
    notifyListeners();
    return true;
  }

  void reset() {
    _state = KnapsackState(capacity: _state.capacity, selected: const []);
    notifyListeners();
  }
}
