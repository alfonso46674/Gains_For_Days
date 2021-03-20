part of 'ejercicios_bloc.dart';

abstract class EjerciciosEvent extends Equatable {
  const EjerciciosEvent();

  @override
  List<Object> get props => [];
}

class FetchEjerciciosEvent extends EjerciciosEvent{
  const FetchEjerciciosEvent();

  @override
  List<Object> get props => [];  
}
