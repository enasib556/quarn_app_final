import 'package:quarn_app/models/suwar.dart';

abstract class AppState {}
class InitialState extends AppState {}
class LoadingState extends AppState {}
class LoadedState extends AppState {
  final List<Suwar> suwars;

  LoadedState({required this.suwars});
}
class ErrorState extends AppState {
  final String message;
  ErrorState({required this.message});
}