import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarn_app/models/khotab.dart';
import 'package:quarn_app/network/apiServiceLesson.dart';

import 'khotab_state.dart';

class KhotabCubit extends Cubit<KhotabState> {
  KhotabCubit() : super(InitalKhotabState());
  ApiServiseLesson apiServiseLesson = ApiServiseLesson();
  List<Khotab> khotabs = [];
  getKhotab() async {
    emit(LoadingKhotabState());
    var json = await apiServiseLesson.get(
        endpoints: '/paV29H2gm56kvLPy/main/khotab/ar/ar/1/25/json');

    try {
      for (var khotab in json["data"]) {
        String url = (khotab['attachments'] != null && khotab['attachments'].isNotEmpty)
            ? khotab['attachments'].first['url']
            : '';
        khotabs.add(Khotab(
          name: khotab['title'] ?? 'بدون عنوان',
          description: khotab['description'] ?? 'لا يوجد وصف',
          pdf: url,
        ));
      }

      emit(LoadedKhotabState(khotabs: khotabs));
    } on Exception catch (e) {
      emit(ErrorKhotabState(message: e.toString()));
    }
  }

}