import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/jwt_model.dart';
import '../models/user_model.dart';

class AuthService {
  String baseUrl = 'https://api.studentadvocacyuii.org';

  Future<UserModel> register(String idToken) async {
    var url = Uri.parse('$baseUrl/auth/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(
      {
        'id_token': idToken,
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201) {
      print(response.body);
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      user.authToken = 'Bearer ' + data['authToken'];
      return user;
    } else {
      print(response.body);
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login(String idToken) async {
    var url = Uri.parse('$baseUrl/auth/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(
      {
        'id_token': idToken,
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      user.authToken = 'Bearer ' + data['access_token'];

      return user;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Gagal Register');
    }
  }

  Future jwt(String token) async {
    var url = Uri.parse('$baseUrl/auth/jwt');
    var headers = {'Authorization': token};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      JWTModel jwtModel = JWTModel.fromJson(data);
      print(jwtModel.id);
      print(jwtModel.status);
      return jwtModel;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Gagal validasi jwt');
    }
  }
}
