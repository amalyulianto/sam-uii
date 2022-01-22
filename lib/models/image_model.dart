class ImageModel {
  int id;
  String name;
  String url;

  ImageModel({this.id, this.name, this.url});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'url': url,
    };
  }
}
