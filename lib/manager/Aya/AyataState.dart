import '../../models/ayah.dart';
abstract class AyataState  {}
class InitalState extends AyataState {}
class LoadingState extends AyataState {}
class LoadedState extends AyataState {
  final List<Ayah> ayahs;
  LoadedState({required this.ayahs});
}
class ErrorState extends AyataState {
  final String message;
  ErrorState({ required this.message});
}