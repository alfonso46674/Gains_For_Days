part of 'addworkout_bloc.dart';

abstract class AddworkoutEvent extends Equatable {
  const AddworkoutEvent();

  @override
  List<Object> get props => [];
}

class AddWorkoutSearchRequestEvent extends AddworkoutEvent {
  final List<String> targetGroups;
  final List<String> equipment;

  const AddWorkoutSearchRequestEvent({this.targetGroups, this.equipment});

  @override
  List<Object> get props => [targetGroups, equipment];
}

class AddWorkoutSaveWorkoutEvent extends AddworkoutEvent {
  final List<Exercise> workoutExercises;
  final String workoutName;
  final int exerciseCount;

  const AddWorkoutSaveWorkoutEvent({
    this.workoutExercises,
    this.workoutName,
    this.exerciseCount
  });

  @override
  List<Object> get props => [workoutExercises, workoutName,exerciseCount];
}
