import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../services/news_service.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> _infoLem = [];
  List<NewsModel> get infoLem => _infoLem;

  set infoLem(List<NewsModel> infoLem) {
    _infoLem = infoLem;
    notifyListeners();
  }

  List<NewsModel> _papanInformasi = [];
  List<NewsModel> get papanInformasi => _papanInformasi;

  set papanInformasi(List<NewsModel> papanInformasi) {
    _papanInformasi = papanInformasi;
    notifyListeners();
  }

  Future<void> getInfoLem(String token) async {
    try {
      List<NewsModel> allNews = await NewsService().getInfoLem(token);
      _infoLem = allNews;
      // print(_allNews);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getPapanInformasi(String token) async {
    try {
      List<NewsModel> allNews = await NewsService().getPapanInformasi(token);
      _papanInformasi = allNews;
      // print(_allNews);
    } catch (e) {
      print(e);
    }
  }
}
