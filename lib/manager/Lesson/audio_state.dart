import '../../models/lesson.dart';

abstract class AudioState {}
class InitalAudioState extends AudioState {}
class LoadingAudioState extends AudioState {}
class LoadedAudioState extends AudioState {
  final List<Audio> audios;
  LoadedAudioState({required this.audios});
}
class ErrorAudioState extends AudioState {
  final String message;
  ErrorAudioState({required this.message});
}