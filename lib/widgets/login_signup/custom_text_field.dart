import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller ;
  const CustomTextField({super.key, required this.title, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(title,
              style: GoogleFonts.elMessiri(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              )),
        ),
        const SizedBox(
          height: 12,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0XFFA85000),
              ),
            ),
            hintText: hint,
            hintStyle: GoogleFonts.elMessiri(
              fontSize: 14,
              color: const Color(0XFF777777),
            ),
          ),
        )
      ],
    );
  }
}
