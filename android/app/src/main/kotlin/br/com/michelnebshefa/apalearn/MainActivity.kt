package br.com.michelnebshefa.apalearn

import android.content.pm.PackageManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "apa_learn/app_version"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->

                if (call.method == "getAppVersion") {
                    try {
                        val pInfo = packageManager.getPackageInfo(packageName, 0)
                        val versionName = pInfo.versionName
                        val versionCode = pInfo.longVersionCode

                        val map = mapOf(
                            "version" to versionName,
                            "build" to versionCode.toString()
                        )

                        result.success(map)
                    } catch (e: PackageManager.NameNotFoundException) {
                        result.error("UNAVAILABLE", "Version not available", null)
                    }
                } else {
                    result.notImplemented()
                }
            }
    }
}

