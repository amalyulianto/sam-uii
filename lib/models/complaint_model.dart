import 'package:sam_uii/models/category_model.dart';

class ComplaintModel {
  int id;
  String content;
  String title;
  DateTime createdAt;
  DateTime updatedAt;
  CategoryModel category;

  ComplaintModel({
    this.id,
    this.title,
    this.content,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  ComplaintModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    title = json['title'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
      'category': category.toJson(),
    };
  }
}
