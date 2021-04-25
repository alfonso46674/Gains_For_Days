import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:proyecto_integrador/auth/bloc/auth_bloc.dart';
import 'package:proyecto_integrador/search/search_exercise.dart';
import 'package:proyecto_integrador/exercises/menu_exercises.dart';
import 'package:proyecto_integrador/login/login.dart';
import 'package:proyecto_integrador/models/exercise.dart';
import 'package:proyecto_integrador/register/register.dart';
import 'package:proyecto_integrador/restartWidget.dart';
import 'package:proyecto_integrador/workouts/add_workout.dart';
import 'package:proyecto_integrador/workouts/menu_workouts.dart';
import 'package:proyecto_integrador/splash/splash.dart';
import 'package:proyecto_integrador/utils/constants.dart';
import 'package:proyecto_integrador/welcome/welcome.dart';

import 'exercises/details_exercise.dart';
import 'exercises/list_exercises.dart';
import 'mainMenu/mainMenu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final _localStorage = await getExternalStorageDirectory();
  Hive.init(_localStorage.path);
  Hive.registerAdapter(ExerciseAdapter());
  await Hive.openBox('AppData');
  await Firebase.initializeApp();

  runApp(
    RestartWidget(
      child: BlocProvider(
        create: (context) => AuthBloc()..add(VerifyAuthenticationEvent()),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AlreadyAuthState) return MainMenu();
          if (state is UnAuthState) return Splash();
          return Splash();
        },
      ),
      // initialRoute: '/',

      routes: {
        // '/': (context) => Splash(),
        '/welcome': (context) => Welcome(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/mainMenu': (context) => MainMenu(),
        '/menuExercises': (context) => MenuExercises(),
        '/listExercises': (context) => ListExercises(),
        '/detailsExercise': (context) => DetailsExercise(),
        '/searchExercise': (context) => SearchExercise(),
        '/myWorkouts': (context) => MenuWorkouts(),
        '/addWorkout': (context) => AddWorkout(),
      },
    );
  }
}
