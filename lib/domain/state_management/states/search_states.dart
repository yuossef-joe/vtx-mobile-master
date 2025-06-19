import 'package:applocation/domain/model/models.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<FamousPlace> suggestions;

  SearchLoaded(this.suggestions);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}

