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
  final Exercise ejercicio;

  const EjerciciosCargadosState({@required this.ejercicio}) : assert(ejercicio != null);

  @override
  List<Object> get props => [ejercicio];

}

//cuando se hace un fetch con error
class EjerciciosErrorState extends EjerciciosState {}
