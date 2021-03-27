import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class FormBody extends StatelessWidget {
  // cambiar a un solo value changed que reciba enum de login
  final ValueChanged<bool> onGoogleLoginTap;

  FormBody({
    Key key,
    @required this.onGoogleLoginTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // login buttons
        SizedBox(height: 40),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            children: [
              Expanded(
                child: GoogleAuthButton(
                  onPressed: () => onGoogleLoginTap(true),
                  text: "Iniciar con Google",
                  borderRadius: 18.0,
                  darkMode: false,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            "Al acceder se aceptan los terminos y condiciones asi como la politica de privacidad, "
            "mismos que pueden ser consultados en mipaginaweb.com.mx o en los ajustes de la aplicacion.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 10),
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
