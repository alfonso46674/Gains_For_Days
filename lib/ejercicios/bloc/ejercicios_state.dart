part of 'ejercicios_bloc.dart';

abstract class EjerciciosState extends Equatable {
  const EjerciciosState();
  
  @override
  List<Object> get props => [];
}

class EjerciciosInitialState extends EjerciciosState {}

//estado inicial, ejercicios vacios
class EjerciciosVaciosState extends EjerciciosState {}

//cuando se hace fetch a los ejercicios
class EjerciciosCargandoState extends EjerciciosState {}

//cuando se hizo un fetch exitoso
class EjerciciosCargadosState extends EjerciciosState {
  final List<dynamic> exercisesList;

  const EjerciciosCargadosState({@required this.exercisesList}) : assert(exercisesList != null);

  @override
  List<Object> get props => [exercisesList];

}

//cuando se hace un fetch con error
class EjerciciosErrorState extends EjerciciosState {}
