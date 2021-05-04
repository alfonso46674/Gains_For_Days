part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends RegisterEvent{
  final String email;
  final String password_1;
  final String password_2;

  RegisterUserEvent({@required this.email, @required this.password_1, @required this.password_2});

  @override
  List<Object> get props => [email,password_1, password_2];
}
