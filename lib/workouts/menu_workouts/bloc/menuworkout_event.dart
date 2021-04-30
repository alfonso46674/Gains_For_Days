part of 'menuworkout_bloc.dart';

abstract class MenuworkoutEvent extends Equatable {
  const MenuworkoutEvent();

  @override
  List<Object> get props => [];
}

class MenuWorkoutRequestWorkouts extends MenuworkoutEvent {

  @override
  List<Object> get props => [];
}

class MenuWorkoutDeleteWorkoutEvent extends MenuworkoutEvent{
  final String workoutName;

  const MenuWorkoutDeleteWorkoutEvent({this.workoutName});
  
  @override
  List<Object> get props => [workoutName];
}
