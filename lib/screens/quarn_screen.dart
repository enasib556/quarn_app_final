import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quarn_app/screens/ayah_screen.dart';

import '../manager/Suwar/cubit.dart';
import '../manager/Suwar/state.dart';

class QuarnScreen extends StatelessWidget {
  const QuarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:  Text(
            'السور',
            style: GoogleFonts.elMessiri(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF522700),
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
        ),
        body: BlocBuilder<AppCubit, AppState>(
          builder: (BuildContext context, state) {
            if (state is LoadedState) {
              return ListView.builder(
                itemCount: state.suwars.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => AyahsScreen(
                                  numberOfSurah: state.suwars[index].number,
                                  nameAyah: state.suwars[index].name,
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 6,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: const Color(0xFFA85000),
                              child: Text(
                                '${index + 1}',
                                style: GoogleFonts.elMessiri(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.suwars[index].name,
                                  style:  GoogleFonts.elMessiri(
                                      fontSize: 18, color: Color(0xFFA85000)),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  state.suwars[index].englishName,
                                  style:  GoogleFonts.elMessiri(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(width: 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text(
                                  'عدد الايات',
                                  style:
                                      GoogleFonts.elMessiri(fontSize: 17, color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${state.suwars[index].numberOfAyahs}',
                                  style: GoogleFonts.elMessiri(
                                      fontSize: 17, color: Color(0xFFA85000),fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ),
              );
            } else if (state is ErrorState) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
