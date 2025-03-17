import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quarn_app/models/lesson.dart';
import 'package:quarn_app/network/apiServiceLesson.dart';
import 'lesson_state.dart';

class LessonCubit extends Cubit<LessonState> {
  LessonCubit() : super(InitalLessonState());
  ApiServiseLesson apiServiseLesson = ApiServiseLesson();
  List<Lesson> lessons = [];
  getLessons() async {
    emit(LoadingLessonState());
    var json = await apiServiseLesson.get(
        endpoints: '/paV29H2gm56kvLPy/main/videos/ar/ar/1/25/json');
    // print(json);
    try {
      for (var i in json['data']) {
        lessons.add(Lesson(
            title: i['title'],
            description: i['description'],
            video: i['attachments']));
      }
      emit(LoadedLessonState(lessons: lessons));
    } on Exception catch (e) {
      emit(ErrorLessonState(message: e.toString()));
    }
  }
}
