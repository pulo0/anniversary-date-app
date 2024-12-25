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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCbFnQ-IfCUQQZv7zPwp5PrkfXag9vT6Cc',
    appId: '1:251125724269:web:bee282aea12bb9d6c4bb64',
    messagingSenderId: '251125724269',
    projectId: 'anniversary-app-flutter',
    authDomain: 'anniversary-app-flutter.firebaseapp.com',
    storageBucket: 'anniversary-app-flutter.firebasestorage.app',
    measurementId: 'G-XFMSX3BQHC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBx9TuVJDrRhcFA6cCDkxYwSY7v-95eHdI',
    appId: '1:251125724269:android:3ce474808da26c74c4bb64',
    messagingSenderId: '251125724269',
    projectId: 'anniversary-app-flutter',
    storageBucket: 'anniversary-app-flutter.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARjSe6cP-DXcaseYJA_lml2HoxTS4vrYY',
    appId: '1:251125724269:ios:8b0d31f46d35e3bcc4bb64',
    messagingSenderId: '251125724269',
    projectId: 'anniversary-app-flutter',
    storageBucket: 'anniversary-app-flutter.firebasestorage.app',
    iosBundleId: 'com.example.anniversaryDateApp',
  );
}
