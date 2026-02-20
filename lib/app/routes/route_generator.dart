import 'package:flutter/material.dart';
import '../../core/settings/app_settings_controller.dart';
import '../../features/knapsack/presentation/screens/knapsack_guide_screen.dart';
import '../../features/knapsack/presentation/screens/knapsack_intro_boarding_screen.dart';
import '../../features/knapsack/presentation/screens/knapsack_intro_screen.dart';
import '../../features/knapsack/presentation/screens/knapsack_play_screen.dart';
import '../../features/knapsack/presentation/screens/knapsack_result_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/tsp/presentation/screens/tsp_intro_screen.dart';
import '../../features/tsp/presentation/screens/tsp_play_screen.dart';
import '../../features/tsp/presentation/screens/tsp_result_screen.dart';
import 'routes.dart';


class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {

      case AppRoutes.profile:
        return _page(const Scaffold(body: Center(child: Text('Profile Screen'))));

      case AppRoutes.settings:
        final controller = (args is AppSettingsController) ? args : null;
        if (controller == null) return _page(_NotFoundScreen(routeName: settings.name));
        return _page(SettingsScreen(settings: controller), settings: settings);

        

      // KNAPSACK
      case AppRoutes.knapsackGuide:
        return _page(const KnapsackGuideScreen());
      case AppRoutes.knapsackIntroBoarding:
        return _page(const KnapsackIntroBoardingScreen());
      case AppRoutes.knapsackIntro: 
        return _page(const KnapsackIntroScreen());
      case AppRoutes.knapsackPlay:
        final args = settings.arguments as Map? ?? {};
        final capacity = (args['capacity'] as int?) ?? 10;
        final difficulty = (args['difficulty'] as String?) ?? 'beginner';

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => KnapsackPlayScreen(
            capacity: capacity,
            difficultyId: difficulty,
          ),
        );

      case AppRoutes.knapsackResult:
        return _page(const KnapsackResultScreen(), settings: settings);

      // TSP
      case AppRoutes.tspIntro:
        return _page(const TspIntroScreen());
      case AppRoutes.tspPlay:
        return _page(const TspPlayScreen());
      case AppRoutes.tspResult:
        return _page(const TspResultScreen());

      default:
        return _page(_NotFoundScreen(routeName: settings.name));
    }
  }

  static MaterialPageRoute _page(
    Widget child, {
    RouteSettings? settings,
  }) {
    return MaterialPageRoute(
      settings: settings, 
      builder: (_) => child,
    );
  }

}

class _NotFoundScreen extends StatelessWidget {
  final String? routeName;
  const _NotFoundScreen({this.routeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Rota não encontrada: ${routeName ?? "desconhecida"}')),
    );
  }
}
