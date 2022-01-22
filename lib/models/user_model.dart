class UserModel {
  // String? idToken;
  String authToken;

  UserModel({this.authToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    authToken = json['authToken'];
  }

  Map<String, dynamic> toJson() {
    return {
      'authToken': authToken,
    };
  }
}
