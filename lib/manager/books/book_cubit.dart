import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarn_app/network/apiServiceLesson.dart';
import '../../models/book.dart';
import 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(InitialBookState());
  ApiServiseLesson apiServiseLesson = ApiServiseLesson();
  List<Book> books = [];
  getBooks() async {
    emit(LoadingBookState());
    var json = await apiServiseLesson.get(
        endpoints: '/paV29H2gm56kvLPy/main/books/ar/ar/1/25/json');
    try {
      for (var i in json['data']) {
        String url = (i['attachments'] != null && i['attachments'].isNotEmpty)
            ? i['attachments'].first['url']
            : '';
        books.add(
            Book(discription: i['description'], pdf: url, title: i['title']));
      }
      emit(LoadedBookState(books: books));
    } on Exception catch (e) {
      emit(ErrorBookState(message: e.toString()));
    }
  }
}
