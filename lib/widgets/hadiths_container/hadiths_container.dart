import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/hadiths.dart';

class HadithsContainer extends StatelessWidget {
  final Hadiths hadiths;
  final int index;
  const HadithsContainer({super.key, required this.hadiths, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, left: 14, right: 14, top: 10),
      child: Container(
        // height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 6,
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             Text(
                  'الحديث ${index+1}',
                  style: GoogleFonts.elMessiri(
                    color: const Color(0xFFA85000),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
              ),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,),
          const SizedBox(height: 16,),
          Text(
            hadiths.content,
            style: GoogleFonts.elMessiri(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          ]
          ),
        ),
      ),
    );
  }
}
