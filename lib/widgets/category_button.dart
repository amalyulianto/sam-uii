import 'package:flutter/material.dart';
import '../theme.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {Key key, this.text, this.onTap, this.color = Colors.white})
      : super(key: key);

  final String text;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black54),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Text(
          text,
          style: textMain.copyWith(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
