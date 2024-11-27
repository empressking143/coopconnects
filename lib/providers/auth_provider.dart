import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel? _user;

  UserModel? get user => _user;

  bool get isAuthenticated => _user != null;

  Future<void> loginWithEmailPassword(String email, String password) async {
    final user = await _authService.signInWithEmailPassword(email, password);
    if (user != null) {
      _user = UserModel(uid: user.uid, email: user.email!, displayName: user.displayName ?? '');
      notifyListeners();
    }
  }

  Future<void> signupWithEmailPassword(String email, String password) async {
    final user = await _authService.signUpWithEmailPassword(email, password);
    if (user != null) {
      _user = UserModel(uid: user.uid, email: user.email!, displayName: user.displayName ?? '');
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }
}
