import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../manager/Hadiths/HadithsCubit.dart';
import '../manager/Hadiths/HadithsState.dart';
import '../models/hadiths.dart';
import '../widgets/hadiths_container/hadiths_container.dart';

class HadithsScreen extends StatelessWidget {
  final String title;
  final String id;
  const HadithsScreen({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<HadithsCubit>().getHadiths(book: id,);
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            title,
            style: GoogleFonts.elMessiri(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF522700),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
        body: BlocBuilder<HadithsCubit, HadithsState>(
          builder: (context, state) {
            if (state is  HadithsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is  HadithsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: state.hadiths.length,
                  itemBuilder: (context, index) {
                    return HadithsContainer(
                      hadiths: state.hadiths[index], index: index,
                    );
                  },
                ),
              );
            } else if (state is  HadithsError) {
              return Center(child: Text('حدث خطأ: ${state.error}'));
            }else
              return const Center(child: Text('لا توجد بيانات متاحة'));
          },
        ),
      ),
    );
  }
}
