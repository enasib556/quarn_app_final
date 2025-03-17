import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quarn_app/manager/Lesson/audio_state.dart';
import 'package:quarn_app/manager/Lesson/lesson_cubit.dart';
import 'package:quarn_app/manager/Lesson/lesson_state.dart';
import 'package:quarn_app/screens/static_navigation_bar_app_bar_screen.dart';
import 'package:quarn_app/widgets/din_lesson_widget/audio_container.dart';
import '../manager/Lesson/audio_cubit.dart';
import '../widgets/login_signup/custom_login_container.dart';
import 'din_lesson_screen.dart';

class AudioLessonScreen extends StatelessWidget {

  AudioLessonScreen({super.key});

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  StaticNavigationBarAppBarScreen(),
                        )
                      );
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
          body:
              BlocBuilder<AudioCubit, AudioState>(builder: (context, state) {
            if (state is LoadedAudioState)
            {
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
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DinLessonScreen()));
                              },
                              child: const CustomLoginContainer(
                                  title: 'مشاهده',
                                  fontSize: 16,
                                  color: Colors.transparent,
                                  textColor: Colors.black),
                            ),
                            const CustomLoginContainer(
                              title: 'استماع',
                              fontSize: 16,
                              color: Colors.white,
                              textColor: Color(0XFFA85000),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: AudioContainer(audio: state.audios[index],),
                      ),
                      itemCount: state.audios.length,
                    ))
                  ],
                ),
              );
            } else if (state is ErrorAudioState) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          })),
    );
  }
}
