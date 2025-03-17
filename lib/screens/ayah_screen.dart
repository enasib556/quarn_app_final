import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../manager/Aya/AyataCubit.dart';
import '../manager/Aya/AyataState.dart';

class AyahsScreen extends StatefulWidget {
  const AyahsScreen({super.key, required this.numberOfSurah, required this.nameAyah});
  final int numberOfSurah;
  final String nameAyah ;

  @override
  State<AyahsScreen> createState() => _AyahsScreenState();
}

class _AyahsScreenState extends State<AyahsScreen> {
  AudioPlayer player = AudioPlayer();
  bool isSelected = false;
  String selectedAyah = '';
  Future<void> _playAyahAudio(String ayahNumber) async {
    try {
      await player.play(UrlSource(ayahNumber));
    } catch (e) {
      print(" Error playing audio is $e");
    }
  }
  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }
  @override
  Widget build(BuildContext context) {
    context.read<AyataCubit>().getAyah(number: widget.numberOfSurah);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ))
          ],
          automaticallyImplyLeading: false,
          title:  Center(
            child: Text(
              widget.nameAyah,
              style: GoogleFonts.elMessiri(color: Colors.white),
            ),
          ),
          backgroundColor: Color(0xFF522700),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<AyataCubit, AyataState>(
            builder: (BuildContext context, state) {
              if (state is LoadedState) {
                return Column(
                  children: [
                    const SizedBox(height: 16,),
                    Text('بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ', style: GoogleFonts.elMessiri(color: Color(0xFF522700), fontSize: 20, fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: InkWell(
                          onTap: (){
                            setState(() {
                              isSelected = !isSelected;
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.shade100,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.brown, width: 1.5),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 3),
                                  )
                                ],
                              ),
                            child: Text.rich(
                              TextSpan(
                                children: state.ayahs.map((ayah) {

                                  bool isSelected = selectedAyah == ayah.text;

                                  return TextSpan(
                                    text:
                                    // ayah.text,
                                    " ${(widget.numberOfSurah == 1) ? ayah.text : ayah.text.replaceAll("بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ", "").trim()} ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: isSelected ? Colors.blue : Colors.black87,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        setState(() {
                                          selectedAyah = ayah.text;
                                        });
                                        _playAyahAudio(ayah.audioUrl);
                                      },
                                    children: [
                                      TextSpan(
                                        text: " (${ayah.numberInSurah}) ",
                                        style: GoogleFonts.elMessiri(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: isSelected
                                              ? Colors.blue
                                              : Colors.black,
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                            ),
                          )
                      ),
                    ),
                  ],
                );
              } else if (state is ErrorState) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}