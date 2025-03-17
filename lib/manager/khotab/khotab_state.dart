 import '../../models/khotab.dart';

abstract class KhotabState{}
 class InitalKhotabState extends KhotabState{}
 class LoadedKhotabState extends KhotabState{
   final List<Khotab> khotabs;
   LoadedKhotabState({required this.khotabs});
 }
 class ErrorKhotabState extends KhotabState{
   final String message;
   ErrorKhotabState({required this.message});
 }
 class LoadingKhotabState extends KhotabState{}