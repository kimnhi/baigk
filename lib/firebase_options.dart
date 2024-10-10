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
    apiKey: 'AIzaSyDgY1Jci_k-XAqo07YiqDLOIQwR6xG1Eao',
    appId: '1:566276889189:web:24b952de43338a42f0848c',
    messagingSenderId: '566276889189',
    projectId: 'bai-gk',
    authDomain: 'bai-gk.firebaseapp.com',
    storageBucket: 'bai-gk.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaRZFeIh89FgT_HSn9PQSTzz21IDu3Tek',
    appId: '1:566276889189:android:b33d971a8c8a937af0848c',
    messagingSenderId: '566276889189',
    projectId: 'bai-gk',
    storageBucket: 'bai-gk.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB8sASutg0BHFHs6MJKiWLRm13OIVg4O3E',
    appId: '1:566276889189:ios:74cdd358c106e4faf0848c',
    messagingSenderId: '566276889189',
    projectId: 'bai-gk',
    storageBucket: 'bai-gk.appspot.com',
    iosBundleId: 'com.example.baiGk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB8sASutg0BHFHs6MJKiWLRm13OIVg4O3E',
    appId: '1:566276889189:ios:74cdd358c106e4faf0848c',
    messagingSenderId: '566276889189',
    projectId: 'bai-gk',
    storageBucket: 'bai-gk.appspot.com',
    iosBundleId: 'com.example.baiGk',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDgY1Jci_k-XAqo07YiqDLOIQwR6xG1Eao',
    appId: '1:566276889189:web:fa8a4c2bd843610af0848c',
    messagingSenderId: '566276889189',
    projectId: 'bai-gk',
    authDomain: 'bai-gk.firebaseapp.com',
    storageBucket: 'bai-gk.appspot.com',
  );
}