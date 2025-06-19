import 'package:applocation/domain/model/models.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';

class FavoriteFoodsUseCase {
  final Repository _repository;

  FavoriteFoodsUseCase(this._repository);

  Future<Either<Failure, PopularPlacesApiModel>> getPopularPlaces(int page,String country) {
    return _repository.getPopularPlaces(page,country);
  }

  Future<Either<Failure, TopPlacesApiModel>> getTopRatedFoods(String type,String country) {
    return _repository.getTopRatedFoods(type,country);
  }
}