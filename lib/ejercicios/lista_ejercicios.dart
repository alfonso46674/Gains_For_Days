import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_integrador/repositories/exerciseApiClient.dart';
import 'package:proyecto_integrador/repositories/exercise_repository.dart';
import 'bloc/ejercicios_bloc.dart';
import 'item_ejercicios.dart';
import 'package:http/http.dart' as http;

class ListaEjercicios extends StatefulWidget {
  const ListaEjercicios({Key key}) : super(key: key);

  @override
  _ListaEjerciciosState createState() => _ListaEjerciciosState();
}

class _ListaEjerciciosState extends State<ListaEjercicios> {
  EjerciciosBloc _ejerciciosBloc;
  ExerciseRepository repositorio = ExerciseRepository(
    exerciseApiClient: ExerciseApiClient(
      httpClient: http.Client(),
    ),
  );

  @override
  void dispose() {
    _ejerciciosBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ejercicios de abdomen"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/busquedaEjercicios');
              },
            ),
          ],
        ),
        body: BlocProvider(
          create: (context) {
            _ejerciciosBloc =
                EjerciciosBloc(repositorioEjercicios: repositorio);
            return _ejerciciosBloc;
          },
          child: contenedorEjercicios(),
        ));
  }

  Widget contenedorEjercicios() {
    return Container(child: BlocBuilder<EjerciciosBloc, EjerciciosState>(
      builder: (context, state) {
        //si no hay ejercicios desplegados
        if (state is EjerciciosVaciosState) {
          //hacer el fetch de los ejercicios, lo cual detonara un evento
          BlocProvider.of<EjerciciosBloc>(context).add(FetchEjerciciosEvent());
        }
        // si da error al hacer fetch de ejercicios
        if (state is EjerciciosErrorState) {
          return Center(
            child: Text('Failed to fetch exercises, try again later'),
          );
        }
        //Ejercicios cargados exitosamente
        if (state is EjerciciosCargadosState) {
          //TODO: Regrear lista de ejercicios que cumplan con condicion
          return ListTile(
            leading: Text(
              '${state.ejercicio.id}',
              style: TextStyle(fontSize: 10.0),
            ),
            title: Text(state.ejercicio.name),
            isThreeLine: true,
            subtitle: Text(state.ejercicio.description),
            dense: true,
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}


// return ListView.builder(
//             scrollDirection: Axis.vertical,
//             shrinkWrap: true,
//             itemCount: 15,
//             itemBuilder: (BuildContext context, int index) {
//               return ItemMenuEjercicios(state);
//             },
//           );