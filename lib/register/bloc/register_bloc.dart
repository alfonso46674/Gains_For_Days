import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:proyecto_integrador/auth/user_auth_provider.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  UserAuthProvider _authProvider = UserAuthProvider();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterUserEvent) {
      if (event.password_1 == event.password_2) {
        try {
          yield RegisterLoadingState();

          await _authProvider.signUp(
            email: event.email,
            password: event.password_1,
          );

          yield RegisterSuccessState();

        } catch (e) {
          yield RegisterErrorState(error: 'Error while registering user.');
        }
      } else {
        yield RegisterErrorState(error: 'Passwords do not match.');
      }
    }
  }
}
