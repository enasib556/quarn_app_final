import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quarn_app/manager/Lesson/lesson_cubit.dart';
import 'package:quarn_app/manager/Lesson/lesson_state.dart';
import 'package:quarn_app/widgets/din_lesson_widget/custom_lesson_container.dart';

import '../widgets/login_signup/custom_login_container.dart';
import 'audio_lesson_screen.dart';

class DinLessonScreen extends StatelessWidget {
  const DinLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'دروس الدين',
            style: GoogleFonts.elMessiri(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF522700),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<LessonCubit,LessonState>(
          builder: (context, state) {
            if (state is LoadedLessonState) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 358,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0XffEDEEEF),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CustomLoginContainer(
                              title: 'مشاهده',
                              fontSize: 16,
                              color: Colors.white,
                              textColor: Color(0XFFA85000),
                            ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>   AudioLessonScreen(),),
                              );
                            },
                            child:const CustomLoginContainer(
                                title: 'استماع',
                                fontSize: 16,
                                color: Colors.transparent,
                                textColor: Colors.black),
                          )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Expanded(
                        child: ListView.builder(itemBuilder: (context, index) =>
                         Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: CustomLessonContainer(
                            lesson: state.lessons[index],
                          ),
                        ), itemCount: state.lessons.length,)),
                  ],
                ),
              );
            }
            else if(state is ErrorLessonState)
            {
            return const Center(child: Text('Error'),);
            }
            else
            {
            return const Center(child: CircularProgressIndicator(),);
            }
          }
        )
      ),
    );
  }
}
