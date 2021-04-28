import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_integrador/exercises/details_exercise.dart';
import 'package:proyecto_integrador/models/exercise.dart';
import 'package:proyecto_integrador/workouts/add_workout/bloc/addworkout_bloc.dart';

class AddWorkout extends StatefulWidget {
  AddWorkout({Key key}) : super(key: key);

  @override
  _AddWorkoutState createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
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

  List<bool> _targetGroupsSelectedList = [
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

  //listas de parametros de busqueda para los ejercicios
  List<String> _targetGroupsSearchList = [];
  List<String> _equipmentSearchList = [];

  //lista de ejercicios que conforman el workout a crear
  List<Exercise> _workoutExercises = [];

  //controller para el nombre del workout
  var _workoutNameTc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search exercise"),
      ),
      body: BlocProvider(
          create: (context) => AddworkoutBloc(),
          child: BlocConsumer<AddworkoutBloc, AddworkoutState>(
            listener: (context, state) {
              if (state is AddworkoutEmptyRequestState) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text('Nothing to show'),
                    ),
                  );
              } else if (state is AddworkoutErrorMessageState) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text("${state.errorMsg}"),
                    ),
                  );
              } else if (state is AddworkoutSuccessSaveWorkoutState) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text("Workout saved successfully"),
                    ),
                  );
              } else if (state is AddworkoutFailedSaveWorkoutState) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text("Failed to save workout"),
                    ),
                  );
              }
            },
            builder: (context, state) {
              return Row(
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
                          padding: const EdgeInsets.only(top: 10),
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
                        TextField(
                            controller: _workoutNameTc,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Workout name',
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              child: Text('Search'),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.grey[600],
                                onSurface: Colors.grey,
                              ),
                              onPressed: () {
                                BlocProvider.of<AddworkoutBloc>(context).add(
                                    AddWorkoutSearchRequestEvent(
                                        targetGroups: _targetGroupsSearchList,
                                        equipment: _equipmentSearchList));
                              },
                            ),
                            TextButton(
                              child: Text('Add Workout'),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.grey[600],
                                onSurface: Colors.grey,
                              ),
                              onPressed: () {
                                //TODO: Mandar a guardar los ejercicios y nombre del workout a Firebase
                                BlocProvider.of<AddworkoutBloc>(context).add(
                                  AddWorkoutSaveWorkoutEvent(
                                    workoutExercises: _workoutExercises,
                                  ),
                                );
                                _workoutExercises = [];
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        BlocBuilder<AddworkoutBloc, AddworkoutState>(
                          builder: (context, state) {
                            if (state is AddworkoutResultState) {
                              return Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: state.searchResult.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return buildItemListVariation(
                                          state, index, context);
                                    }),
                              );
                            } else if (state is AddworkoutLoadingState) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Center();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }

  // Una copia de la vista itemExercise, pero se tuvo que hacer asi porque se necesita tener acceso a las variables privadas de esta clase
  Container buildItemListVariation(
      AddworkoutResultState state, int index, BuildContext context) {
    return Container(
      child: TextButton(
        child: Card(
            child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                //if the exercice's imageUrl is not null, display said image, otherwise display stock photo
                leading: Builder(
                  builder: (context) {
                    final condition =
                        state.searchResult[index].imageUrl != null;
                    return condition
                        ? Image.network(
                            state.searchResult[index].imageUrl,
                            width: 50,
                            height: 50,
                          )
                        : Image.asset(
                            'assets/misc/dummy-square.png',
                            width: 50,
                            height: 50,
                          );
                  },
                ),
                title: Text(
                  "${state.searchResult[index].name}",
                  textAlign: TextAlign.left,
                ),
                dense: true,
                trailing: Builder(builder: (context) {
                  final condition =
                      state.searchResult[index].selectedForWorkout;
                  return condition
                      ? IconButton(
                          icon: Icon(Icons.add),
                          color: Colors.grey,
                          onPressed: () {
                            setState(() {
                              //añadir el ejercicio a la lista de ejercicios que conformaran el workout
                              _workoutExercises.removeWhere((exercise) =>
                                  exercise.id == state.searchResult[index].id);
                              //cambiar el valor de selectedForWorkout
                              state.searchResult[index].selectedForWorkout =
                                  !state.searchResult[index].selectedForWorkout;
                              // print('\n');
                              // for(var i = 0; i < _workoutExercises.length; i++){
                              //   print(_workoutExercises[i].id);
                              // }
                            });
                          },
                        )
                      : // mostrar icono en azul cuando la condicion sea false
                      IconButton(
                          icon: Icon(Icons.add),
                          color: Colors.blue,
                          onPressed: () {
                            setState(() {
                              //añadir el ejercicio a la lista de ejercicios que conformaran el workout
                              _workoutExercises.add(state.searchResult[index]);
                              //cambiar el valor de selectedForWorkout
                              state.searchResult[index].selectedForWorkout =
                                  !state.searchResult[index].selectedForWorkout;
                              // print('\n');
                              // for(var i = 0; i < _workoutExercises.length; i++){
                              //   print(_workoutExercises[i].id);
                              // }
                            });
                          },
                        );
                }))),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => DetailsExercise(
                      ejercicio: state.searchResult[index],
                    )),
          );
        },
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

                //agregar a la lista si esta en true
                if (_equipmentSelectedList[index] == true) {
                  _equipmentSearchList.add(_equipmentList[index]);
                }
                //buscar y eliminar de la lista
                else {
                  _equipmentSearchList.removeWhere(
                      (element) => element == _equipmentList[index]);
                }
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
            selected: _targetGroupsSelectedList[index],
            onTap: () {
              setState(() {
                _targetGroupsSelectedList[index] =
                    !_targetGroupsSelectedList[index];

                //agregar a la lista si esta en true
                if (_targetGroupsSelectedList[index] == true) {
                  _targetGroupsSearchList.add(_targetGroupsList[index]);
                }
                //buscar y eliminar de la lista
                else {
                  _targetGroupsSearchList.removeWhere(
                      (element) => element == _targetGroupsList[index]);
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
