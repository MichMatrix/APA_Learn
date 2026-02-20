import 'package:flutter/services.dart';

class AppVersionService {
  static const MethodChannel _channel =
      MethodChannel('apa_learn/app_version');

  static Future<String> getVersion() async {
    try {
      final result = await _channel.invokeMethod<Map>('getAppVersion');
      final version = result?['version'] ?? '';
      final build = result?['build'] ?? '';
      return '$version+$build';
    } catch (_) {
      return 'dev';
    }
  }
}
