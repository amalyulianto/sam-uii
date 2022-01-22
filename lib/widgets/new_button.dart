import 'package:flutter/material.dart';

import '../theme.dart';

class NewButton extends StatelessWidget {
  const NewButton(
      {Key key,
      this.onPressed,
      this.text,
      this.color = kColorYellow,
      this.textColor = Colors.black})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Text(
          text,
          style: textBold.copyWith(color: textColor),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
