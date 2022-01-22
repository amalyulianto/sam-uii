import 'package:flutter/material.dart';

import '../theme.dart';

class DaftarAduanButton extends StatelessWidget {
  const DaftarAduanButton(
      {Key key, this.text, this.onTap, this.color = Colors.white})
      : super(key: key);

  final String text;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 60,
        height: 75,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: textMain.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
