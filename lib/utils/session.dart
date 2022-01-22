import 'package:shared_preferences/shared_preferences.dart';
import '../models/jwt_model.dart';
import '../models/user_model.dart';

const IS_LOGIN = 'IS_LOGIN';
const TOKEN = 'TOKEN';
const STATUS = 'STATUS';

Future createUserSession(UserModel user, JWTModel jwt) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(IS_LOGIN, true);
  prefs.setString(TOKEN, user.authToken);
  // prefs.setInt(STATUS, jwt.status);
  print(prefs.getBool(IS_LOGIN));
  return true;
}

Future clearSession() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
  return true;
}
