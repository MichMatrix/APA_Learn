import 'package:flutter/material.dart';
import 'app/app.dart';
import 'features/shell/presentation/controller/app_settings_controller.dart';
import 'core/navigation/shell_nav_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final settings = AppSettingsController();
  await settings.load();

  final nav = ShellNavController();

  runApp(APALearnApp(settings: settings, nav: nav));
}
