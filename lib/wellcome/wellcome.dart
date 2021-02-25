import 'package:flutter/material.dart';

class Wellcome extends StatefulWidget {
  Wellcome({Key key}) : super(key: key);

  @override
  _WellcomeState createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: PRIMARY_COLOR,
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
                  primary: Color.fromARGB(255, 0xBC, 0xB0, 0xA1),
                ),
                child: Text(
                  'REGISTRATE',
                  style: TextStyle(color: Colors.black),
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
                  primary: Color.fromARGB(255, 0xBC, 0xB0, 0xA1),
                ),
                child: Text(
                  'INGRESA',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
