import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

class TspIntroScreen extends StatelessWidget {
  static const route = '/tsp-intro';
  const TspIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: const Text('TSP')),
      body: Center(child: Text(t.tpsScreenSoon)),
    );
  }
}
