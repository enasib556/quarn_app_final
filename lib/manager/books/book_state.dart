import 'package:quarn_app/models/book.dart';

abstract class BookState {}
class InitialBookState extends BookState {}
class ErrorBookState extends BookState {
  final String message;
  ErrorBookState({required this.message});
}
class LoadingBookState extends BookState {}
class LoadedBookState extends BookState {
  final List<Book> books;
  LoadedBookState({required this.books});
}