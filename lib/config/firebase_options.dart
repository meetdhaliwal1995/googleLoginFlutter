import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.fuchsia:
        // TODO: Handle this case.
        break;
      case TargetPlatform.iOS:
        // TODO: Handle this case.
        break;
      case TargetPlatform.linux:
        // TODO: Handle this case.
        break;
      case TargetPlatform.macOS:
        // TODO: Handle this case.
        break;
      case TargetPlatform.windows:
        // TODO: Handle this case.
        break;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaDF-Bk3crUurOe9bEs_IVqyBFgHRlBCM',
    appId: '1:929562374987:android:3e0805650d2b1bc466aece',
    messagingSenderId: '929562374987',
    projectId: 'sign-in-flutter-bb234',
    storageBucket: 'sign-in-flutter-bb234.appspot.com',
  );
}
