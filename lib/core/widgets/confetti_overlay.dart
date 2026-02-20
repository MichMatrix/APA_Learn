import 'dart:math';
import 'package:flutter/material.dart';

class ConfettiOverlay extends StatefulWidget {
  final bool play;
  final Duration duration;
  final int count;
  final Alignment origin;

  const ConfettiOverlay({
    super.key,
    required this.play,
    this.duration = const Duration(milliseconds: 1400),
    this.count = 90,
    this.origin = Alignment.topCenter,
  });

  @override
  State<ConfettiOverlay> createState() => _ConfettiOverlayState();
}

class _ConfettiOverlayState extends State<ConfettiOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late List<_Particle> _particles;
  bool _armed = false;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: widget.duration);

    _particles = _makeParticles(widget.count);

    _c.addStatusListener((s) {
      if (s == AnimationStatus.completed) {
        // “arma” pra tocar de novo quando play mudar pra true de novo
        _armed = false;
      }
    });
  }

  @override
  void didUpdateWidget(covariant ConfettiOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.play && !_armed) {
      _armed = true;
      _particles = _makeParticles(widget.count);
      _c.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  List<_Particle> _makeParticles(int n) {
    final r = Random();
    return List.generate(n, (_) {
      // "cores" sem hardcode de paleta: usa primárias variadas do Material
      final mat = Colors.primaries[r.nextInt(Colors.primaries.length)];
      final color = mat.shade400;

      // ângulo em torno do eixo vertical, e "força" inicial
      final angle = (-pi / 2) + (r.nextDouble() * (pi / 1.3)) - (pi / 3); // abre em leque
      final speed = 400 + r.nextDouble() * 550;

      return _Particle(
        color: color,
        radius: 2 + r.nextDouble() * 4.5,
        angle: angle,
        speed: speed,
        spin: (r.nextDouble() * 10) * (r.nextBool() ? 1 : -1),
        drag: 0.22 + r.nextDouble() * 0.18,
        gravity: 900 + r.nextDouble() * 700,
        life: 0.7 + r.nextDouble() * 0.3,
        shape: r.nextBool() ? _Shape.rect : _Shape.circle,
      );
    });
  }

  Offset _originToPoint(Size s) {
    final a = widget.origin;
    final x = (a.x + 1) / 2 * s.width;
    final y = (a.y + 1) / 2 * s.height;
    return Offset(x, y);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _c,
        builder: (_, __) {
          if (_c.isDismissed) return const SizedBox.shrink();
          return CustomPaint(
            painter: _ConfettiPainter(
              t: _c.value,
              particles: _particles,
              originResolver: _originToPoint,
            ),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

enum _Shape { rect, circle }

class _Particle {
  final Color color;
  final double radius;
  final double angle;
  final double speed;
  final double spin;
  final double drag;
  final double gravity;
  final double life;
  final _Shape shape;

  _Particle({
    required this.color,
    required this.radius,
    required this.angle,
    required this.speed,
    required this.spin,
    required this.drag,
    required this.gravity,
    required this.life,
    required this.shape,
  });
}

class _ConfettiPainter extends CustomPainter {
  final double t; // 0..1
  final List<_Particle> particles;
  final Offset Function(Size) originResolver;

  _ConfettiPainter({
    required this.t,
    required this.particles,
    required this.originResolver,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final origin = originResolver(size);
    final paint = Paint()..style = PaintingStyle.fill;

    for (final p in particles) {
      final localT = (t / p.life).clamp(0.0, 1.0);

      // easing pra ficar bonito
      final ease = Curves.easeOutCubic.transform(localT);

      // movimento (balística simples)
      final vx0 = cos(p.angle) * p.speed;
      final vy0 = sin(p.angle) * p.speed;

      // drag simples: reduz velocidade conforme tempo
      final dragFactor = (1.0 - p.drag * ease).clamp(0.0, 1.0);

      final x = origin.dx + vx0 * ease * dragFactor;
      final y = origin.dy + vy0 * ease * dragFactor + 0.5 * p.gravity * ease * ease;

      // alpha some no fim
      final alpha = (1.0 - Curves.easeIn.transform(localT)).clamp(0.0, 1.0);

      paint.color = p.color.withOpacity(alpha);

      // rotação/shape
      final rot = p.spin * ease;

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(rot);

      if (p.shape == _Shape.circle) {
        canvas.drawCircle(Offset.zero, p.radius, paint);
      } else {
        final w = p.radius * 2.2;
        final h = p.radius * 1.2;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: Offset.zero, width: w, height: h),
            Radius.circular(p.radius),
          ),
          paint,
        );
      }

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter oldDelegate) =>
      oldDelegate.t != t || oldDelegate.particles != particles;
}
