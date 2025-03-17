import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCatgoryContainer extends StatelessWidget {
  final String image;
  final String name;
  final Function() onTap;
  const CustomCatgoryContainer({super.key, required this.image, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF522700),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset(image),
              )
          ),
        ),
        const SizedBox(height: 4,),
        Text(name,style: GoogleFonts.elMessiri(fontSize: 20,fontWeight: FontWeight.bold,color: const Color(0xFFA85000)),),
      ],
    );
  }
}
