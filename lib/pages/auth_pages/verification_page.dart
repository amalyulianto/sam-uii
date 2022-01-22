import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sam_uii/providers/google_sign_in_provider.dart';
import 'package:sam_uii/widgets/loading_button.dart';
import '../../pages/auth_pages/sign_in_page.dart';
import '../../pages/auth_pages/verifying_page.dart';
import '../../providers/auth_provider.dart';
import '../../utils/session.dart';
import '../../widgets/custom_input_decoration.dart';
import '../../widgets/new_button.dart';

import '../../theme.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  String ktmName = 'Upload KTM';
  File image;

  File imageTemporary;

  bool isLoading = false;

  // imgUpload(String text, File file) async {
  //   //create multipart request for POST or PATCH method
  //   var request = http.MultipartRequest("POST", Uri.parse("<url>"));
  //   //add text fields
  //   request.fields["ktm_image"] = text;
  //   //create multipart using filepath, string or bytes
  //   var pic = await http.MultipartFile.fromPath("file_field", file.path);
  //   //add multipart to request
  //   request.files.add(pic);
  //   var response = await request.send();

  //   //Get the response from the server
  //   var responseData = await response.stream.toBytes();
  //   var responseString = String.fromCharCodes(responseData);
  //   print(responseString);
  // }
  upload(File imageFile, int id, String token) async {
    // open a bytestream
    // var stream =
    //     new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var stream = new http.ByteStream(imageFile.openRead());
    stream.cast();
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri =
        Uri.parse("https://api.studentadvocacyuii.org/users/verification/$id");

    // create multipart request
    var request = http.MultipartRequest("POST", uri);

    print(basename(imageFile.path));
    // multipart that takes file
    var multipartFile = new http.MultipartFile('ktm_image', stream, length,
        filename: basename(imageFile.path),
        contentType: MediaType('image', 'png'));
    var headers = {'Authorization': token};

    request.headers.addAll(headers);

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  // upload(File file, int id, String token) async {
  //   final String endPoint =
  //       'https://lem-api.neroi.space/users/verification/$id';

  //   String fileName = file.path.split('/').last;
  //   print(fileName);

  //   FormData data = FormData.fromMap({
  //     "ktm_image": await MultipartFile.fromFile(
  //       file.path,
  //       filename: fileName,
  //     ),
  //   });

  //   Dio dio = new Dio();

  //   dio.options.headers['Authorization'] = token;

  //   dio
  //       .post(
  //     endPoint,
  //     data: data,
  //   )
  //       .then((response) {
  //     var jsonResponse = jsonDecode(response.toString());
  //   }).catchError((error) => print(error));
  // }

  Future pickImage() async {
    try {
      final image = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['jpeg', 'png']);

      if (image == null) return;

      setState(() {
        ktmName = image.files.first.name;
        imageTemporary = File(image.paths.first);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    // try {
    //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    //   if (image == null) return;

    //   setState(() {
    //     ktmName = image.name;
    //   });

    //   print(image.name);
    //   imageTemporary = File(image.path);
    //   this.image = imageTemporary;
    // } on PlatformException catch (e) {
    //   print('Failed to pick image: $e');
    // }
  }

  Widget buildForm() {
    return Column(
      children: [
        TextFormField(
          maxLength: 50,
          textInputAction: TextInputAction.next,
          decoration: buildInputDecoration(
            'Nama Lengkap',
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          maxLength: 50,
          textInputAction: TextInputAction.next,
          decoration: buildInputDecoration(
            'NIM',
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          maxLength: 50,
          textInputAction: TextInputAction.next,
          decoration: buildInputDecoration(
            'Fakultas',
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          maxLength: 50,
          textInputAction: TextInputAction.next,
          decoration: buildInputDecoration(
            'Jurusan',
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          maxLength: 50,
          textInputAction: TextInputAction.next,
          decoration: buildInputDecoration(
            'Email UII',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorYellow,
          // centerTitle: true,
          title: Text(
            'Verifikasi',
            style: textMain.copyWith(color: Colors.black),
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);

                provider.logout();
                clearSession();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                    (route) => false);
              },
            ),
          ],
        ),
        backgroundColor: kColorGradient1,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Upload KTM UII agar akun kamu bisa diverifikasi!',
                  textAlign: TextAlign.center,
                  style: textSubtitle.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        ktmName,
                        style: textMain.copyWith(color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        pickImage();
                      },
                      child: Icon(
                        Icons.upload,
                        color: Colors.black,
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        primary: kColorYellow,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                isLoading
                    ? LoadingButton()
                    : NewButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await upload(imageTemporary, authProvider.jwtModel.id,
                              authProvider.user.authToken);
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerifyingPage()),
                              (route) => false);
                        },
                        text: 'Selesai')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
