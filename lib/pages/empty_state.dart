import 'package:flutter/material.dart';
import 'package:sam_uii/theme.dart';

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/404_illustration.png', width: 200),
            SizedBox(
              height: 20,
            ),
            Text(
              'Belum ada data yang masuk :)',
              style: textSubtitle.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
