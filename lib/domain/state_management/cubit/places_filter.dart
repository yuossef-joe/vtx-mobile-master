import 'package:applocation/domain/model/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/network/failure.dart';
import '../../usecase/place_filter_usecase.dart';
import '../states/filter_place_states.dart';

class PlaceFilterCubit extends Cubit<PlaceFilterState> {
  final PlaceFilterUseCase _useCase;

  PlaceFilterCubit(this._useCase) : super(PlaceFilterInitial());

  void getFilteredPlaces(FilterPlacesParameters query) async {
    emit(PlaceFilterLoading());

    final result = await _useCase.execute(query);
    result.fold(
          (failure) => emit(PlaceFilterError(_mapFailureToMessage(failure))),
          (filter) => emit(PlaceFilterLoaded(filter.data!.nest!.data)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.code;
  }
}
