import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_integrador/auth/bloc/auth_bloc.dart';
import 'package:proyecto_integrador/login/bloc/login_bloc.dart';
import 'package:proyecto_integrador/utils/constants.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginBloc _loginBloc;
  bool _showLoading = false;
  void _credentialsLogIn() {
    _loginBloc.add(LoginWithCredentialEvent(
      email: _emailTc.text,
      password: _passwordTc.text,
    ));
  }

  var _emailTc = TextEditingController();
  var _passwordTc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: BlocProvider(
          create: (context) {
            _loginBloc = LoginBloc();
            return _loginBloc..add(VerifyLogInEvent());
          },
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginErrorState) {
                _showLoading = false;
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      content: Text("${state.error}"),
                      actions: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("OK"),
                        )
                      ],
                    );
                  },
                );
              } else if (state is LoginLoadingState) {
                _showLoading = !_showLoading;
              } else if (state is LoginSuccessState) {
                BlocProvider.of<AuthBloc>(context)
                    .add(VerifyAuthenticationEvent());
              }
            },
            builder: (context, state) {
              return SafeArea(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  children: <Widget>[
                    SizedBox(height: 80.0),
                    Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/main/logo.png',
                          // width: 300,
                        ),
                        SizedBox(height: 16.0),
                      ],
                    ),
                    SizedBox(height: 20.0),

                    //INPUTS PARA USUARIO Y CONTRASEÑA
                    //Username
                    Text(
                      'Email:',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextField(
                      controller: _emailTc,
                      style: TextStyle(height: 0.5),
                      decoration: InputDecoration(
                          filled: true,
                          labelText: 'Email',
                          fillColor: Colors.transparent),
                    ),
                    //Espaciado
                    SizedBox(height: 12.0),

                    SizedBox(
                      height: 20,
                    ),
                    //Password
                    Text(
                      'Password',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextField(
                      controller: _passwordTc,
                      style: TextStyle(color: Colors.white, height: 0.5),
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Password',
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0.0),
                        ),
                      ),
                      obscureText: true,
                    ),

                    SizedBox(
                      height: 40,
                    ),
                    // Añadir los botones de cancelar y siguiente
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: BLUE_COLOR,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _credentialsLogIn();
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
