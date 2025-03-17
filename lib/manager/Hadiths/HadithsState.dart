
import '../../models/hadiths.dart';

abstract class HadithsState {}

class HadithsInitial extends HadithsState {}

class HadithsLoading extends HadithsState {}

class HadithsLoaded extends HadithsState {
  final List<Hadiths> hadiths;
  HadithsLoaded({required this.hadiths});
}

class HadithsError extends HadithsState {
  final String error;
  HadithsError({required this.error});
}
