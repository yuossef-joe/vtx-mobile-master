import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:applocation/data/network/failure.dart';
import 'package:applocation/domain/repository/repository.dart';

class SearchUseCase extends BaseUsecase<String, FamousPlaceResponseModel>{
  final Repository _repository;

  SearchUseCase(this._repository);


  
  @override
  Future<Either<Failure, FamousPlaceResponseModel>> execute(String input)async {
   return await _repository.getSearchResults(input);
  }


}
