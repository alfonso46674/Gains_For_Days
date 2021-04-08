part of 'ejercicios_bloc.dart';

abstract class EjerciciosEvent extends Equatable {
  const EjerciciosEvent();

  @override
  List<Object> get props => [];
}

class FetchEjerciciosEvent extends EjerciciosEvent{
  final ExerciseCategory category ;
  const FetchEjerciciosEvent(@required this.category) : assert(category != null);

  @override
  List<Object> get props => [category];  
}
