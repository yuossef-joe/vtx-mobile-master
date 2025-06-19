import 'package:applocation/domain/model/models.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../data/network/failure.dart';
import '../../model/transportation_models.dart';
import '../../usecase/transportation_usecase.dart';
import '../states/transportation_states.dart';

class TransportationCubit extends Cubit<TransportationState> {
  final TransportationUseCase _useCase;

  TransportationCubit(this._useCase) : super(TransportationInitial());
  late final CategoryResponseModel resultCategory;
  late final NearByTransportationModel resultData;
  void fetchTransportation(NearByTransportationParameters input) async {
    emit(TransportationLoading());
    final Either<Failure,CategoryResponseModel> category = await _useCase.getTransportationCategories();
    final Either<Failure,NearByTransportationModel> result = await _useCase.execute(input);
     category.fold(
          (failure) {emit(TransportationError(_mapFailureToMessage(failure,'category')));return;} ,
          (category) => resultCategory = category,
    );

     result.fold(
          (failure) {emit(TransportationError(_mapFailureToMessage(failure,'data')));return;} ,
          (data) => resultData = data,
    );
    emit(TransportationLoaded(resultData, resultCategory));
  }


  void getNearByTransportationFiltered(NearByCategoricalTransportationParameters input) async {
    emit(TransportationLoading());
    final Either<Failure,NearByTransportationModel> result = await _useCase.getNearByTransportationFiltered(input);
    result.fold(
      (failure) => emit(TransportationError(failure.code)),
      (filter) => emit(TransportationFilterLoaded(filter)),
    );
  }

  void stateEmit(TransportationState state)
  {
    emit(state);
  }


  String _mapFailureToMessage(Failure failure,String type) {
    return '${failure.code} error $type';
  }
}
