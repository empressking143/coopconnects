import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  Future<UserModel?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user != null
          ? UserModel(uid: user.uid, email: user.email!, displayName: user.displayName)
          : null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Sign in with Google
  Future<UserModel?> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);
      User? user = result.user;

      return user != null
          ? UserModel(uid: user.uid, email: user.email!, displayName: user.displayName)
          : null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Sign in with Facebook
  Future<UserModel?> signUpWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final credential = FacebookAuthProvider.credential(accessToken.tokenString);

        UserCredential authResult = await _auth.signInWithCredential(credential);
        User? user = authResult.user;

        return user != null
            ? UserModel(uid: user.uid, email: user.email!, displayName: user.displayName)
            : null;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
