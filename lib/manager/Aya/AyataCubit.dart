import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarn_app/models/ayah.dart';
import 'package:quarn_app/network/apiService.dart';

import 'AyataState.dart';

class AyataCubit extends Cubit<AyataState> {
  AyataCubit():super(InitalState());
  ApiService apiService=ApiService();
  getAyah({required int number})async{
    var json= await apiService.getSurah(endponit: '/surah/$number/ar.alafasy');
    List<Ayah> ayahs =[];
     emit(LoadingState());
     try {
       for(var ayah in json['data']['ayahs']){
         ayahs.add(Ayah(text: ayah['text'], numberInQuran: ayah['number'], numberInSurah: ayah['numberInSurah'], audioUrl: ayah['audio'] ));
       }
       emit(LoadedState(ayahs: ayahs));
     } on Exception catch (e) {
       emit(ErrorState(message: e.toString()));
     }
  }
}
