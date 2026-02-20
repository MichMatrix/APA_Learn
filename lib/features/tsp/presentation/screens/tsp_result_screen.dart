import 'package:flutter/material.dart';
import '../../controller/tsp_controller.dart';
import '../../data/models/city_model.dart';

class TspResultScreen extends StatelessWidget {
  static const route = '/tsp-result';
  const TspResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final playerRoute = args["playerRoute"] as List<CityModel>;
    final cities = args["cities"] as List<CityModel>;

    final controller = TspController(cities);

    final optimalRoute = controller.findOptimalRoute();

    final playerDistance =
        controller.calculateDistance(playerRoute).toStringAsFixed(2);
    final optimalDistance =
        controller.calculateDistance(optimalRoute).toStringAsFixed(2);

    return Scaffold(
      appBar: AppBar(title: const Text("Resultado TSP")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Sua distância: $playerDistance",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text("Melhor distância possível: $optimalDistance",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            if (playerDistance == optimalDistance)
              const Text("Você encontrou o caminho ótimo! 🎉",
                  style: TextStyle(fontSize: 20, color: Colors.green))
            else
              const Text("Existe um caminho melhor. Tente novamente!",
                  style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
