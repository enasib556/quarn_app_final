import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'arc_painter.dart';

class ImagePrayerTimes extends StatelessWidget {
  const ImagePrayerTimes({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
            height: 280,
            color: Colors.black,
            child: const Image(
              image: AssetImage("assets/images/Frame 3.png"),
              fit: BoxFit.fill,
              opacity: AlwaysStoppedAnimation(.8),
            )),
        const Positioned(
          top: 60,
          right: 24,
          child: Image(
              image: AssetImage(
                  "assets/icons/material-symbols_notifications-active.png")),
        ),
        const SizedBox(height: 50), // تباعد من الأعلى
        Positioned(
          top: 140,
          left: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الثلاثاء، 13 مارس',
                style: GoogleFonts.elMessiri(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '3 رمضان | 1445 هجري',
                style: GoogleFonts.elMessiri(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Positioned(
          top: 167,
          right: 80,
          child: CustomPaint(
            size: const Size(50, 50),
            painter: ArcPainter(),
          ),
        ),
        // عنصر القوس وزمن الصلاة
        Positioned(
          top: 145,
          right: 75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'الفجر',
                style: GoogleFonts.elMessiri(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0XFFA85000),
                ),
              ),
              Text(
                '04:39 ص',
                style: GoogleFonts.elMessiri(
                  fontSize: 16,
                  color: const Color(0XFF522700),
                ),
              ),
              Text(
                '04:11:42-',
                style: GoogleFonts.elMessiri(
                  fontSize: 14,
                  color: const Color(0XFFA85000),
                ),
                // عنصر القوس وزمن الصل
              )
            ],
          ),
        ),
        Positioned(
            bottom: 20,
            right: 24,
            child: Text('اسماعيليه , المستقبل', style: GoogleFonts.elMessiri(fontSize: 16, color: Colors.white))),
        // Progress Timeline
      ],
    );
  }
}
