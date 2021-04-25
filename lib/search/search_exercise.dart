import 'package:flutter/material.dart';
import 'package:proyecto_integrador/repositories/enumerations.dart';

class SearchExercise extends StatefulWidget {
  SearchExercise({Key key}) : super(key: key);

  @override
  _SearchExerciseState createState() => _SearchExerciseState();
}

class _SearchExerciseState extends State<SearchExercise> {
  List<String> _targetGroupsList = [
    'Abdominals',
    'Chest',
    'Arms',
    'Back',
    'Legs',
    'Calves',
    'Shoulders'
  ];

  List<String> _targetGroupsImageList = [
    'assets/categories/abs.png',
    'assets/categories/pecs.png',
    'assets/categories/arms.png',
    'assets/categories/back.png',
    'assets/categories/legs.png',
    'assets/categories/calves.png',
    'assets/categories/shoulders.png'
  ];

  List<bool> _targetGroupSelectedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<String> _equipmentList = [
    'Barbell',
    'SZ-Bar',
    'Dumbbell',
    'Gym mat',
    'Swiss Ball',
    'Pull-up bar',
    'Bench',
    'Incline bench',
    'Kettlebell',
    'None'
  ];

  List<String> _equipmentImageList = [];

  List<bool> _equipmentSelectedList = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search exercise"),
      ),
      body: Row(
        children: [
          //Columna de la derecha dividida en dos: Target groups y equipment
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Target groups',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ),
                Expanded(
                  child: buildTargetGroups(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Text(
                    'Equipment',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ),
                Expanded(
                  child: buildEquipment(),
                ),
              ],
            ),
          ),
          //Columna de la izquierda para mostrar ejercicios buscados
          Expanded(
            child: Column(
              children: [
                Text('Lista ejercicios'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildEquipment() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: ListView.separated(
          itemCount: _equipmentList.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            height: 5,
            thickness: 1,
            color: Colors.grey,
          ),
          itemBuilder: (BuildContext context, int index) => ListTile(
            leading: Image.asset(
              // _equipmentImageList[index],
              'assets/misc/dummy-square.png',
              width: 64,
              height: 64,
            ),
            title: Text(
              _equipmentList[index],
              style: TextStyle(color: Colors.black),
            ),
            selectedTileColor: Colors.grey[200],
            selected: _equipmentSelectedList[index],
            onTap: () {
              setState(() {
                _equipmentSelectedList[index] = !_equipmentSelectedList[index];
              });
            },
          ),
        ),
      ),
    );
  }

  Padding buildTargetGroups() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: ListView.separated(
          itemCount: _targetGroupsList.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            height: 5,
            thickness: 1,
            color: Colors.grey,
          ),
          itemBuilder: (BuildContext context, int index) => ListTile(
            leading: Image.asset(
              _targetGroupsImageList[index],
              width: 64,
              height: 64,
            ),
            title: Text(
              _targetGroupsList[index],
              style: TextStyle(color: Colors.black),
            ),
            selectedTileColor: Colors.grey[200],
            selected: _targetGroupSelectedList[index],
            onTap: () {
              setState(() {
                _targetGroupSelectedList[index] =
                    !_targetGroupSelectedList[index];
              });
            },
          ),
        ),
      ),
    );
  }
}
