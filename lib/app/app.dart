import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../app/routes/route_generator.dart';
import '../features/shell/presentation/controller/app_settings_controller.dart';
import '../l10n/app_localizations.dart';
import '../core/navigation/shell_nav_controller.dart';
import '../features/splash/presentation/splash_screen.dart';

class APALearnApp extends StatelessWidget {
  final AppSettingsController settings;
  final ShellNavController nav;

  const APALearnApp({
    super.key,
    required this.settings,
    required this.nav,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settings,
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.generateRoute,

          locale: settings.locale,
          supportedLocales: const [Locale('pt'), Locale('en')],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          home: SplashScreen(settings: settings, nav: nav),
        );
      },
    );
  }
}
