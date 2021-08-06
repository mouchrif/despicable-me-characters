import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final LinearGradient kKevinGradientColors = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Colors.orange.shade200,
    Colors.deepOrange.shade400,
  ],
);
final LinearGradient kAnesGradientColors = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    Colors.pink.shade200,
    Colors.redAccent.shade400,
  ],
);

const Color kWhiteColor = Colors.white;
const Color kBlackColor = Colors.black;


Widget buildText(String text, Color color, double size, FontWeight weight, double charSp) {
  return Text(
    text,
    style: GoogleFonts.montserrat(
      color: color,
      fontSize: size,
      fontWeight: weight,
      letterSpacing: charSp,
    ),
  );
}