import 'package:applocation/domain/state_management/states/place_profile_states.dart';
import 'package:bloc/bloc.dart';

import 'package:applocation/domain/usecase/place_profile_usecase.dart';
import 'package:applocation/data/network/failure.dart';

class PlaceProfileCubit extends Cubit<PlaceProfileState> {
  final PlaceProfileUseCase _useCase;

  PlaceProfileCubit(this._useCase) : super(PlaceProfileInitial());

  void fetchPlaceProfile(int placeId) async {
    emit(PlaceProfileLoading());

    final result = await _useCase.execute(placeId);
    result.fold(
      (failure) => emit(PlaceProfileError(_mapFailureToMessage(failure))),
      (profile) => emit(PlaceProfileLoaded(profile)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.code;
  }
}
