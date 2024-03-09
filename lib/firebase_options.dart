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
    apiKey: 'AIzaSyDt4Q9GH1-jQqG_ahkoakcf47s098-ujOo',
    appId: '1:552081305588:web:79bf519c0bc289b19493a1',
    messagingSenderId: '552081305588',
    projectId: 'test-app-c1403',
    authDomain: 'test-app-c1403.firebaseapp.com',
    storageBucket: 'test-app-c1403.appspot.com',
    measurementId: 'G-JTYEYQ0GBF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIKmahJFXEFV0smGrTd94Zp6ga7etqBZs',
    appId: '1:552081305588:android:6406171ad44f6ef79493a1',
    messagingSenderId: '552081305588',
    projectId: 'test-app-c1403',
    storageBucket: 'test-app-c1403.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDaUqOPg-W75aCCzQRKPX2wgtrZ0hnhgFw',
    appId: '1:552081305588:ios:d841f3f846f937149493a1',
    messagingSenderId: '552081305588',
    projectId: 'test-app-c1403',
    storageBucket: 'test-app-c1403.appspot.com',
    iosBundleId: 'com.example.flutterTaskUserApp',
  );
}