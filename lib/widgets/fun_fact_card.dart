import 'package:flutter/material.dart';

import '../theme.dart';

class FunFactCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: 300,
        height: 145,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Text(
              'SAM UII',
              style: textMain.copyWith(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'SAM UII adalah aplikasi yang berawal dari inisiasi Lembaga Eksekutif Mahasiswa Universitas Islam Indonesia untuk mengakomodir aspirasi dari mahasiswa di lingkungan Universitas Islam Indonesia.',
              textAlign: TextAlign.center,
              style: textMain,
              maxLines: 4,
            )
          ],
        ),
      ),
    );
  }
}
