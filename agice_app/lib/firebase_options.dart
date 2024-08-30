// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyABhE1QHdTcTf1q1EU6g3wzfD91C8b-iYo',
    appId: '1:209861187648:web:66d6b6c38dc4d29e6627a5',
    messagingSenderId: '209861187648',
    projectId: 'agiceapp',
    authDomain: 'agiceapp.firebaseapp.com',
    storageBucket: 'agiceapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAq1RvnBln90WHMMKfi3oZqaIS18O0fDqk',
    appId: '1:117913698284:android:4d20587013493180a90ac9',
    messagingSenderId: '117913698284',
    projectId: 'cecspace-e7ef6',
    storageBucket: 'cecspace-e7ef6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjj_BXGSudDh9LnjEgStq5-ohSIfIDE10',
    appId: '1:209861187648:ios:f50577798d8631846627a5',
    messagingSenderId: '209861187648',
    projectId: 'agiceapp',
    storageBucket: 'agiceapp.appspot.com',
    iosBundleId: 'com.agice.agiceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjj_BXGSudDh9LnjEgStq5-ohSIfIDE10',
    appId: '1:209861187648:ios:f50577798d8631846627a5',
    messagingSenderId: '209861187648',
    projectId: 'agiceapp',
    storageBucket: 'agiceapp.appspot.com',
    iosBundleId: 'com.agice.agiceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyABhE1QHdTcTf1q1EU6g3wzfD91C8b-iYo',
    appId: '1:209861187648:web:1d7a262bb98556836627a5',
    messagingSenderId: '209861187648',
    projectId: 'agiceapp',
    authDomain: 'agiceapp.firebaseapp.com',
    storageBucket: 'agiceapp.appspot.com',
  );
}