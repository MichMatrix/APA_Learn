// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get splashSubtitle => 'Fun + Algorithms';

  @override
  String get loading => 'Loading...';

  @override
  String get splashFooter => 'v0.1 • Knapsack module';

  @override
  String get appTitle => 'APA Learn';

  @override
  String get home => 'Home';

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get portuguese => 'Portuguese';

  @override
  String get english => 'English';

  @override
  String get version => 'Version';

  @override
  String get updateTitle => 'Update Required';

  @override
  String get updateMessage =>
      'A new version of the app is available with important improvements and fixes.\n\nPlease update now to continue.';

  @override
  String get updateButton => 'Update Now';

  @override
  String get updateLater => 'Later';

  @override
  String get updateIgnore => 'Ignore';

  @override
  String get modules => 'Modules';

  @override
  String get homeHeroSubtitle => 'Learn algorithms like a game.';

  @override
  String get xpLabel => 'XP';

  @override
  String get rankLabel => 'Rank';

  @override
  String get difficultyEasy => 'Easy';

  @override
  String get difficultyMedium => 'Medium';

  @override
  String get difficultyHard => 'Hard';

  @override
  String get btnGuide => 'Guide';

  @override
  String get btnPlay => 'Play';

  @override
  String get knapsackTitle => 'Knapsack Problem';

  @override
  String get knapsackSubtitle =>
      'Pick items and maximize value without exceeding capacity.';

  @override
  String get tspTitle => 'Traveling Salesman Problem';

  @override
  String get tspSubtitle =>
      'Find the shortest route visiting all cities and returning to the start.';

  @override
  String get knapsackIntroAppBarTitle => 'Knapsack Problem';

  @override
  String get knapsackIntroChooseDifficulty => 'Choose your difficulty';

  @override
  String get knapsackIntroStartMission => 'Start mission';

  @override
  String get knapsackIntroHintBeginner =>
      'Tip: focus on items with high value and low weight.';

  @override
  String get knapsackIntroHintIntermediate =>
      'Tip: the highest value doesn\'t always win. Think about combinations.';

  @override
  String get knapsackIntroHintAdvanced =>
      'Tip: maximize efficiency (value/weight).';

  @override
  String get knapsackIntroHeaderText =>
      'Choose items with weight and value.\nMaximize value without exceeding capacity.';

  @override
  String get capacityCardTitle => 'Backpack capacity';

  @override
  String get capacityCardSubtitle =>
      'Adjust capacity to make the challenge your way.';

  @override
  String difficultyTagItems(int count) {
    return 'Items: up to $count';
  }

  @override
  String difficultyTagCapacity(int min, int max) {
    return 'Cap.: $min-$max';
  }

  @override
  String get difficultyTagHints => 'Hints';

  @override
  String get difficultyTagTimer => 'Timer';

  @override
  String valueLabel(int value) {
    return 'Value';
  }

  @override
  String weightLabel(int used, int capacity) {
    return 'Weight: $used / $capacity';
  }

  @override
  String get knapsackBoardingTitle => 'Knapsack Problem';

  @override
  String get knapsackBoardingSubtitle =>
      'You are an explorer and found treasures! But your backpack has a weight limit.';

  @override
  String get knapsackBoardingHighlight =>
      'Pick the right items to maximize your treasure!';

  @override
  String get knapsackBoardingObjectiveTitle => 'Objective';

  @override
  String get knapsackBoardingObjectiveText =>
      'Select items for your backpack respecting the weight limit and maximizing total value!';

  @override
  String get knapsackBoardingPillWeight => 'Weight Limit';

  @override
  String get knapsackBoardingPillValue => 'Max Value';

  @override
  String get knapsackBoardingCta => 'Start Adventure';

  @override
  String get knapsackDifficultyBeginnerTitle => 'Beginner';

  @override
  String get knapsackDifficultyBeginnerSubtitle =>
      'Fewer items, hints, and no pressure.';

  @override
  String get knapsackDifficultyIntermediateTitle => 'Intermediate';

  @override
  String get knapsackDifficultyIntermediateSubtitle =>
      'More items and tougher choices.';

  @override
  String get knapsackDifficultyAdvancedTitle => 'Advanced';

  @override
  String get knapsackDifficultyAdvancedSubtitle =>
      'Real challenge: more items and fewer hints.';

  @override
  String get knapsackItemCoin => 'Coin';

  @override
  String get knapsackItemGem => 'Gem';

  @override
  String get knapsackItemBook => 'Book';

  @override
  String get knapsackItemPhone => 'Phone';

  @override
  String get knapsackItemWatch => 'Watch';

  @override
  String get knapsackItemTablet => 'Tablet';

  @override
  String get knapsackItemKindle => 'Kindle';

  @override
  String get knapsackItemHeadphone => 'Headphones';

  @override
  String get knapsackItemVR => 'VR';

  @override
  String get knapsackItemConsole => 'Console';

  @override
  String get knapsackGuideTitle => 'Guide: Knapsack Problem';

  @override
  String get context => 'Context';

  @override
  String get whyHard => 'Why is it hard?';

  @override
  String get howBecomesGame => 'How does it become a game?';

  @override
  String get commonAlgorithms => 'Common algorithms';

  @override
  String get knapsackGuideContextText =>
      'Imagine you are traveling and can only carry a backpack with limited weight. Each item has weight and value. The goal is to maximize total value without exceeding capacity.';

  @override
  String get knapsackGuideWhyHardText =>
      'Testing all possible combinations grows exponentially. That’s why the problem is NP-hard.';

  @override
  String get knapsackGuideHowGameText =>
      'You drag items into the backpack. Try to reach the optimal value. Higher levels may include timers and fewer hints.';

  @override
  String get greedyTitle => 'Greedy';

  @override
  String get greedySubtitle => 'Fast, but may miss the optimal solution';

  @override
  String get greedyBullet1 => 'Select by best value/weight ratio';

  @override
  String get greedyBullet2 => 'Very fast (good approximation)';

  @override
  String get greedyBullet3 => 'May fail in some cases';

  @override
  String get approxBadge => 'Approximation';

  @override
  String get dpTitle => 'Dynamic Programming (DP)';

  @override
  String get dpSubtitle => 'Finds the optimal solution for 0/1 knapsack';

  @override
  String get dpBullet1 => 'Builds a dp[item][capacity] table';

  @override
  String get dpBullet2 => 'Guarantees optimal solution';

  @override
  String get dpBullet3 => 'Time complexity ~ O(n * capacity)';

  @override
  String get optimalBadge => 'Optimal';

  @override
  String get bruteforceTitle => 'Backtracking / Brute Force';

  @override
  String get bruteforceSubtitle => 'Explores combinations';

  @override
  String get bruteforceBullet1 => 'Demonstrates combinatorial explosion';

  @override
  String get bruteforceBullet2 => 'Useful for learning';

  @override
  String get bruteforceBullet3 => 'Becomes slow quickly';

  @override
  String get didacticBadge => 'Didactic';

  @override
  String get resultTitle => 'Result';

  @override
  String get capacityLabel => 'Capacity';

  @override
  String get usedWeightLabel => 'Used Weight';

  @override
  String get failBadge => 'Needs Improvement';

  @override
  String get okBadge => 'Good';

  @override
  String get greatBadge => 'Excellent';

  @override
  String percentageOfOptimal(Object percent) {
    return 'You reached $percent% of optimal';
  }

  @override
  String get retry => 'Retry';

  @override
  String get nextLevel => 'Next Level';

  @override
  String get homeButton => 'Home';

  @override
  String get suggestion => 'Suggestion';

  @override
  String get viewOptimalSolution => 'View Optimal Solution';

  @override
  String get knapsackGuideHeroBadge => 'Knapsack Problem';

  @override
  String get knapsackGuideHeroTitle =>
      'Pick items and maximize value without exceeding capacity.';

  @override
  String get knapsackGuideHeroSubtitle =>
      'Understand the context and algorithms before playing.';

  @override
  String get knapsackPlayTitle => 'Game: Knapsack';

  @override
  String get knapsackPlayTimerPrefix => '⏱';

  @override
  String get knapsackPlayTimerSuffix => 's';

  @override
  String get knapsackPlayResetTooltip => 'Reset';

  @override
  String get knapsackPlayHintBeginner =>
      'Tip: try combining light items with high value.';

  @override
  String get knapsackPlayHintIntermediate =>
      'Tip: the most valuable item is not always the best choice.';

  @override
  String get knapsackPlayHintAdvanced =>
      'Tip: maximize efficiency (value/weight).';

  @override
  String get knapsackPlaySelectedTitle => 'In your backpack (tap to remove)';

  @override
  String get knapsackPlayAvailableTitle => 'Available items (drag)';

  @override
  String get knapsackPlayJumpLeftTooltip => 'Previous item';

  @override
  String get knapsackPlayJumpRightTooltip => 'Next item';

  @override
  String get knapsackPlayScrollHintLabel => 'Swipe';

  @override
  String get knapsackPlayFinishCta => 'Finish';

  @override
  String get knapsackPlayNoItemSelected => 'No item was selected yet';

  @override
  String get knapsackPlayTap => 'Tap';

  @override
  String get knapsackPlayDropHere => 'Drop here!';

  @override
  String get knapsackPlayDragItemstoTheBag => 'Drag the items to the bag';

  @override
  String get knapsackResultTitle => 'Result';

  @override
  String get knapsackResultGreatTitle => 'Great! Excellent decision';

  @override
  String get knapsackResultOkTitle => 'Ok! Good choice';

  @override
  String get knapsackResultFailTitle => 'Close! You can improve';

  @override
  String get knapsackResultBadgeFail => 'FAIL';

  @override
  String get knapsackResultBadgeOk => 'OK';

  @override
  String get knapsackResultBadgeGreat => 'GREAT';

  @override
  String get knapsackResultOptimalDpLabel => 'Optimal (DP)';

  @override
  String get knapsackResultGapLabel => 'Gap';

  @override
  String get knapsackResultSeeOptimalCta => 'See optimal solution (DP)';

  @override
  String get knapsackResultRetryCta => 'Retry';

  @override
  String get knapsackResultNextLevelCta => 'Next level';

  @override
  String get knapsackResultHomeCta => 'Home';

  @override
  String get knapsackResultCloseCta => 'Close';

  @override
  String knapsackResultPctOfOptimal(int pct) {
    return '$pct% of optimal';
  }

  @override
  String knapsackResultCapacityUsedWeight(int cap, int used) {
    return 'Capacity: $cap • Used weight: $used';
  }

  @override
  String knapsackResultValue(int value) {
    return 'Value: $value';
  }

  @override
  String knapsackResultSuggestionLeftoverWithItem(
    int waste,
    String name,
    int weight,
    int value,
  ) {
    return 'You left $waste capacity unused. Try adding \"$name\" (weight $weight, value $value).';
  }

  @override
  String knapsackResultSuggestionLeftoverGeneric(int waste) {
    return 'You left $waste capacity unused. Try adding a light item to increase value.';
  }

  @override
  String knapsackResultSuggestionTryInclude(
    String name,
    int weight,
    int value,
  ) {
    return 'Tip: optimal solutions often include \"$name\" (weight $weight, value $value). Try swapping items to fit it.';
  }

  @override
  String get knapsackResultSuggestionGenericLow =>
      'Try prioritizing items with better value-to-weight ratio (⭐/💪). Heavier items are not always worth it.';

  @override
  String get knapsackResultOptimalSheetTitle => 'Optimal solution (DP)';

  @override
  String get profileScreenSoon => 'Profile (coming soon)';

  @override
  String get tpsScreenSoon =>
      'Introduction to The Traveling Salesman (coming soon)';
}
