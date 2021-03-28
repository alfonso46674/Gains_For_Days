import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:proyecto_integrador/ejercicios/menu_ejercicios.dart';
import 'package:proyecto_integrador/login/bloc/login_bloc.dart';
import 'package:proyecto_integrador/login/form_body.dart';
import 'package:proyecto_integrador/utils/constants.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  LoginBloc _loginBloc;
  bool _showLoading = false;

  void _googleLogIn(bool _) {
    // invocar al login de firebase con el bloc
    // recodar configurar pantallad Oauth en google Cloud
    print("google");
    _loginBloc.add(LoginWithGoogleEvent());
  }

  void _anonymousLogIn(bool _) {
    print("anonimo");
    _loginBloc.add(LoginAnonymousEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            //Espaciado
            SizedBox(height: 80.0),
            //Imagen de Cupping
            Image.asset(
              'assets/main/logo.png',
              height: 150,
            ),

            SizedBox(
              height: 100,
            ),

            //Botones de registro y login
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: BLUE_COLOR,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'REGISTRATE',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/register');
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: BLUE_COLOR,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'INGRESA',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
              ),
            ),
         
            SafeArea(
              child: BlocProvider(
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
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginSuccessState) {
                      Navigator.pushNamed(context, '/home');
                    }
                    return Container(
                        child: FormBody(
                      onGoogleLoginTap: _googleLogIn,
                      onAnonymousLoginTap: _anonymousLogIn,
                    ));
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _showLoading ? CircularProgressIndicator() : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
