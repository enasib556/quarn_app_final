import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarn_app/models/hadiths.dart';
import 'package:quarn_app/network/apiServiceHadiths.dart';
import 'HadithsState.dart';

class HadithsCubit extends Cubit<HadithsState> {
  HadithsCubit():super(HadithsInitial());
  ApiServiceHadiths apiServiceHadiths = ApiServiceHadiths();
  List<Hadiths> hadiths = [];
  getHadiths({required String book}) async {
    emit(HadithsLoading());
    var json= await apiServiceHadiths.get(endpoints: '/books/$book?range=300-500');
    try {
      for(var i in json['data']['hadiths']){
        hadiths.add(Hadiths(content: i['arab']));
      }
     emit(HadithsLoaded(hadiths: hadiths));
    } on Exception catch (e) {
      emit(HadithsError(error: e.toString()));
    }
  }
}