import 'package:flutter/material.dart';
import '../../../../app/routes/routes.dart';
import '../../controller/tsp_controller.dart';
import '../../data/models/city_model.dart';
import '../widgets/tsp_map_painter.dart';

class TspPlayScreen extends StatefulWidget {
  static const route = '/tsp-play';
  const TspPlayScreen({super.key});

  @override
  State<TspPlayScreen> createState() => _TspPlayScreenState();
}

class _TspPlayScreenState extends State<TspPlayScreen> {
  late TspController controller;

  @override
  void initState() {
    super.initState();

    controller = TspController([
      CityModel(id: "A", position: const Offset(80, 150)),
      CityModel(id: "B", position: const Offset(250, 120)),
      CityModel(id: "C", position: const Offset(100, 350)),
      CityModel(id: "D", position: const Offset(280, 320)),
      CityModel(id: "E", position: const Offset(180, 250)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final distance = controller.calculateDistance(controller.selected);

    return Scaffold(
      appBar: AppBar(title: const Text("TSP - Jogo")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Distância atual: ${distance.toStringAsFixed(2)}"),
          ),
          Expanded(
            child: Stack(
              children: [
                CustomPaint(
                  size: Size.infinite,
                  painter: TspMapPainter(controller.selected),
                ),
                ...controller.cities.map((city) {
                  return Positioned(
                    left: city.position.dx - 15,
                    top: city.position.dy - 15,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.selectCity(city);
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: controller.selected.contains(city)
                              ? Colors.green
                              : Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          city.id,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.reset();
                      setState(() {});
                    },
                    child: const Text("Resetar"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: controller.selected.length ==
                            controller.cities.length
                        ? () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.tspResult,
                              arguments: {
                                "playerRoute": controller.selected,
                                "cities": controller.cities,
                              },
                            );
                          }
                        : null,
                    child: const Text("Finalizar"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
