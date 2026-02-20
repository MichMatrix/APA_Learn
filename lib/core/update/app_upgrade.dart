import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

import '../../l10n/app_localizations.dart';

class AppUpgrade {
  static Upgrader upgrader({required BuildContext context}) {
    final t = AppLocalizations.of(context)!;
    return Upgrader(
      debugLogging: false,
      durationUntilAlertAgain: Duration.zero,
      messages:  _PtBrUpgraderMessages(t),
    );
  }
}

class _PtBrUpgraderMessages extends UpgraderMessages {
  _PtBrUpgraderMessages(this.t);
  final AppLocalizations t;

  @override
  String get title => t.updateTitle;

  @override
  String message(UpgraderMessage message) {
    return t.updateMessage;
  }

  @override
  String get buttonTitleUpdate => t.updateButton;

  @override
  String get buttonTitleLater => t.updateLater;

  @override
  String get buttonTitleIgnore => t.updateIgnore;
}
