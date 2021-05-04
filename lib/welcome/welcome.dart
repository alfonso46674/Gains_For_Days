import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:proyecto_integrador/auth/bloc/auth_bloc.dart';
import 'package:proyecto_integrador/exercises/menu_exercises.dart';
import 'package:proyecto_integrador/login/bloc/login_bloc.dart';
import 'package:proyecto_integrador/login/form_body.dart';
import 'package:proyecto_integrador/register/register.dart';
import 'package:proyecto_integrador/utils/constants.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  LoginBloc _loginBloc;
  bool _showLoading = false;
  var _emailTc = TextEditingController();
  var _passwordTc = TextEditingController();

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

  void _credentialsLogIn(bool _) {
    print('credentials');
    _loginBloc.add(LoginWithCredentialEvent(
      email: _emailTc.text,
      password: _passwordTc.text,
    ));
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
            SizedBox(height: 60.0),
            //Imagen de Cupping
            Image.asset(
              'assets/main/logo.png',
              height: 150,
            ),

            SizedBox(
              height: 40,
            ),
            //inputs para email y contraseña
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
              style: TextStyle(height: 0.5),
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
                fillColor: Colors.transparent,
              ),
              obscureText: true,
            ),

            SizedBox(
              height: 40,
            ),
            //boton signin
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
                  'SIGN IN',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _credentialsLogIn(true);
                },
              ),
            ),

            //boton registro
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: BLUE_COLOR,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
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
                    } else if (state is LoginSuccessState) {
                      BlocProvider.of<AuthBloc>(context)
                          .add(VerifyAuthenticationEvent());
                    }
                  },
                  builder: (context, state) {
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
            //Botones de registro
          ],
        ),
      ),
    );
  }
}
