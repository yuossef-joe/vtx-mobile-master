
import 'package:applocation/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../model/models.dart';
import '../repository/repository.dart';

class HomeUseCase implements BaseUsecase<String, dynamic> {
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(input) async {
    return await _repository.getHomeData(input);
  }

  Future<Either<Failure, NearBy>> getNearBy(NearByParameters nearByParameters) async {
    return await _repository.getNearByPlaces(nearByParameters);
  }

  Future<Either<Failure, HomeDestinationData>> getDestination()async{
    return await _repository.getCountries();
  }
}
