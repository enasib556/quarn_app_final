import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 270,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: CustomProfileClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    color: const Color(0xFFFFD08A).withOpacity(0.8),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 20,
                child: Row(children: [
                  Text(
                    'الملف الشخصية',
                    style: GoogleFonts.elMessiri(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 25,
                      )),
                ]),
              ),
              Positioned(
                  top: 120,
                  right: 130,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border:
                          Border.all(width: 2, color: const Color(0xFFA85000)),
                    ),
                    child: CircleAvatar(
                      radius: 62,
                      backgroundImage: const Image(
                              image: AssetImage('assets/images/enas.jpeg'))
                          .image,
                    ),
                  ))
            ],
          ),
        ),
        Text('ايناس ابراهيم', style: GoogleFonts.elMessiri(fontSize: 20)),
        const SizedBox(
          height: 40,
        ),
        const CustomRow(
          title: 'تعديل الملف الشخصي',
          image: 'assets/icons/tabler_edit.svg',
          width: 100,
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomRow(
          title: 'عدد النقاط',
          image: 'assets/icons/level 3 discord boost.svg',
          width: 170,
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomRow(
          title: 'المُحفظة',
          image: 'assets/icons/Verified Person.svg',
          width: 180,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90.0, vertical: 4.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF522700)),
                child: Row(
                  children: [
                    Text(
                      'تسجيل الخروج',
                      style: GoogleFonts.elMessiri(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                  ],
                )),
          ),
        )
      ],
    );
  }
}

class CustomProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.4,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CustomRow extends StatelessWidget {
  final String title;
  final String image;
  final double width;
  const CustomRow(
      {super.key,
      required this.title,
      required this.image,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(image),
            Text(
              title,
              style: GoogleFonts.elMessiri(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: width,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFA85000),
              size: 20,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(
            color: Colors.grey.shade300,
            height: 20,
            thickness: 2,
          ),
        )
      ],
    );
  }
}
