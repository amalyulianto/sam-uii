import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sam_uii/widgets/loading_button.dart';
import '../../pages/auth_pages/not_verified_page.dart';
import '../../pages/auth_pages/verifying_page.dart';
import '../../pages/home_page.dart';
import '../../providers/auth_provider.dart';
import '../../providers/google_sign_in_provider.dart';
import '../../theme.dart';
import '../../utils/session.dart';
import '../../widgets/new_button.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      setState(() {
        isLoading = true;
      });
      final provider =
          Provider.of<GoogleSignInProvider>(context, listen: false);

      if (provider.user != null) {
        await provider.logout();
      }
      setState(() {
        isLoading = true;
      });

      await provider.googleLogin();
      setState(() {
        isLoading = false;
      });

      final tokenResult = FirebaseAuth.instance.currentUser;
      final idToken = await tokenResult.getIdToken();
      setState(() {
        isLoading = true;
      });

      print(idToken);
      if (await authProvider.register(idToken)) {
        if (await authProvider.jwtValidation(authProvider.user.authToken)) {
          createUserSession(authProvider.user, authProvider.jwtModel);
          print(authProvider.jwtModel.status);
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
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Gagal login!'),
          backgroundColor: kColorRed,
        ));
        setState(() {
          isLoading = false;
        });
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: kColorGradient1,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/logo_lem.png',
                width: 80,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Student Advocation\nMobile UII',
              style: textSubtitle.copyWith(fontSize: 22, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            isLoading
                ? LoadingButton()
                : NewButton(
                    text: 'Sign In',
                    onPressed: () {
                      handleSignIn();
                    },
                  ),
            SizedBox(
              height: 50,
            ),
            // Image.asset(
            //   'assets/logo_uii.png',
            //   width: 30,
            // ),
          ],
        ),
      ),
    );
  }
}

Future googleSignIn(BuildContext context) async {
//   final user = await GoogleSignInApi.login();
// //
//   if (user == null) {
  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //   content: Text('Sign In Failed'),
  // ));
//   } else {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => NotVerifiedPage(),
//       ),
//     );
//   }
}
