import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sam_uii/models/response_model.dart';

class ResponseService {
  String baseUrl = 'https://api.studentadvocacyuii.org';

  Future<List<ResponseModel>> getAllResponses(String token) async {
    var url = Uri.parse('$baseUrl/type/4/news');
    print(token);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.get(
      url,
      headers: headers,
    );
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      // print(data);
      List<ResponseModel> responses = [];

      for (var item in data) {
        responses.add(ResponseModel.fromJson(item));
        // print(news);
      }
      print(responses);
      return responses;
    } else {
      throw Exception('Failed to get all news');
    }
  }
}
