import 'package:flutter/services.dart';

class FeedbackFx {
  static Future<void> success() async {
    await SystemSound.play(SystemSoundType.click);
    await HapticFeedback.mediumImpact();
  }

  static Future<void> fail() async {
    await SystemSound.play(SystemSoundType.click);
    await HapticFeedback.lightImpact();
  }

  static Future<void> great() async {
    // dois cliques com delay dá sensação de “tada”
    await SystemSound.play(SystemSoundType.click);
    await HapticFeedback.heavyImpact();
    await Future.delayed(const Duration(milliseconds: 90));
    await SystemSound.play(SystemSoundType.click);
  }
}
