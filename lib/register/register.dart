import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_integrador/register/bloc/register_bloc.dart';
import 'package:proyecto_integrador/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _showLoading = false;
  var _emailController = TextEditingController();
  var _passwordOneController = TextEditingController();
  var _passwordTwoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            _showLoading = false;
            _passwordOneController.text = '';
            _passwordTwoController.text = '';
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
          } else if (state is RegisterLoadingState) {
            _showLoading = !_showLoading;
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: PRIMARY_COLOR,
            body: SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                children: <Widget>[
                  SizedBox(height: 80.0),
                  Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/main/logo.png',
                        // width: 200,
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                  SizedBox(height: 20.0),

                  //INPUTS PARA USUARIO Y CONTRASEÑA
                  Text(
                    'Email:',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: _emailController,
                    style: TextStyle(height: 0.5),
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Email',
                      fillColor: Colors.transparent,
                    ),
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
                    controller: _passwordOneController,
                    style: TextStyle(color: Colors.white, height: 0.5),
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Password',
                      fillColor: Colors.transparent,
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Password
                  Text(
                    'Password',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: _passwordTwoController,
                    style: TextStyle(color: Colors.white, height: 0.5),
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Repeat password',
                      fillColor: Colors.transparent,
                    ),
                    obscureText: true,
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: BLUE_COLOR,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                                color: Color.fromARGB(255, 0xBC, 0xB0, 0xA1))),
                      ),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        BlocProvider.of<RegisterBloc>(context)
                            .add(RegisterUserEvent(
                          email: _emailController.text,
                          password_1: _passwordOneController.text,
                          password_2: _passwordTwoController.text,
                        ));
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: _showLoading
                        ? CircularProgressIndicator()
                        : Container(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
