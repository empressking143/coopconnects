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
        email: email,
        password: password,
      );
      User? user = result.user;
      return user != null
          ? UserModel(uid: user.uid, email: user.email!, displayName: user.displayName)
          : null;
    } on FirebaseAuthException catch (e) {
      print('Error during email sign-up: ${e.message}');
      throw Exception('Email sign-up failed: ${e.message}');
    } catch (e) {
      print('Unknown error: $e');
      throw Exception('Email sign-up failed: $e');
    }
  }

  // Sign in with email and password
  Future<UserModel?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user != null
          ? UserModel(uid: user.uid, email: user.email!, displayName: user.displayName)
          : null;
    } on FirebaseAuthException catch (e) {
      print('Error during email sign-in: ${e.message}');
      throw Exception('Email sign-in failed: ${e.message}');
    } catch (e) {
      print('Unknown error: $e');
      throw Exception('Email sign-in failed: $e');
    }
  }

  // Sign in with Google
  Future<UserModel?> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw Exception('Google sign-in aborted');
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);
      User? user = result.user;

      return user != null
          ? UserModel(uid: user.uid, email: user.email!, displayName: user.displayName)
          : null;
    } on FirebaseAuthException catch (e) {
      print('Error during Google sign-in: ${e.message}');
      throw Exception('Google sign-in failed: ${e.message}');
    }
  }

  // Sign in with Facebook
  Future<UserModel?> signUpWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final AccessToken? accessToken = result.accessToken;
        if (accessToken == null || accessToken.tokenString.isEmpty) {
          throw Exception('Facebook login failed: No access token');
        }

        final credential = FacebookAuthProvider.credential(accessToken.tokenString);
        UserCredential authResult = await _auth.signInWithCredential(credential);
        User? user = authResult.user;

        return user != null
            ? UserModel(uid: user.uid, email: user.email ?? 'N/A', displayName: user.displayName ?? 'N/A')
            : null;
      } else {
        throw Exception('Facebook login failed: ${result.status}');
      }
    } on FirebaseAuthException catch (e) {
      print('Error during Facebook sign-in: ${e.message}');
      throw Exception('Facebook sign-in failed: ${e.message}');
    }
  }

  // Logout from all services
  Future<void> logout() async {
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut(); // Sign out from Google
      await FacebookAuth.instance.logOut(); // Sign out from Facebook
    } catch (e) {
      print("Error during logout: $e");
      throw Exception('Logout failed: $e');
    }
  }
}
