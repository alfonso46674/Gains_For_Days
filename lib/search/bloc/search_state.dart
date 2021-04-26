part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState{}

class SearchEmptyRequestState extends SearchState{}

//resultado de la busqueda
class SearchResultState extends SearchState{
  final List<dynamic> searchResult; // sera una lista de los ejercicios econtrados

  SearchResultState({@required this.searchResult}) : assert(searchResult != null);

  @override
  List<Object> get props => [searchResult];
}

class SearchErrorMessageState extends SearchState{
  final String errorMsg;

  SearchErrorMessageState({@required this.errorMsg});

  @override
  List<Object> get props => [];
}

