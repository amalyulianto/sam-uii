class VerificationService {
  String baseUrl = 'https://api.studentadvocacyuii.org';

//  Future verification(String fileImg, String id) async {
//     var url = Uri.parse('$baseUrl/users/verification/$id');
//     var headers = {'Content-Type': 'application/json'};
//     var body = jsonEncode(
//       {
//         'id_token': idToken,
//       },
//     );

//     var response = await http.post(
//       url,
//       headers: headers,
//       body: body,
//     );

//     if (response.statusCode == 201) {
//       print(response.body);
//       var data = jsonDecode(response.body)['data'];
//       UserModel user = UserModel.fromJson(data);
//       user.authToken = 'Bearer ' + data['authToken'];
//       return user;
//     } else {
//       print(response.body);
//       throw Exception('Gagal Register');
//     }
//   }
}
