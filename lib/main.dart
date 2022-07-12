import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sam_uii/pages/auth_pages/sign_in_page.dart';
import 'package:sam_uii/providers/complaint_provider.dart';
import 'package:sam_uii/providers/response_provider.dart';

import 'pages/splash_screen.dart';
import 'providers/auth_provider.dart';
import 'providers/google_sign_in_provider.dart';
import 'providers/news_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ComplaintProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ResponseProvider(),
        )
      ],
      child: MaterialApp(
        home: SignInPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
