import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:applocation/data/network/failure.dart';
import 'package:applocation/domain/repository/repository.dart';

class PlaceFilterUseCase extends BaseUsecase<FilterPlacesParameters,PopularPlacesApiModel> {
  final Repository _repository;

  PlaceFilterUseCase(this._repository);

  @override
  Future<Either<Failure, PopularPlacesApiModel>> execute(FilterPlacesParameters input) async {
    return await _repository.getFilterPlaces(input);
  }
}
