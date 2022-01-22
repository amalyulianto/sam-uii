import 'package:flutter/material.dart';

import '../theme.dart';

class NoInternetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: kColorGradient1,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Image.asset(
                    'assets/404_illustration.png',
                    width: 280,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Perangkat kamu tidak tersambung internet!',
                    textAlign: TextAlign.center,
                    style: textSubtitle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Tutup aplikasi dan sambungkan perangkat kamu ke Internet!',
                    textAlign: TextAlign.center,
                    style: textMain.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
