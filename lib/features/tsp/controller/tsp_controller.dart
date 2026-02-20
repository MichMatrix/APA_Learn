import 'dart:math';
import '../data/models/city_model.dart';

class TspController {
  final List<CityModel> cities;
  final List<CityModel> selected = [];

  TspController(this.cities);

  void selectCity(CityModel city) {
    if (!selected.contains(city)) {
      selected.add(city);
    }
  }

  void reset() {
    selected.clear();
  }

  double calculateDistance(List<CityModel> route) {
    double total = 0;
    for (int i = 0; i < route.length - 1; i++) {
      total += _distance(route[i], route[i + 1]);
    }
    if (route.length == cities.length) {
      total += _distance(route.last, route.first);
    }
    return total;
  }

  double _distance(CityModel a, CityModel b) {
    return sqrt(pow(a.position.dx - b.position.dx, 2) +
        pow(a.position.dy - b.position.dy, 2));
  }

  List<CityModel> findOptimalRoute() {
    final permutations = _permute(cities);
    double bestDistance = double.infinity;
    List<CityModel> bestRoute = [];

    for (final route in permutations) {
      final d = calculateDistance(route);
      if (d < bestDistance) {
        bestDistance = d;
        bestRoute = route;
      }
    }

    return bestRoute;
  }

  List<List<CityModel>> _permute(List<CityModel> list) {
    if (list.length == 1) return [list];
    final result = <List<CityModel>>[];

    for (int i = 0; i < list.length; i++) {
      final rest = [...list]..removeAt(i);
      for (final perm in _permute(rest)) {
        result.add([list[i], ...perm]);
      }
    }

    return result;
  }
}
