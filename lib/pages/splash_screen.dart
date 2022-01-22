import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sam_uii/pages/no_internet_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/auth_pages/not_verified_page.dart';
import '../pages/auth_pages/sign_in_page.dart';
import '../pages/auth_pages/verifying_page.dart';
import '../pages/home_page.dart';
import '../providers/auth_provider.dart';
import '../theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateUser() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        AuthProvider authProvider =
            Provider.of<AuthProvider>(context, listen: false);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        var sessionLogin = prefs.getBool('IS_LOGIN') ?? false;
        var sessionToken = prefs.getString('TOKEN');
        print(sessionLogin);
        print(sessionToken);
        if (sessionLogin) {
          authProvider.sessionLogin(sessionToken);
          if (await authProvider.jwtValidation(sessionToken)) {
            if (authProvider.jwtModel.status == 0) {
              if (authProvider.jwtModel.verification == null) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => NotVerifiedPage()));
              } else {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => VerifyingPage()));
              }
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            }
          }
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignInPage(),
            ),
          );
        }
      }
    } on SocketException catch (_) {
      print('not connected');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NoInternetPage()));
    }
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, navigateUser);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorGradient1,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child:
                Center(child: Image.asset('assets/logo_lem.png', width: 161)),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SAM UII',
                  style: textSubtitle.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Student Advocation\nMobile UII',
                  style: textTitle.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                CircularProgressIndicator(
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
