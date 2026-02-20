import 'package:flutter/material.dart';
import '../../data/models/city_model.dart';

class TspMapPainter extends CustomPainter {
  final List<CityModel> route;

  TspMapPainter(this.route);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 3;

    for (int i = 0; i < route.length - 1; i++) {
      canvas.drawLine(route[i].position, route[i + 1].position, paint);
    }

    if (route.length > 1) {
      canvas.drawLine(route.last.position, route.first.position, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
