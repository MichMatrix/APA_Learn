import 'package:flutter/material.dart';
import '../../../app/routes/routes.dart';
import '../../../core/colors/app_colors.dart';
import '../../../core/navigation/shell_nav_controller.dart';
import '../../../l10n/app_localizations.dart';
import 'widgets/home_hero.dart';
import 'widgets/mission_card.dart';
import 'widgets/pill.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/home';
  final ShellNavController nav;
  const HomeScreen({super.key, required this.nav});

  TextStyle _caveat(double size, {Color? color}) {
    return TextStyle(
      fontFamily: 'Caveat',
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: color ?? AppColors.text,
      height: 1.0,
      letterSpacing: 0.2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HomeHero(t: t, nav: nav)),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
              child: Row(
                children: [
                  Text(t.modules, style: _caveat(26)),
                  const Spacer(),
                  Pill(
                    icon: Icons.local_fire_department_rounded,
                    label: t.xpLabel,
                  ),
                  const SizedBox(width: 10),
                  Pill(
                    icon: Icons.emoji_events_rounded,
                    label: '${t.rankLabel} B',
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 18),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  MissionCard(
                    title: t.knapsackTitle,
                    subtitle: t.knapsackSubtitle,
                    asset: 'assets/images/knapsack/backpack.png',
                    badgeLeft: 'NP-hard',
                    badgeRight: 'DP',
                    difficultyLabel: t.difficultyMedium,
                    guideLabel: t.btnGuide,
                    playLabel: t.btnPlay,
                    onGuide: () => Navigator.pushNamed(context, AppRoutes.knapsackGuide),
                    onPlay: () => Navigator.pushNamed(context, AppRoutes.knapsackIntroBoarding),
                  ),
                  const SizedBox(height: 14),
                  MissionCard(
                    title: t.tspTitle,
                    subtitle: t.tspSubtitle,
                    icon: Icons.route_rounded,
                    badgeLeft: 'NP-hard',
                    badgeRight: 'Heuristics',
                    difficultyLabel: t.difficultyHard,
                    guideLabel: t.btnGuide,
                    playLabel: t.btnPlay,
                    onGuide: () {},
                    onPlay: () => Navigator.pushNamed(context, AppRoutes.tspIntro),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
