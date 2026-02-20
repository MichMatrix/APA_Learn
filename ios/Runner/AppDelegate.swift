import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

  private let channelName = "apa_learn/app_version"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: channelName,
      binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler { (call, result) in
        if call.method == "getAppVersion" {
            let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
            let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""

            result([
              "version": version,
              "build": build
            ])
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
