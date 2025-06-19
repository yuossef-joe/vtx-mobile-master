import 'package:applocation/data/network/failure.dart';

import 'package:dartz/dartz.dart';

import '../model/models.dart';
import '../model/transportation_models.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class TransportationUseCase implements BaseUsecase<NearByTransportationParameters,NearByTransportationModel>{
  final Repository _repository;
  TransportationUseCase(this._repository);

  @override
  Future<Either<Failure, NearByTransportationModel>> execute(NearByTransportationParameters input) async{
    return await _repository.getNearByTransportation(input);
  }

  Future<Either<Failure, CategoryResponseModel>> getTransportationCategories() async =>await  _repository.getTransportationCategories();


  Future<Either<Failure, NearByTransportationModel>> getNearByTransportationFiltered(NearByCategoricalTransportationParameters input) async =>await  _repository.getNearByTransportationFiltered(input);

}
