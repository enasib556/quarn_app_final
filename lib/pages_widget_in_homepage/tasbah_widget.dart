import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TasbahWidget extends StatefulWidget {
  const TasbahWidget({super.key});

  @override
  State<TasbahWidget> createState() => _TasbahWidgetState();
}

class _TasbahWidgetState extends State<TasbahWidget> {
  int counter = 0;
  int index = 0; // لتحديد التسبيح الحالي
  final List<String> tasbeh = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
  ];

  void _incrementCounter() {
    setState(() {
      counter++;
      if (counter == 30) {
        counter = 0;
        index = (index + 1) % tasbeh.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tasbeh[index],
            style: GoogleFonts.elMessiri(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 30),
          Text(
            'عدد التسبيحات ',
            style: GoogleFonts.elMessiri(fontSize: 15, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            '$counter',
            style:
            GoogleFonts.elMessiri(fontSize: 60, color: Color(0xFFA85000)),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFA85000),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              onPressed: _incrementCounter,
              icon: const Icon(
                Icons.fingerprint,
                size: 50,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
