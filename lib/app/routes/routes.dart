import '../../features/knapsack/presentation/screens/knapsack_guide_screen.dart';
import '../../features/knapsack/presentation/screens/knapsack_intro_boarding_screen.dart';
import '../../features/knapsack/presentation/screens/knapsack_intro_screen.dart';
import '../../features/knapsack/presentation/screens/knapsack_play_screen.dart';
import '../../features/knapsack/presentation/screens/knapsack_result_screen.dart';
import '../../features/tsp/presentation/screens/tsp_intro_screen.dart';
import '../../features/tsp/presentation/screens/tsp_play_screen.dart';
import '../../features/tsp/presentation/screens/tsp_result_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String shell = '/shell';

  // modules
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  
  static const String knapsackGuide = KnapsackGuideScreen.route;
  static const String knapsackIntroBoarding = KnapsackIntroBoardingScreen.route;
  static const String knapsackIntro = KnapsackIntroScreen.route;
  static const String knapsackPlay = KnapsackPlayScreen.route;
  static const String knapsackResult = KnapsackResultScreen.route;

  static const String tspIntro = TspIntroScreen.route;
  static const String tspPlay = TspPlayScreen.route;
  static const String tspResult = TspResultScreen.route;
}
