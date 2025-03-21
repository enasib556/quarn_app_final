import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quarn_app/models/book.dart';

import '../screens/pdf_view_screen.dart';

class DetailsBookPage extends StatelessWidget {
  final Book? book;
  const DetailsBookPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 50),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFA85000)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 25),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 6,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book!.title,
                        style: GoogleFonts.elMessiri(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFA85000),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        book?.discription??'لا يوجد وصف',
                        style: GoogleFonts.elMessiri(fontSize: 16, color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => PdfViewScreen(url: book!.pdf, title: 'الكتاب ',)));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFA85000),
                          elevation: 0,
                          minimumSize: const Size(120, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          'قراءة الخطبه',
                          style: GoogleFonts.elMessiri(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
