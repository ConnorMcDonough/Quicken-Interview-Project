part of 'webbloc_bloc.dart';

@immutable
abstract class WebblocEvent {}

class FetchData extends WebblocEvent {
  FetchData();
}
