import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarn_app/manager/Suwar/state.dart';
import 'package:quarn_app/models/suwar.dart';
import 'package:quarn_app/network/apiService.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());
  ApiService apiService = ApiService();
  getSuwar() async {
    emit(LoadingState());
    var json = await apiService.getSurah(endponit: '/surah');
    List<Suwar> suwars = [];
    try {
      for (var i in json['data']) {
        suwars.add(
            Suwar(name: i['name'], number: i['number'], numberOfAyahs: i['numberOfAyahs'], englishName: i['englishName'],));
      }
      emit(LoadedState(suwars: suwars));
    } on Exception catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }
}

