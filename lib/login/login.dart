import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: PRIMARY_COLOR,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset(
                  'assets/main/logo.png',
                  width: 300,
                ),
                SizedBox(height: 16.0),
              ],
            ),
            SizedBox(height: 20.0),

            //INPUTS PARA USUARIO Y CONTRASEÑA
            //Username
            Text(
              'Nombre completo:',
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              style: TextStyle(height: 0.5),
              decoration: InputDecoration(
                  filled: true,
                  labelText: 'Nombre completo',
                  fillColor: Colors.white),
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
              style: TextStyle(color: Colors.white, height: 0.5),
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 0.0),
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
                    primary: Color.fromARGB(255, 0xBC, 0xB0, 0xA1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                            color: Color.fromARGB(255, 0xBC, 0xB0, 0xA1)))),
                child: Text(
                  'ENTRAR',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
