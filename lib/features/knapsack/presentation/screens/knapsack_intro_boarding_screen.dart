import 'package:flutter/material.dart';
import '../../../../app/routes/routes.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/knapsack_boarding/knapsack_boarding_back_button.dart';
import '../widgets/knapsack_boarding/knapsack_boarding_background.dart';
import '../widgets/knapsack_boarding/knapsack_boarding_cta.dart';
import '../widgets/knapsack_boarding/knapsack_boarding_header.dart';
import '../widgets/knapsack_boarding/knapsack_boarding_objective_card.dart';

class KnapsackIntroBoardingScreen extends StatelessWidget {
  static const route = '/knapsack/boarding';
  const KnapsackIntroBoardingScreen({super.key});

  void _goNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.knapsackIntro);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final canPop = Navigator.of(context).canPop();

    return Scaffold(
      body: KnapsackBoardingBackground(
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
                child: Column(
                  children: [
                    const SizedBox(height: 50),

                    KnapsackBoardingHeader(
                      title: t.knapsackBoardingTitle,
                      subtitle: t.knapsackBoardingSubtitle,
                      highlight: t.knapsackBoardingHighlight,
                    ),

                    const SizedBox(height: 18),

                    KnapsackBoardingObjectiveCard(
                      title: t.knapsackBoardingObjectiveTitle,
                      text: t.knapsackBoardingObjectiveText,
                      pillLeft: t.knapsackBoardingPillWeight,
                      pillRight: t.knapsackBoardingPillValue,
                    ),

                    const Spacer(),

                    KnapsackBoardingCta(
                      label: t.knapsackBoardingCta,
                      onTap: () => _goNext(context),
                    ),
                  ],
                ),
              ),

              if (canPop)
                Positioned(
                  top: 12,
                  left: 12,
                  child: WhiteBackButton(
                    onTap: () => Navigator.pop(context),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
