import 'package:flutter/foundation.dart';

/// Simple authentication service for demonstration purposes
/// In a real app, this would integrate with a backend API
class AuthService extends ChangeNotifier {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  bool _isAuthenticated = false;
  String? _username;

  bool get isAuthenticated => _isAuthenticated;
  String? get username => _username;

  /// Simple login method - accepts any non-empty username/password
  /// In a real app, this would validate against a backend
  Future<bool> login(String username, String password) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    // Simple validation: just check if fields are not empty
    if (username.isNotEmpty && password.isNotEmpty) {
      _username = username;
      _isAuthenticated = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  /// Logout method
  Future<void> logout() async {
    _username = null;
    _isAuthenticated = false;
    notifyListeners();
  }
}
