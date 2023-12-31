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
    apiKey: 'AIzaSyA3b0dEOsuR-OQq8UkBBg-sYjL31h9_HD0',
    appId: '1:998122089982:web:d2b5ec7ee06f46fb69a4af',
    messagingSenderId: '998122089982',
    projectId: 'unote-e2f13',
    authDomain: 'unote-e2f13.firebaseapp.com',
    storageBucket: 'unote-e2f13.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsuWhRZO2NZaVGNB1JJYpIgUfv6HFscTg',
    appId: '1:998122089982:android:8feb092d6fbb01ad69a4af',
    messagingSenderId: '998122089982',
    projectId: 'unote-e2f13',
    storageBucket: 'unote-e2f13.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAG26VsA4V_NsSwBlXWJI7mf06rMVh1JYc',
    appId: '1:998122089982:ios:d34033b85bae5c0269a4af',
    messagingSenderId: '998122089982',
    projectId: 'unote-e2f13',
    storageBucket: 'unote-e2f13.appspot.com',
    iosClientId: '998122089982-7890c0s2a9b9mkai3iol2g5cf8hcm013.apps.googleusercontent.com',
    iosBundleId: 'com.unote.unote',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAG26VsA4V_NsSwBlXWJI7mf06rMVh1JYc',
    appId: '1:998122089982:ios:d1e4b435fd5e61bb69a4af',
    messagingSenderId: '998122089982',
    projectId: 'unote-e2f13',
    storageBucket: 'unote-e2f13.appspot.com',
    iosClientId: '998122089982-c62adpalai9p609v1cb9vkjtg0sta0v1.apps.googleusercontent.com',
    iosBundleId: 'com.unote.unote.RunnerTests',
  );
}
