import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quarn_app/models/lesson.dart';
import 'package:quarn_app/screens/video_lesson_screen.dart';

class CustomLessonContainer extends StatefulWidget {
  final Lesson lesson;
  const CustomLessonContainer({super.key, required this.lesson});

  @override
  _CustomLessonContainerState createState() => _CustomLessonContainerState();
}

class _CustomLessonContainerState extends State<CustomLessonContainer> {
  String?
      selectedLesson;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 6,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.lesson.title,
              style: GoogleFonts.elMessiri(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFA85000),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.lesson.description ?? 'لا يوجد وصف',
              style: GoogleFonts.elMessiri(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'اختر الدرس',
                  style: GoogleFonts.elMessiri(
                    color: const Color(0xFFA85000),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: DropdownButton<String>(
                    value: selectedLesson,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLesson = newValue;
                      });
                    },
                    underline: const SizedBox(),
                    iconEnabledColor: const Color(0xFFA85000),
                    items: widget.lesson.video
                        .map<DropdownMenuItem<String>>((video) {
                      return DropdownMenuItem<String>(
                        value: video['description'],
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        VideoLessonScreen(videoUrl: video['url'],title: video['description'],)));
                          },
                          child: Text(
                            'الدرس ${widget.lesson.video.indexOf(video)+1}',
                            overflow: TextOverflow.ellipsis,
                            textScaler: const TextScaler.linear(0.9),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
