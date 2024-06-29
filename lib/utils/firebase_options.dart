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
    apiKey: 'AIzaSyDUI3hBaznXUbNCez5puO1ZXhh3_VMhL6I',
    appId: '1:776656787726:web:138c81697504f76a841f5f',
    messagingSenderId: '776656787726',
    projectId: 'mopay-travellingo',
    authDomain: 'mopay-travellingo.firebaseapp.com',
    storageBucket: 'mopay-travellingo.appspot.com',
    measurementId: 'G-N86QQWYEW7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4lIICQmc6Gw0tnLOmfRZCmGu1ys9vxsw',
    appId: '1:776656787726:android:24847d7c784946ca841f5f',
    messagingSenderId: '776656787726',
    projectId: 'mopay-travellingo',
    storageBucket: 'mopay-travellingo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBBpO3Qhiphsvkg2lyCIIelPYynxEg-abo',
    appId: '1:776656787726:ios:be323c5c37370064841f5f',
    messagingSenderId: '776656787726',
    projectId: 'mopay-travellingo',
    storageBucket: 'mopay-travellingo.appspot.com',
    iosBundleId: 'com.example.mopayEwallet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBBpO3Qhiphsvkg2lyCIIelPYynxEg-abo',
    appId: '1:776656787726:ios:be323c5c37370064841f5f',
    messagingSenderId: '776656787726',
    projectId: 'mopay-travellingo',
    storageBucket: 'mopay-travellingo.appspot.com',
    iosBundleId: 'com.example.mopayEwallet',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDUI3hBaznXUbNCez5puO1ZXhh3_VMhL6I',
    appId: '1:776656787726:web:a64e2ebb2a979f03841f5f',
    messagingSenderId: '776656787726',
    projectId: 'mopay-travellingo',
    authDomain: 'mopay-travellingo.firebaseapp.com',
    storageBucket: 'mopay-travellingo.appspot.com',
    measurementId: 'G-SV376PMMF3',
  );
}
