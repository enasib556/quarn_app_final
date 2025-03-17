import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLoginContainer extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final Color textColor;
  const CustomLoginContainer({super.key, required this.title, required this.fontSize, required this.color, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 154,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:  color,
      ),
      child: Center(
        child: Text(title,
            style: GoogleFonts.elMessiri(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: textColor,
            )
        ),
      ),
    );
  }
}
