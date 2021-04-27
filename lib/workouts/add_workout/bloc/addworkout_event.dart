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
