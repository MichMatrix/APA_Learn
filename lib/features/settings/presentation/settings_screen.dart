import 'package:flutter/material.dart';
import '../../../core/service/app_version_service.dart';
import '../../shell/presentation/controller/app_settings_controller.dart';
import '../../../l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  static const route = '/settings-screen';
  final AppSettingsController settings;

  const SettingsScreen({
    super.key,
    required this.settings,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _version = '...';

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final v = await AppVersionService.getVersion();
    if (!mounted) return;
    setState(() => _version = v);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final current = widget.settings.locale?.languageCode ?? 'pt';

    return Scaffold(
      appBar: AppBar(title: Text(t.settings)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.language),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      t.language,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                  DropdownButton<String>(
                    value: current,
                    onChanged: (v) {
                      if (v == null) return;
                      widget.settings.setLocale(Locale(v));
                      setState(() {});
                    },
                    items: [
                      DropdownMenuItem(value: 'pt', child: Text(t.portuguese)),
                      DropdownMenuItem(value: 'en', child: Text(t.english)),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.info),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      t.version,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                  Text(
                    _version,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
