import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarn_app/manager/Lesson/lesson_cubit.dart';
import 'package:quarn_app/manager/books/book_cubit.dart';
import 'package:quarn_app/manager/khotab/khotab_cubit.dart';
import 'package:quarn_app/screens/splash_screen.dart';
import 'manager/Aya/AyataCubit.dart';
import 'manager/Hadiths/HadithsCubit.dart';
import 'manager/HadithsBooks/BooksHadithsCubit.dart';
import 'manager/Lesson/audio_cubit.dart';
import 'manager/Suwar/cubit.dart';

void main()
{
  runApp(const QuranAPP());
}

class QuranAPP extends StatelessWidget {
  const QuranAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => AppCubit()..getSuwar()),
      BlocProvider(create: (context) => AyataCubit()),
      BlocProvider(create: (context) => BookHadithsCubit()..getBooksHadiths()),
      BlocProvider(create: (context) => HadithsCubit()),
      BlocProvider(create: (context) => LessonCubit()..getLessons()),
      BlocProvider(create: (context) => AudioCubit()..getAudios()),
      BlocProvider(create: (BuildContext context)=>KhotabCubit()..getKhotab()),
      BlocProvider(create: (BuildContext context)=>BookCubit()..getBooks(),
      ),

    ], child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen()));
  }
}
