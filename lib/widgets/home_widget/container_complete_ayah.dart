import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerCompleteAyah extends StatelessWidget {
  const ContainerCompleteAyah({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 342,
      height: 156,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
            image: AssetImage('assets/images/Frame 42.png'),
            opacity: 0.3,
            fit: BoxFit.cover),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'متابعة القرآن من حيث توقفت',
                    style: GoogleFonts.elMessiri(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.elMessiri(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      children: const [
                        TextSpan(text: 'توقفت عند سورة '),
                        TextSpan(
                          text: 'النساء ',
                          style: TextStyle(
                            color: Color(0XFFA85000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.elMessiri(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      children:  [
                        const TextSpan(text: 'صفحة '),
                        TextSpan(
                          text: '79 ',
                          style: GoogleFonts.elMessiri(
                            color: const Color(0XFFA85000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFFA85000)),
                      child:  Text(
                        'متابعة الحفظ',
                        style: GoogleFonts.elMessiri(color: Colors.white),
                      )),
                ]),
          ),
          const Image(image: AssetImage('assets/icons/arcticons_al-quran-indonesia.png'))
        ],
      ),
    );
  }
}
