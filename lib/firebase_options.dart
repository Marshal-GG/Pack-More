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
    apiKey: 'AIzaSyAPtJ9PyGlt6JGN_EpZiATaR45oy0awSoU',
    appId: '1:890210226667:web:cbb7dddc54f6346e3789ae',
    messagingSenderId: '890210226667',
    projectId: 'pack-more',
    authDomain: 'pack-more.firebaseapp.com',
    databaseURL: 'https://pack-more-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pack-more.appspot.com',
    measurementId: 'G-DJNL1MPGW3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWZLV9m8XHnCJI5FX-0Uwb9j-MAsBLrY4',
    appId: '1:890210226667:android:e96ead11e7183f313789ae',
    messagingSenderId: '890210226667',
    projectId: 'pack-more',
    databaseURL: 'https://pack-more-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pack-more.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCB9ehtN1kAIz1prm4dJJuE2_VZI9jckBk',
    appId: '1:890210226667:ios:0ba19b4e47231bc43789ae',
    messagingSenderId: '890210226667',
    projectId: 'pack-more',
    databaseURL: 'https://pack-more-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pack-more.appspot.com',
    androidClientId: '890210226667-va20qqa8acfm657j4eij60ejqcghquc9.apps.googleusercontent.com',
    iosClientId: '890210226667-4g8nnqhr417oajcll3nsmd1hv8mhirjo.apps.googleusercontent.com',
    iosBundleId: 'com.example.packmore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCB9ehtN1kAIz1prm4dJJuE2_VZI9jckBk',
    appId: '1:890210226667:ios:0ba19b4e47231bc43789ae',
    messagingSenderId: '890210226667',
    projectId: 'pack-more',
    databaseURL: 'https://pack-more-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'pack-more.appspot.com',
    androidClientId: '890210226667-va20qqa8acfm657j4eij60ejqcghquc9.apps.googleusercontent.com',
    iosClientId: '890210226667-4g8nnqhr417oajcll3nsmd1hv8mhirjo.apps.googleusercontent.com',
    iosBundleId: 'com.example.packmore',
  );
}
