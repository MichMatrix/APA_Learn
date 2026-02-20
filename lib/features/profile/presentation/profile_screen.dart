import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(t.profile)),
      body: Center(child: Text(t.profileScreenSoon)),
    );
  }
}
