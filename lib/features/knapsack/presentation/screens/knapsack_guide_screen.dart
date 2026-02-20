import 'package:flutter/material.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/utils/extensions/context_media_query_ext.dart';
import '../widgets/knapsack_guide/guide_algo_accordion.dart';
import '../widgets/knapsack_guide/guide_hero.dart';
import '../widgets/knapsack_guide/guide_section_title.dart';
import '../../../../l10n/app_localizations.dart';


class KnapsackGuideScreen extends StatelessWidget {
  static const String route = '/knapsack-guide';
  const KnapsackGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    final w = context.w;
    final h = context.h;

    final padX = (w * 0.045).clamp(14.0, 20.0);
    final padTop = (h * 0.018).clamp(10.0, 16.0);
    final gap = (h * 0.014).clamp(10.0, 14.0);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.knapsackGuideTitle),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(padX, padTop, padX, 16),
        children: [
          const GuideHero(),

          SizedBox(height: gap),

          GuideSectionTitle(title: t.context),
          const SizedBox(height: 8),
          _GuideTextCard(
            text: t.knapsackGuideContextText,
          ),

          SizedBox(height: gap),

          GuideSectionTitle(title: t.whyHard),
          const SizedBox(height: 8),
          _GuideTextCard(
            text: t.knapsackGuideWhyHardText, 
          ),

          SizedBox(height: gap),

          GuideSectionTitle(title: t.howBecomesGame),
          const SizedBox(height: 8),
          _GuideTextCard(
            text: t.knapsackGuideHowGameText,
          ),

          SizedBox(height: gap),

          GuideSectionTitle(title: t.commonAlgorithms),
          const SizedBox(height: 10),

          GuideAlgoAccordion(
            items: [
              GuideAlgoAccordionItem(
                icon: Icons.bolt_rounded,
                title: t.greedyTitle, 
                subtitle: t.greedySubtitle,
                badge: t.approxBadge,
                bullets: [
                  t.greedyBullet1,
                  t.greedyBullet2,
                  t.greedyBullet3,
                ],
                badgeColor: AppColors.warning,
              ),
              GuideAlgoAccordionItem(
                icon: Icons.grid_on_rounded,
                title: t.dpTitle,
                subtitle: t.dpSubtitle,
                badge: t.optimalBadge,
                bullets: [
                  t.dpBullet1,
                  t.dpBullet2,
                  t.dpBullet3,
                ],
                badgeColor: AppColors.success,
              ),
              GuideAlgoAccordionItem(
                icon: Icons.functions_rounded,
                title: t.bruteforceTitle,
                subtitle: t.bruteforceSubtitle,
                badge: t.didacticBadge,
                bullets: [
                  t.bruteforceBullet1,
                  t.bruteforceBullet2,
                  t.bruteforceBullet3,
                ],
                badgeColor: AppColors.primary,
              ),
            ],
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _GuideTextCard extends StatelessWidget {
  final String text;
  const _GuideTextCard({required this.text});

  @override
  Widget build(BuildContext context) {
    final isSmall = context.isSmallPhone;
    return Card(
      child: Padding(
        padding: EdgeInsets.all(isSmall ? 12 : 14),
        child: Text(
          text,
          style: const TextStyle(
            height: 1.25,
            fontWeight: FontWeight.w700,
            color: AppColors.text,
          ),
        ),
      ),
    );
  }
}
