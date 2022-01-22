import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kColorGradient1 = Color(0xff06337B);
const Color kColorGradient2 = Color(0xff0F2D79);

LinearGradient gradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    kColorGradient1,
    kColorGradient2,
  ],
);

const kColorYellow = Color(0xffFFCB2D);
const kColorGreen = Color(0xff74E26A);
const kColorOrange = Color(0xffFFAC3E);
const kColorRed = Color(0xffFF4C4C);

TextStyle textBold = GoogleFonts.inter(color: Colors.white, fontWeight: bold);
TextStyle textMain = GoogleFonts.inter(fontWeight: regular);
TextStyle textTitle = GoogleFonts.inter(fontWeight: bold, fontSize: 28);
TextStyle textSubtitle = GoogleFonts.inter(fontWeight: semiBold, fontSize: 18);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
