import Flutter
import UIKit
import OneSignalFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
[UIApplication.LaunchOptionsKey: Any]?) -> Bool {

  // Remove this method to stop OneSignal Debugging
  OneSignal.Debug.setLogLevel(.LL_VERBOSE)

  // OneSignal initialization
  OneSignal.initialize("1cb74d81-5e43-411f-bb8a-22828e6d385a", withLaunchOptions: launchOptions)

  // requestPermission will show the native iOS notification permission prompt.
  // We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.Notifications.requestPermission({ accepted in
    print("User accepted notifications: (accepted)")
  }, fallbackToSettings: true)

  // Login your customer with externalId
  // OneSignal.login("EXTERNAL_ID")

  return true
}

// Remaining contents of your AppDelegate Class...
}
