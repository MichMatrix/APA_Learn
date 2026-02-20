import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/navigation/shell_nav_controller.dart';
import '../../shell/presentation/controller/app_settings_controller.dart';
import '../../../l10n/app_localizations.dart';
import '../../shell/presentation/screen/shell_screen.dart';

class SplashScreen extends StatefulWidget {
  final AppSettingsController settings;
  final ShellNavController nav;

  const SplashScreen({
    super.key,
    required this.settings,
    required this.nav,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  late final Animation<double> _fadeIn;
  late final Animation<double> _logoScale;
  late final Animation<double> _shine;
  late final Animation<double> _loadingPulse;

  Timer? _timer;
  
  @override
  void initState() {
    super.initState();

    _c = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    );

    _fadeIn = CurvedAnimation(parent: _c, curve: const Interval(0.00, 0.40, curve: Curves.easeOut));

    _logoScale = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _c, curve: const Interval(0.05, 0.55, curve: Curves.elasticOut)),
    );

    // brilho no fundo (leve)
    _shine = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _c, curve: const Interval(0.10, 1.00, curve: Curves.easeInOut)),
    );

    // pulsar do loading
    _loadingPulse = Tween<double>(begin: 0.92, end: 1.06).animate(
      CurvedAnimation(parent: _c, curve: const Interval(0.55, 1.00, curve: Curves.easeInOut)),
    );

    _c.forward();

    _timer = Timer(const Duration(milliseconds: 3200), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ShellScreen(settings: widget.settings, nav: widget.nav),
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _c.dispose();
    super.dispose();
  }

  double _sin01(double t) => (sin(t) + 1) / 2; // 0..1

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _c,
        builder: (_, __) {
          final t = _c.value; // 0..1


          final floatPx = lerpDouble(0, -14, _sin01(t * 2 * pi * 1.2))!; // sobe/desce suave

          return Stack(
            children: [
              Positioned.fill(
                child: DecoratedBox(
                  decoration: const BoxDecoration(gradient: AppColors.heroGradient),
                  child: CustomPaint(
                    painter: _SplashBlobsPainter(progress: _shine.value),
                  ),
                ),
              ),

              // Partículas (bolinhas) bem sutis
              Positioned.fill(
                child: IgnorePointer(
                  child: CustomPaint(
                    painter: _ParticlesPainter(progress: t),
                  ),
                ),
              ),

              // Conteúdo
              Center(
                child: FadeTransition(
                  opacity: _fadeIn,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.translate(
                        offset: Offset(0, floatPx),
                        child: Transform.scale(
                          scale: _logoScale.value,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/logo/logo_APA_learn.png',
                                height: size.height * 0.18,
                                fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => const Icon(
                                  Icons.school,
                                  size: 92,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                loc.appTitle,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                loc.splashSubtitle,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 26),

                      // Loading animado 
                      Transform.scale(
                        scale: _loadingPulse.value,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.14),
                            borderRadius: BorderRadius.circular(999),
                            border: Border.all(color: Colors.white.withOpacity(0.18)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.4,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                loc.loading,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Rodapé discreto
              Positioned(
                bottom: 18,
                left: 0,
                right: 0,
                child: Text(
                  loc.splashFooter,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.75),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SplashBlobsPainter extends CustomPainter {
  final double progress; // 0..1
  _SplashBlobsPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final p = progress;

    final paint1 = Paint()..color = Colors.white.withOpacity(0.12 * p);
    final paint2 = Paint()..color = Colors.white.withOpacity(0.08 * p);
    final paint3 = Paint()..color = Colors.white.withOpacity(0.06 * p);

    // blob superior esquerdo
    canvas.drawCircle(Offset(size.width * 0.18, size.height * 0.20), size.width * 0.26, paint2);
    canvas.drawCircle(Offset(size.width * 0.30, size.height * 0.14), size.width * 0.18, paint3);

    // blob superior direito
    canvas.drawCircle(Offset(size.width * 0.88, size.height * 0.16), size.width * 0.22, paint3);

    // blob inferior
    canvas.drawCircle(Offset(size.width * 0.60, size.height * 0.92), size.width * 0.40, paint1);
    canvas.drawCircle(Offset(size.width * 0.22, size.height * 0.88), size.width * 0.28, paint2);
  }

  @override
  bool shouldRepaint(covariant _SplashBlobsPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _ParticlesPainter extends CustomPainter {
  final double progress; // 0..1
  _ParticlesPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final t = progress;

    final particles = <_Particle>[
      _Particle(0.15, 0.35, 10, 0.9),
      _Particle(0.30, 0.55, 6, 1.2),
      _Particle(0.52, 0.42, 8, 1.0),
      _Particle(0.78, 0.36, 7, 0.8),
      _Particle(0.86, 0.58, 9, 1.1),
      _Particle(0.40, 0.22, 5, 1.4),
      _Particle(0.62, 0.70, 6, 1.3),
    ];

    for (final p in particles) {
      final wave = sin((t * 2 * pi * p.speed) + (p.x * 10));
      final dy = wave * 10; // deslocamento vertical

      final alpha = 0.10 + (0.06 * ((sin(t * 2 * pi) + 1) / 2));
      final paint = Paint()..color = Colors.white.withOpacity(alpha);

      canvas.drawCircle(
        Offset(size.width * p.x, size.height * p.y + dy),
        p.radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlesPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _Particle {
  final double x;
  final double y;
  final double radius;
  final double speed;
  _Particle(this.x, this.y, this.radius, this.speed);
}
