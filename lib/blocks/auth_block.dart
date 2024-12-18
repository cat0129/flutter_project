import 'package:flutter/material.dart';
import 'package:flutter_sample/models/user.dart';
import 'package:flutter_sample/services/auth_service.dart';

class AuthBlock extends ChangeNotifier {
  AuthBlock() {
    setUser();
  }
  AuthService _authService = AuthService();
  // Index
  int _currentIndex = 1;
  int get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  // Loading
  bool _loading = false;
  late String _loadingType;
  bool get loading => _loading;
  String get loadingType => _loadingType;
  set loading(bool loadingState) {
    _loading = loadingState;
    notifyListeners();
  }
  set loadingType(String loadingType) {
    _loadingType = loadingType;
    notifyListeners();
  }
  // Loading
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool isUserExist) {
    _isLoggedIn = isUserExist;
    notifyListeners();
  }

  Map _user = {'user_email' : 'test@test.com', 'user_display_name' : '홍길동'};
  Map get user => _user;
  setUser() async {
    isLoggedIn = _user.isNotEmpty ;
    notifyListeners();
  }

  login(UserCredential userCredential) async {
    loading = true;
    loadingType = 'login';
    await _authService.login(userCredential);
    setUser();
    loading = false;
  }

  register(User user) async {
    loading = true;
    loadingType = 'register';
    await _authService.register(user);
    loading = false;
  }

  logout() async {
    await _authService.logout();
    isLoggedIn = false;
    notifyListeners();
  }
}
