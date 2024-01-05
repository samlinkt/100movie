part of 'movie_bloc.dart';

@immutable
abstract class MovieState {}

class MovieInitial extends MovieState {}
class MovieBlocLoading extends MovieState{}
class MovieBlocLoaded extends MovieState{}
class MovieBlocError extends MovieState{}