class ResponseModel {
  String categoryName;
  String title;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  String imageUrl;

  ResponseModel({
    this.categoryName,
    this.content,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
  });

  ResponseModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    title = json['news_title'];
    content = json['news_content'];
    createdAt = DateTime.parse(json['news_created_at']);
    updatedAt = DateTime.parse(json['news_updated_at']);
    try {
      imageUrl = json['image_url'];
    } catch (e) {
      imageUrl = null;
      print(e);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'category_name': categoryName,
      'news_title': title,
      'news_content': content,
      'news_created_at': createdAt.toString(),
      'news_updated_at': updatedAt.toString(),
      'image_url': imageUrl,
    };
  }
}
