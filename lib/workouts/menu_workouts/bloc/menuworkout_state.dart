part of 'menuworkout_bloc.dart';

abstract class MenuworkoutState extends Equatable {
  const MenuworkoutState();

  @override
  List<Object> get props => [];
}

class MenuworkoutInitial extends MenuworkoutState {}

class MenuWorkoutLoadingState extends MenuworkoutState {}

class MenuWorkoutLoadedWorkoutState extends MenuworkoutState {
  final List<List<Exercise>> workoutExercises;
  final List<String> workoutNames;

  MenuWorkoutLoadedWorkoutState({
    @required this.workoutExercises,
    @required this.workoutNames,
  });

  @override
  List<Object> get props => [
        workoutExercises,
        workoutNames,
      ];
}

class MenuWorkoutErrorState extends MenuworkoutState {
  final String errorMsg;
  MenuWorkoutErrorState({@required this.errorMsg});
   @override
  List<Object> get props => [errorMsg];
}
