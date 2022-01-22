import 'package:sam_uii/models/image_model.dart';

import '../models/category_model.dart';

class NewsModel {
  int id;
  String title;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  ImageModel image;
  CategoryModel category;

  NewsModel({
    this.id,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.image,
    // this.category,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    try {
      image = ImageModel.fromJson(json['image']);
    } catch (e) {
      image = null;
      print(e);
    }
    // category = CategoryModel.fromJson(json['category']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
      'image': image.toJson(),
      // 'category': category.toJson(),
    };
  }
}
