
import 'package:quarn_app/models/books_hadiths.dart';

abstract class BookHadithsState {}

class BooksHadithsInitial extends BookHadithsState {}

class BooksHadithsLoading extends BookHadithsState {}

class  BooksHadithsLoaded extends BookHadithsState {
  final List<BooksHadiths> booksHadiths;
  BooksHadithsLoaded({required this.booksHadiths});
}

class  BooksHadithsError extends BookHadithsState {
  final String error;
  BooksHadithsError({required this.error});
}
