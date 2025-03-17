import 'package:quarn_app/models/lesson.dart';

abstract class LessonState {}
class InitalLessonState extends LessonState {}
class LoadedLessonState extends LessonState {
  final List<Lesson> lessons;
  LoadedLessonState({required this.lessons});
}
class ErrorLessonState extends LessonState {
  final String message;
  ErrorLessonState({required this.message});
}
class LoadingLessonState extends LessonState {}
