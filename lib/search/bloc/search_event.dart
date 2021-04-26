part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchRequestEvent extends SearchEvent {
  final List<String> targetGroups;
  final List<String> equipment;

  const SearchRequestEvent({this.targetGroups, this.equipment});

  @override
  List<Object> get props => [targetGroups, equipment];
}
