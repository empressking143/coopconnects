import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  final AuthService _authService = AuthService();

  // Check if there's an existing session
  Future<void> checkSession() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      _user = UserModel(uid: firebaseUser.uid, email: firebaseUser.email!, displayName: firebaseUser.displayName);
    }
    notifyListeners();
  }

  // Sign up with email and password
  Future<bool> signUpWithEmail(String email, String password) async {
    try {
      _user = await _authService.signUpWithEmail(email, password);
      notifyListeners();
      return _user != null;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  // Sign in with email and password
  Future<bool> signInWithEmail(String email, String password) async {
    try {
      _user = await _authService.signInWithEmail(email, password);
      notifyListeners();
      return _user != null;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  // Sign up with Google
  Future<bool> signUpWithGoogle() async {
    try {
      _user = await _authService.signUpWithGoogle();
      notifyListeners();
      return _user != null;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  // Sign up with Facebook
  Future<bool> signUpWithFacebook() async {
    try {
      _user = await _authService.signUpWithFacebook();
      notifyListeners();
      return _user != null;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  // Logout method
  Future<void> logout() async {
    try {
      await _authService.logout();
      _user = null;
      notifyListeners();
    } catch (e) {
      print("Error during logout: $e");
    }
  }
}
