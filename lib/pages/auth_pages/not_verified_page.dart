import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sam_uii/providers/google_sign_in_provider.dart';
import 'package:sam_uii/utils/session.dart';
import '../../pages/auth_pages/sign_in_page.dart';
import '../../pages/auth_pages/verification_page.dart';
import '../../theme.dart';
import '../../widgets/new_button.dart';

class NotVerifiedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorYellow,
          // centerTitle: true,
          title: Text(
            'SAM UII',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon_not_verified.png',
                  width: 145,
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  'Data kamu belum terverifikasi, nih!',
                  textAlign: TextAlign.center,
                  style: textSubtitle.copyWith(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Lengkapi dulu data-data yang diperlukan biar bisa pakai SAM UII~',
                  textAlign: TextAlign.center,
                  style: textMain.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                NewButton(
                  text: 'Lengkapi Data',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerificationPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
