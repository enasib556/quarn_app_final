import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../manager/HadithsBooks/BooksHadithsCubit.dart';
import '../manager/HadithsBooks/BooksHadithsState.dart';
import '../widgets/book_hadiths_widgets/person_hadiths_container.dart';

class BooksHadithsScreen extends StatelessWidget {
  const BooksHadithsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'كتب الأحاديث',
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
        body: BlocBuilder<BookHadithsCubit, BookHadithsState>(
          builder: (context, state) {
            if (state is  BooksHadithsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is  BooksHadithsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: state.booksHadiths.length,
                  itemBuilder: (context, index) {
                    return PersonHadithsContainer(
                      hadiths: state.booksHadiths[index], index: index,
                    );
                  },
                ),
              );
            } else if (state is  BooksHadithsError) {
              return Center(child: Text('حدث خطأ: ${state.error}'));
            }else
            return const Center(child: Text('لا توجد بيانات متاحة'));
          },
        ),
      ),
    );
  }
}
