import 'package:flutter/material.dart';
import 'package:proyecto_integrador/ejercicios/menu_ejercicios.dart';
import 'package:proyecto_integrador/rutinas/mis_rutinas.dart';

class MainMenu extends StatefulWidget {
  MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _currentPageIndex = 0;
  final _pagesList = [
    MenuEjercicios(),
    MisRutinas(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: IndexedStack(
        index: _currentPageIndex,
        children: _pagesList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (index){
          setState(() {
            _currentPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: "Ejercicios"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: "Rutinas"
          )
        ],
      ),
    );
  }
}
