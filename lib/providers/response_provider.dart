import 'package:flutter/material.dart';
import 'package:sam_uii/models/response_model.dart';
import 'package:sam_uii/services/response_service.dart';

class ResponseProvider with ChangeNotifier {
  List<ResponseModel> _responses = [];
  List<ResponseModel> get responses => _responses;

  set responses(List<ResponseModel> responses) {
    _responses = responses;
    notifyListeners();
  }

  Future<void> getResponses(
    String token,
  ) async {
    try {
      List<ResponseModel> responses =
          await ResponseService().getAllResponses(token);
      _responses = responses;
    } catch (e) {
      print(e);
    }
  }
}
