import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sam_uii/models/jwt_model.dart';
import 'package:sam_uii/providers/auth_provider.dart';
import 'package:sam_uii/providers/google_sign_in_provider.dart';
import '../pages/auth_pages/sign_in_page.dart';
import '../utils/session.dart';
import '../widgets/new_button.dart';

import '../theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProivder = Provider.of<AuthProvider>(context);
    JWTModel user = authProivder.jwtModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorYellow,

          iconTheme: IconThemeData(color: Colors.black),
          // centerTitle: true,
          title: Text(
            'Profil',
            style: textMain.copyWith(color: Colors.black),
          ),
        ),
        backgroundColor: kColorGradient1,
        body: ListView(
          children: [
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    user.name,
                    textAlign: TextAlign.center,
                    style: textSubtitle.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    user.email,
                    style: textMain.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tentang SAM UII',
                    style: textMain.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Butuh Bantuan?',
                    style: textSubtitle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Kasih tahu kami ya kalau kamu nemu masalah di aplikasi ini!',
                    style: textMain.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'LAPORKAN MASALAH',
                    style: textMain.copyWith(
                        color: kColorRed, decoration: TextDecoration.underline),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Umpan Balik',
                    style: textSubtitle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Kami ingin dengar tanggapan kamu tentang SAM UII!',
                    style: textMain.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'HUBUNGI KAMI',
                    style: textMain.copyWith(
                        color: kColorRed, decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: NewButton(
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
                text: 'Sign Out',
                color: kColorRed,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
