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
    apiKey: 'AIzaSyDGolQpvm3tOIEzg36aALiWlofJs-dnrOM',
    appId: '1:15582756414:web:2b6081372b95ce6cff9b6f',
    messagingSenderId: '15582756414',
    projectId: 'terapiyacenter-b09dc',
    authDomain: 'terapiyacenter-b09dc.firebaseapp.com',
    storageBucket: 'terapiyacenter-b09dc.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBilMdAC96_4BCiW9aHIglZF33a_W3Mwo4',
    appId: '1:15582756414:android:ead61d61cfa8acbdff9b6f',
    messagingSenderId: '15582756414',
    projectId: 'terapiyacenter-b09dc',
    storageBucket: 'terapiyacenter-b09dc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-cHiuB8LS4_dKGT4KUu6xo_3tG6Jn9n4',
    appId: '1:15582756414:ios:c535df5eb1b139edff9b6f',
    messagingSenderId: '15582756414',
    projectId: 'terapiyacenter-b09dc',
    storageBucket: 'terapiyacenter-b09dc.firebasestorage.app',
    iosBundleId: 'com.example.terapiyaCenter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-cHiuB8LS4_dKGT4KUu6xo_3tG6Jn9n4',
    appId: '1:15582756414:ios:c535df5eb1b139edff9b6f',
    messagingSenderId: '15582756414',
    projectId: 'terapiyacenter-b09dc',
    storageBucket: 'terapiyacenter-b09dc.firebasestorage.app',
    iosBundleId: 'com.example.terapiyaCenter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDGolQpvm3tOIEzg36aALiWlofJs-dnrOM',
    appId: '1:15582756414:web:eaf9f27bd7428aeaff9b6f',
    messagingSenderId: '15582756414',
    projectId: 'terapiyacenter-b09dc',
    authDomain: 'terapiyacenter-b09dc.firebaseapp.com',
    storageBucket: 'terapiyacenter-b09dc.firebasestorage.app',
  );
}
