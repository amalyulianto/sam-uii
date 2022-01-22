import 'package:flutter/material.dart';
import '../theme.dart';

class ButtonGrid extends StatelessWidget {
  const ButtonGrid({Key key, this.onTap, this.text}) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),

        // height: 80,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Image.asset(
              'assets/carbon_report.png',
              width: 45,
            ),
            Text(
              text,
              style: textMain.copyWith(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
