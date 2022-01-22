import '../models/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsService {
  String baseUrl = 'https://api.studentadvocacyuii.org/category';

  Future<List<NewsModel>> getInfoLem(String token) async {
    var url = Uri.parse('$baseUrl/1/news');
    var headers = {'Authorization': token};

    var response = await http.get(url, headers: headers);

    // print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['news'];
      // print(data);
      List<NewsModel> news = [];

      for (var item in data) {
        news.add(NewsModel.fromJson(item));
        // print(news);
      }
      print(news);
      return news;
    } else {
      throw Exception('Failed to get all news');
    }
  }

  Future<List<NewsModel>> getPapanInformasi(String token) async {
    var url = Uri.parse('$baseUrl/2/news');
    var headers = {'Authorization': token};

    var response = await http.get(url, headers: headers);

    // print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['news'];
      print(data);
      List<NewsModel> news = [];

      for (var item in data) {
        news.add(NewsModel.fromJson(item));
        // print(news);
      }
      // print(news);
      return news;
    } else {
      throw Exception('Failed to get all news');
    }
  }
}
