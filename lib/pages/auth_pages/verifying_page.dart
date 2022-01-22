import 'package:flutter/material.dart';
import '../../pages/auth_pages/sign_in_page.dart';
import '../../utils/session.dart';

import '../../theme.dart';

class VerifyingPage extends StatelessWidget {
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
                clearSession();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ),
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
                  'Akun kamu sedang diverifikasi!',
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
                  'Harap menunggu 1x24 jam.',
                  textAlign: TextAlign.center,
                  style: textMain.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
