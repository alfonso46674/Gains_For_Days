part of 'ejercicios_bloc_bloc.dart';

@immutable
abstract class EjerciciosBlocEvent extends Equatable {}

class EjerciciosEvent extends EjerciciosBlocEvent {
  @override
  List<Object> get props => [];
}

class EjerciciosMuscoloEvent extends EjerciciosBlocEvent {
  @override
  List<Object> get props => [];
}

class EjerciciosDetailEvent extends EjerciciosBlocEvent {
  @override
  List<Object> get props => [];
}
