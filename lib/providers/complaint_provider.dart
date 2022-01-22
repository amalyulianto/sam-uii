import 'package:flutter/material.dart';
import 'package:sam_uii/models/complaint_model.dart';
import 'package:sam_uii/services/complaint_service.dart';

class ComplaintProvider with ChangeNotifier {
  List<ComplaintModel> _complaints = [];
  List<ComplaintModel> get complaints => _complaints;

  set complaints(List<ComplaintModel> complaints) {
    _complaints = complaints;
    notifyListeners();
  }

  Future<void> getComplaints(String token, String id) async {
    try {
      List<ComplaintModel> complaints =
          await ComplaintService().getComplaintsByCategory(token, id);
      _complaints = complaints;
      // print(_allNews);
    } catch (e) {
      print(e);
    }
  }
}
