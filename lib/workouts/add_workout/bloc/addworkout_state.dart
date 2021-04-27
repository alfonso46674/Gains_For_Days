part of 'addworkout_bloc.dart';

abstract class AddworkoutState extends Equatable {
  const AddworkoutState();
  
  @override
  List<Object> get props => [];
}

class AddworkoutInitial extends AddworkoutState {}

class AddworkoutLoadingState extends AddworkoutState{}

class AddworkoutEmptyRequestState extends AddworkoutState{}

//resultado de la busqueda
class AddworkoutResultState extends AddworkoutState{
  final List<dynamic> searchResult; // sera una lista de los ejercicios econtrados

  AddworkoutResultState({@required this.searchResult}) : assert(searchResult != null);

  @override
  List<Object> get props => [searchResult];
}

class AddworkoutErrorMessageState extends AddworkoutState{
  final String errorMsg;

  AddworkoutErrorMessageState({@required this.errorMsg});

  @override
  List<Object> get props => [];
}