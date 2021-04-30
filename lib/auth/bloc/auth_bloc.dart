import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:proyecto_integrador/repositories/exerciseApiClient.dart';
import 'package:proyecto_integrador/repositories/exercise_repository.dart';
import 'package:http/http.dart' as http;
import '../user_auth_provider.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //auth provider
  UserAuthProvider _authProvider = UserAuthProvider();

  //exercise repository
  ExerciseRepository repositorioEjercicios = ExerciseRepository(
    exerciseApiClient: ExerciseApiClient(
      httpClient: http.Client(),
    ),
  );

  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is VerifyAuthenticationEvent) {
      //REQUEST A APIS - Cargar los ejercicios desde que se intenta hacer verificacion en el main
       repositorioEjercicios.fetchExercises();
      //ACCESO A BD LOCALES
      //REVISAR ACCESO A INTERNET
      //Lo necesario para inicializar datos de la app
      Future.delayed(Duration(seconds: 3));
      if (_authProvider.isLogged()) {
        // print("-----------");
        // print(_authProvider.isLogged());
        yield AlreadyAuthState();
      } else
        yield UnAuthState();
    }

    if (event is SignOutAuthenticationEvent) {
      if (FirebaseAuth.instance.currentUser.isAnonymous) {
        await _authProvider.signOutFirebase();
      } else {
        await _authProvider.signOutGoogle();
        await _authProvider.signOutFirebase();
      }

      yield UnAuthState();
    }
  }
}
