import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarn_app/network/apiServiceHadiths.dart';

import '../../models/books_hadiths.dart';
import 'BooksHadithsState.dart';

class BookHadithsCubit extends Cubit<BookHadithsState> {
  BookHadithsCubit() : super( BooksHadithsInitial());
  ApiServiceHadiths apiServiceHadiths = ApiServiceHadiths();
  getBooksHadiths() async {
    emit( BooksHadithsLoading());
    var json= await apiServiceHadiths.get(endpoints: '/books');
    List<BooksHadiths> booksHadiths = [];
    try {
      for(var i in json['data']){
        booksHadiths.add(BooksHadiths(name: i['name'], id: i['id'], numberOfHadiths: i['available']));
      }
      emit( BooksHadithsLoaded(booksHadiths: booksHadiths));
    } on Exception catch (e) {
       emit( BooksHadithsError(error: e.toString()));
    }
  }
}