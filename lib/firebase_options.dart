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
    apiKey: 'AIzaSyDp1xhMXveo7ntTHEEBJQGuQ82wa9aSa9E',
    appId: '1:992973793045:web:d9175668ab75db2ca2ab1c',
    messagingSenderId: '992973793045',
    projectId: 'act14-8392d',
    authDomain: 'act14-8392d.firebaseapp.com',
    storageBucket: 'act14-8392d.firebasestorage.app',
    measurementId: 'G-GERKVXPM1N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNp4tHPG3IchmH462OiEte-qv8iuPvW9c',
    appId: '1:992973793045:android:7c9ade7bae422c05a2ab1c',
    messagingSenderId: '992973793045',
    projectId: 'act14-8392d',
    storageBucket: 'act14-8392d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCHzqk9TsLzag5WHt04c81nEwns-a4qeII',
    appId: '1:992973793045:ios:1af2ce1e7ca7e6f7a2ab1c',
    messagingSenderId: '992973793045',
    projectId: 'act14-8392d',
    storageBucket: 'act14-8392d.firebasestorage.app',
    iosBundleId: 'com.example.act14',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCHzqk9TsLzag5WHt04c81nEwns-a4qeII',
    appId: '1:992973793045:ios:1af2ce1e7ca7e6f7a2ab1c',
    messagingSenderId: '992973793045',
    projectId: 'act14-8392d',
    storageBucket: 'act14-8392d.firebasestorage.app',
    iosBundleId: 'com.example.act14',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDp1xhMXveo7ntTHEEBJQGuQ82wa9aSa9E',
    appId: '1:992973793045:web:2de282b0bf4f9222a2ab1c',
    messagingSenderId: '992973793045',
    projectId: 'act14-8392d',
    authDomain: 'act14-8392d.firebaseapp.com',
    storageBucket: 'act14-8392d.firebasestorage.app',
    measurementId: 'G-XXK826E3MB',
  );
}
