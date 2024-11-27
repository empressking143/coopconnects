import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
          'DefaultFirebaseOptions have not been configured for Linux - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAIifwo4wmdHL-_7FbW9MONwMkqGT5Cl_M',
    appId: '1:869358196540:web:5eb2a1b41e804b9bd7b039',
    messagingSenderId: '869358196540',
    projectId: 'coopconnects',
    authDomain: 'coopconnects.firebaseapp.com',
    storageBucket: 'coopconnects.firebasestorage.app',
    measurementId: 'G-CZSQKNFMJB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCzefw7HWajYttJOn_JZ9eWGMHb2LoJagM',
    appId: '1:869358196540:android:b82147b88c63e5f3d7b039',
    messagingSenderId: '869358196540',
    projectId: 'coopconnects',
    storageBucket: 'coopconnects.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCx4Y6Lx5Uik6pWx8GtSlEs3dDlq2LamPU',
    appId: '1:869358196540:ios:1e10cd050d229c4ad7b039',
    messagingSenderId: '869358196540',
    projectId: 'coopconnects',
    storageBucket: 'coopconnects.firebasestorage.app',
    androidClientId: '869358196540-2krhi1ulo6v1psgkr7pftpktaub1a3pj.apps.googleusercontent.com',
    iosClientId: '869358196540-ot8cqtmv684u442tj5gq60h9ukhev7p9.apps.googleusercontent.com',
    iosBundleId: 'com.project.coopconnects',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCx4Y6Lx5Uik6pWx8GtSlEs3dDlq2LamPU',
    appId: '1:869358196540:ios:1e10cd050d229c4ad7b039',
    messagingSenderId: '869358196540',
    projectId: 'coopconnects',
    storageBucket: 'coopconnects.firebasestorage.app',
    androidClientId: '869358196540-2krhi1ulo6v1psgkr7pftpktaub1a3pj.apps.googleusercontent.com',
    iosClientId: '869358196540-ot8cqtmv684u442tj5gq60h9ukhev7p9.apps.googleusercontent.com',
    iosBundleId: 'com.project.coopconnects',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAIifwo4wmdHL-_7FbW9MONwMkqGT5Cl_M',
    appId: '1:869358196540:web:5eb2a1b41e804b9bd7b039',
    messagingSenderId: '869358196540',
    projectId: 'coopconnects',
    authDomain: 'coopconnects.firebaseapp.com',
    storageBucket: 'coopconnects.firebasestorage.app',
    measurementId: 'G-CZSQKNFMJB',
  );

}