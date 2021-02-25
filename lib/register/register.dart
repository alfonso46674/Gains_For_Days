import 'package:flutter/material.dart';
import 'package:proyecto_integrador/utils/constants.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
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
            //Username
            Text(
              'Nombre completo:',
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              style: TextStyle(height: 0.5),
              decoration: InputDecoration(
                  filled: true, labelText: 'Username', fillColor: Colors.white),
            ),
            //Espaciado
            SizedBox(height: 20.0),
            Text(
              'Email:',
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              style: TextStyle(height: 0.5),
              decoration: InputDecoration(
                  filled: true, labelText: 'Email', fillColor: Colors.white),
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
              height: 10,
            ),
            CheckboxListTile(
                value: _checked,
                onChanged: (newValue) {},
                // activeColor: Color.fromARGB(255, 0xBC, 0xB0, 0xA1),
                title: Text(
                  "ACEPTO LOS TÉRMINOS Y CONDICIONES DE USO",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                controlAffinity:
                    ListTileControlAffinity.leading //  <-- leading Checkbox
                ),
            SizedBox(
              height: 30,
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
                      side: BorderSide(
                          color: Color.fromARGB(255, 0xBC, 0xB0, 0xA1))),
                ),
                child: Text(
                  'REGISTRATE',
                  style: TextStyle(color: Colors.white),
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
