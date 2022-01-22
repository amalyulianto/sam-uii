import 'package:flutter/material.dart';
import '../theme.dart';

class DaftarAduanIcon extends StatelessWidget {
  const DaftarAduanIcon({Key key, this.text, this.onTap}) : super(key: key);

  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Image.asset(
              'assets/icon_link.png',
              width: 60,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              text,
              style: textMain.copyWith(color: kColorOrange),
            ),
          ],
        ),
      ),
    );
  }
}
