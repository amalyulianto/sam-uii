class JWTModel {
  // String? idToken;

  int id;
  String email;
  String name;
  int status;
  dynamic verification;

  JWTModel({this.id, this.email, this.name, this.status});

  JWTModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    status = json['status'];
    verification = json['verification'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'status': status,
      'verification': verification,
    };
  }
}
