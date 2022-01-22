import 'package:flutter/material.dart';

import '../theme.dart';

InputDecoration buildInputDecoration(String label) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    labelText: label,
    labelStyle: textMain.copyWith(color: Colors.black),
    // hintText: hint,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        50,
      ),
    ),
    filled: true,
    counterText: '',
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        50,
      ),
    ),
    alignLabelWithHint: true,
    fillColor: Color(0xffE1E1E1),
    focusColor: Color(0xffE1E1E1),
  );
}
