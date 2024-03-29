// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyD-Enl7dXf7BQLY7kBlXlc2RHIOBQl1-zo',
    appId: '1:16974726706:web:ffd472fd09b92bb641de2b',
    messagingSenderId: '16974726706',
    projectId: 'lenovarusticia-8b130',
    authDomain: 'lenovarusticia-8b130.firebaseapp.com',
    storageBucket: 'lenovarusticia-8b130.appspot.com',
    measurementId: 'G-PGX104JP17',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0RbfwCRbcMdZXJ_CpNXuh9aPw36X1qlI',
    appId: '1:16974726706:android:832417901e8c1c0f41de2b',
    messagingSenderId: '16974726706',
    projectId: 'lenovarusticia-8b130',
    storageBucket: 'lenovarusticia-8b130.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA7JWnskqpSh2H-TtMNMFbEDLv_yYMWbBM',
    appId: '1:16974726706:ios:fd84e479b429306a41de2b',
    messagingSenderId: '16974726706',
    projectId: 'lenovarusticia-8b130',
    storageBucket: 'lenovarusticia-8b130.appspot.com',
    iosBundleId: 'com.lenovaustisica.lenovarustisia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA7JWnskqpSh2H-TtMNMFbEDLv_yYMWbBM',
    appId: '1:16974726706:ios:fbec6c6552f5eea141de2b',
    messagingSenderId: '16974726706',
    projectId: 'lenovarusticia-8b130',
    storageBucket: 'lenovarusticia-8b130.appspot.com',
    iosBundleId: 'com.lenovaustisica.lenovarustisia.RunnerTests',
  );
}
