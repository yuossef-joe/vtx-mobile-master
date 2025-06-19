import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/state_management/states/search_states.dart';
import 'package:bloc/bloc.dart';
import 'package:applocation/domain/usecase/search_usecase.dart';
import 'package:applocation/data/network/failure.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase _searchUseCase;

  SearchCubit(this._searchUseCase) : super(SearchInitial());

  void fetchSuggestionsAndRecentSearches(String input) async {
    emit(SearchLoading());

    final suggestionsResult = await _searchUseCase.execute(input);

    suggestionsResult.fold(
      (failure) => emit(SearchError(_mapFailureToMessage(failure))),
      (result) {
        emit(SearchLoaded(result.data));
      },
    );
  }

  void removeSuggestion(int index, List<FamousPlace> results) {
    results.removeAt(index);
    emit(SearchLoaded(List.from(results)));
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.code;
  }
}
