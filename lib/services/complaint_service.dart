import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sam_uii/models/complaint_model.dart';

class ComplaintService {
  String baseUrl = 'https://api.studentadvocacyuii.org';
  Future<bool> submitComplaint(String token,
      {String id, String content, String judul}) async {
    var url = Uri.parse('$baseUrl/complaints');
    print(token);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        'visibility': 0,
        'anonimity': 0,
        'category_id': int.parse(id),
        'title': judul,
        'content': content,
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      print('yeey Aduan berhasil dikirimkan');
      return true;
    } else {
      print(response.statusCode);
      print(response.body);
      return false;
    }
  }

  Future<List<ComplaintModel>> getComplaintsByCategory(
      String token, String id) async {
    var url = Uri.parse('$baseUrl/complaints/category/$id');
    var headers = {'Authorization': token};

    var response = await http.get(url, headers: headers);

    // print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      // print(data);
      List<ComplaintModel> news = [];

      for (var item in data) {
        news.add(ComplaintModel.fromJson(item));
        // print(news);
      }
      print(news);
      return news;
    } else {
      throw Exception('Failed to get all news');
    }
  }
}
