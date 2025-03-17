import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quarn_app/manager/khotab/khotab_cubit.dart';
import 'package:quarn_app/manager/khotab/khotab_state.dart';
import 'package:quarn_app/screens/pdf_view_screen.dart';

class KhotabWidget extends StatelessWidget {
  const KhotabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KhotabCubit,KhotabState>(builder: (BuildContext context, state) {
      if (state is LoadedKhotabState) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 16),
                child: Container(
                  width: double.infinity,
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
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.khotabs[index].name,
                            style: GoogleFonts.elMessiri(fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFA85000)),),
                          const SizedBox(height: 8,),
                          Text(state.khotabs[index].description, style: GoogleFonts.elMessiri(
                              fontSize: 16, color: Colors.grey.shade600),),
                          const SizedBox(height: 12,),
                          ElevatedButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                              return PdfViewScreen(url: state.khotabs[index].pdf, title: 'الخطبه',);
                            })
                            );
                          },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFA85000),
                                elevation: 0,
                                minimumSize: const Size(120, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                )
                            ), child: Text(
                            'قراءة الخطبه', style: GoogleFonts.elMessiri(
                              color: Colors.white, fontSize: 16),
                          ),
                          ),
                        ]
                    ),
                  ),
                ),
              );
            },
            itemCount: 10,
          ),
        );
      }
      else if(state is ErrorKhotabState)
        {
          return Center(child: Text(' Error is ${state.message}'),);
        }
      else
        {
          return const Center(child: CircularProgressIndicator(),);
        }
    }
    );
  }
}
