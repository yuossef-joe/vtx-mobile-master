import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:applocation/data/network/failure.dart';
import 'package:applocation/domain/repository/repository.dart';

class PlaceProfileUseCase extends BaseUsecase<int,PlaceProfileModel> {
  final Repository _repository;

  PlaceProfileUseCase(this._repository);

  @override
  Future<Either<Failure, PlaceProfileModel>> execute(int placeId) async {
    return await _repository.getPlaceProfile(placeId);
  }
}
