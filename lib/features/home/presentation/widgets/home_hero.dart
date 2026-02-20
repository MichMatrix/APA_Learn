import 'package:flutter/material.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/navigation/shell_nav_controller.dart';
import '../../../../l10n/app_localizations.dart';
import 'hero_chip.dart';

class HomeHero extends StatelessWidget {
  final AppLocalizations t;
  final ShellNavController nav;
  const HomeHero({super.key, required this.t, required this.nav});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 54, 16, 18),
      decoration: const BoxDecoration(
        gradient: AppColors.heroGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(26),
          bottomRight: Radius.circular(26),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -18,
            top: 10,
            child: Opacity(
              opacity: 0.16,
              child: Image.asset(
                'assets/images/background/pack_person_looking_sun.png',
                height: 170,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Opacity(
                    opacity: 0.5, 
                    child: Image.asset(
                      'assets/images/logo/logo_APA_learn.png',
                      height: size.height * 0.07,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.school,
                        size: 92,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'APA Learn',
                      style: TextStyle(
                        fontFamily: 'Caveat',
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1.0,
                      ),
                    ),
                  ),
                  HeroChip(
                    icon: Icons.translate_rounded,
                    label: 'PT/EN',
                    onTap: () {
                     nav.setIndex(2);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                t.homeHeroSubtitle,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 14),
            ],
          ),
        ],
      ),
    );
  }
}