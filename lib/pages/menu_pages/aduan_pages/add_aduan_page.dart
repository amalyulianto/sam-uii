import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sam_uii/widgets/loading_button.dart';
import '../../../models/user_model.dart';
import '../../../providers/auth_provider.dart';
import '../../../services/complaint_service.dart';

import '../../../theme.dart';

class AddAduanPage extends StatefulWidget {
  final int index;

  const AddAduanPage({Key key, this.index}) : super(key: key);
  @override
  _AddAduanPageState createState() => _AddAduanPageState();
}

class _AddAduanPageState extends State<AddAduanPage> {
  final formKey = GlobalKey<FormState>();

  int selectedIndexKategori;
  bool isLoading = false;

  final List<DropdownMenuItem> _kategoriUmum = [
    DropdownMenuItem(value: "3", child: Container(child: Text("SPP"))),
    DropdownMenuItem(value: "4", child: Container(child: Text("Key-in"))),
    DropdownMenuItem(value: "5", child: Container(child: Text("KKN"))),
  ];

  final List<DropdownMenuItem> _kateogriKhusus = [
    DropdownMenuItem(value: "6", child: Container(child: Text("Bullying"))),
    DropdownMenuItem(
        value: "8", child: Container(child: Text("Kekerasan Fisik"))),
    DropdownMenuItem(
        value: "9", child: Container(child: Text("Kekerasan Seksual"))),
    DropdownMenuItem(
        value: "10", child: Container(child: Text("Ujaran Kebencian/SARA"))),
  ];
  String _selectedKategori;
  String _judulAduan;
  String _isiAduan;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorYellow,

          iconTheme: IconThemeData(color: Colors.black),
          // centerTitle: true,
          title: Text(
            widget.index == 0 ? 'Aduan Umum' : 'Aduan Khusus',
            style: textMain.copyWith(color: Colors.black),
          ),
        ),
        backgroundColor: kColorGradient1,
        body: ListView(children: [
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: DropdownButtonFormField(
                        hint: Text(
                          'Kategori Aduan',
                          style: textMain.copyWith(color: Colors.black),
                        ), // Not necessary for Option 1

                        value: _selectedKategori,
                        validator: (value) {
                          if (value == null) {
                            return 'Pilih kategori!';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (newValue) {
                          setState(() {
                            _selectedKategori = newValue;
                            print(_selectedKategori);
                          });
                        },
                        style: textMain.copyWith(color: Colors.black),
                        items: widget.index == 0
                            ? _kategoriUmum
                            : _kateogriKhusus),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: customInput('Judul Aduan'),
                    style: textMain.copyWith(color: Colors.black),
                    onChanged: (value) {
                      setState(() {
                        _judulAduan = value;
                        // print(_judulAduan);
                      });
                    },
                    validator: (value) {
                      if (value.length < 1) {
                        return 'Judul terlalu pendek!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: customInput('Isi Aduan'),
                    style: textMain.copyWith(color: Colors.black),
                    maxLength: 500,
                    minLines: 20,
                    maxLines: 30,
                    onSaved: (value) {
                      setState(() {
                        _isiAduan = value;
                      });
                    },
                    validator: (value) {
                      if (value.length < 3) {
                        return 'Isi aduan terlalu pendek!';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  isLoading
                      ? LoadingButton()
                      : ElevatedButton(
                          onPressed: () async {
                            final isValid = formKey.currentState.validate();
                            FocusScope.of(context).unfocus();
                            if (isValid) {
                              formKey.currentState.save();
                              setState(() {
                                isLoading = true;
                              });
                              print('token: ${user.authToken}');
                              print('kategori id: $_selectedKategori');
                              print('judul: $_judulAduan');
                              print('isi: $_isiAduan');

                              if (await ComplaintService().submitComplaint(
                                  user.authToken,
                                  content: _isiAduan,
                                  id: _selectedKategori,
                                  judul: _judulAduan)) {
                                Fluttertoast.showToast(
                                    msg: "Aduan berhasil dikirimkan!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: kColorGreen,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.pop(context);
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                Fluttertoast.showToast(
                                    msg: "Aduan gagal dikirim!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: kColorRed,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: Text(
                              'Kirim',
                              textAlign: TextAlign.center,
                              style: textBold.copyWith(color: Colors.black),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: kColorYellow,
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 24,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  InputDecoration customInput(String title) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      // labelText: title,
      hintText: title,
      labelStyle: textMain.copyWith(color: Colors.black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      filled: true,
      counterText: '',
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      alignLabelWithHint: true,
      fillColor: Colors.white,
      focusColor: Color(0xffE1E1E1),
    );
  }
}
