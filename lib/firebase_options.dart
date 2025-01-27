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
    apiKey: 'AIzaSyAxuZtfz7aU_9LPLIqzeg3-vhT8HnUvvVo',
    appId: '1:557253368773:web:9951066d0d16c57d8e49ac',
    messagingSenderId: '557253368773',
    projectId: 'chatapp-aa58a',
    authDomain: 'chatapp-aa58a.firebaseapp.com',
    storageBucket: 'chatapp-aa58a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYI4m-DCcQvb6_s991nyAJmTYbPAdpAeA',
    appId: '1:557253368773:android:e1e116f5897aa7428e49ac',
    messagingSenderId: '557253368773',
    projectId: 'chatapp-aa58a',
    storageBucket: 'chatapp-aa58a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwgDyU3Em9lrVIs2qJkGxQbN5ay8Zv4ic',
    appId: '1:557253368773:ios:ce0714189533ca648e49ac',
    messagingSenderId: '557253368773',
    projectId: 'chatapp-aa58a',
    storageBucket: 'chatapp-aa58a.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwgDyU3Em9lrVIs2qJkGxQbN5ay8Zv4ic',
    appId: '1:557253368773:ios:ce0714189533ca648e49ac',
    messagingSenderId: '557253368773',
    projectId: 'chatapp-aa58a',
    storageBucket: 'chatapp-aa58a.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAxuZtfz7aU_9LPLIqzeg3-vhT8HnUvvVo',
    appId: '1:557253368773:web:abf7ed8171dcf51e8e49ac',
    messagingSenderId: '557253368773',
    projectId: 'chatapp-aa58a',
    authDomain: 'chatapp-aa58a.firebaseapp.com',
    storageBucket: 'chatapp-aa58a.appspot.com',
  );
}
