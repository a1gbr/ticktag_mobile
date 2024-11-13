import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> checkLoginStatus() async {
    _isAuthenticated = await _authService.checkLoginStatus();
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    try {
      _isAuthenticated = await _authService.login(email, password);
      notifyListeners();
    } catch (e) {
      throw Exception('Erro na autenticação');
    }
  }

  Future<void> register(String email, String password, String birthDate) async {
    try {
      _isAuthenticated = await _authService.register(email, password, birthDate);
      notifyListeners();
    } catch (e) {
      throw Exception('Erro na autenticação');
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    _isAuthenticated = false;
    notifyListeners();
  }
}
