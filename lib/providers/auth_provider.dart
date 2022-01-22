import 'package:flutter/material.dart';
import '../models/jwt_model.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;
  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  JWTModel _jwtModel;
  JWTModel get jwtModel => _jwtModel;
  set jwtModel(JWTModel jwtModel) {
    _jwtModel = jwtModel;
    notifyListeners();
  }

  Future sessionLogin(String token) async {
    try {
      UserModel user = UserModel();
      user.authToken = token;
      _user = user;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> register(String idToken) async {
    try {
      UserModel user = await AuthService().register(idToken);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      print('GAGAL');
      return false;
    }
  }

  Future<bool> login(String idToken) async {
    try {
      UserModel user = await AuthService().login(idToken);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      print('GAGAL LOGIN');
      return false;
    }
  }

  Future<bool> jwtValidation(String token) async {
    try {
      JWTModel jwtModel = await AuthService().jwt(token);
      _jwtModel = jwtModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
