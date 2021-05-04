part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class VerifyLogInEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class LoginWithGoogleEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class ForgotPasswordEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class LoginAnonymousEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class LoginWithCredentialEvent extends LoginEvent {
  final String email;
  final String password;

  LoginWithCredentialEvent({this.email,this.password});
  @override
  List<Object> get props => [email,password];
}
