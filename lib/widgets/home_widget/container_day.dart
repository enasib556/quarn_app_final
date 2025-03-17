import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerDay extends StatelessWidget {
  final String title;
  final String ayah;
  const ContainerDay({super.key, required this.title, required this.ayah});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 342,
      height: 197,
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 6,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ]
      ),
      child:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:   CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/۞.svg'),
                const SizedBox(width: 5,),
                Text(title,style: GoogleFonts.elMessiri(fontSize: 20,fontWeight: FontWeight.bold,color: const Color(0xFFA85000)),),
                const SizedBox(width: 120,),
                SvgPicture.asset('assets/icons/ooui_share.svg'),
                const SizedBox(width: 10,),
                SvgPicture.asset('assets/icons/tabler_bookmark-filled.svg')
              ],
            ),
          ),
          const Divider(
            thickness: 0.2,
            color: Color(0xFFA85000),
          ),
          const SizedBox(height: 23,),
          SizedBox(
              width: 315,
              child: Text(ayah,style: GoogleFonts.elMessiri(fontSize: 16,),textAlign: TextAlign.center,))
        ],
      ),
    );
  }
}
