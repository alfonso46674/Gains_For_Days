import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'ejercicios_bloc_event.dart';
part 'ejercicios_bloc_state.dart';

class EjerciciosBlocBloc extends Bloc<EjerciciosBlocEvent, EjerciciosBlocState> {
  EjerciciosBlocBloc() : super(EjerciciosBlocInitial());

  @override
  Stream<EjerciciosBlocState> mapEventToState(
    EjerciciosBlocEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
