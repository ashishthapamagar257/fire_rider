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
    apiKey: 'AIzaSyDzyEWr6BInfb74p_FTUqD9a8dcUM8CsW8',
    appId: '1:468546591828:web:db3d9e2fad97f33a3da1c1',
    messagingSenderId: '468546591828',
    projectId: 'first-app-31127',
    authDomain: 'first-app-31127.firebaseapp.com',
    storageBucket: 'first-app-31127.appspot.com',
    measurementId: 'G-YHRYSFGXJ1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGFhoFoSgfAcIGxREkyUCmlHK9nckvuxs',
    appId: '1:468546591828:android:fb5c1864d4aab17f3da1c1',
    messagingSenderId: '468546591828',
    projectId: 'first-app-31127',
    storageBucket: 'first-app-31127.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvBcIDt3EW-Eb7LoIzpQWYE4GczY4O3zI',
    appId: '1:468546591828:ios:64c9a37fa0c3874a3da1c1',
    messagingSenderId: '468546591828',
    projectId: 'first-app-31127',
    storageBucket: 'first-app-31127.appspot.com',
    iosBundleId: 'com.example.fireLeader',
  );
}
