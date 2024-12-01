import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  final AuthService _authService = AuthService();

  Future<void> signUpWithEmail(String email, String password) async {
    _user = await _authService.signUpWithEmail(email, password);
    notifyListeners();
  }

  Future<void> signUpWithGoogle() async {
    _user = await _authService.signUpWithGoogle();
    notifyListeners();
  }

  Future<void> signUpWithFacebook() async {
    _user = await _authService.signUpWithFacebook();
    notifyListeners();
  }
}
