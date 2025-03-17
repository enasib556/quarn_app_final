import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  const CustomButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 358,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        gradient: const LinearGradient(
          colors: [
            Color(0XffA36833),
            Color(0Xff795433),
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(33),
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.elMessiri(
                fontSize: 18,
                color: Colors.white, // النص أبيض
              ),
            ),
          ),
        ),
      ),
    );
  }
}
