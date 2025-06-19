import 'package:applocation/data/network/failure.dart';
import 'package:applocation/domain/model/models.dart';
import 'package:dartz/dartz.dart';

import '../repository/repository.dart';
import 'base_usecase.dart';

class UserUseCase extends BaseUsecase<void, UserApi>{
  final Repository _repository;

  UserUseCase(this._repository);

  @override
  Future<Either<Failure, UserApi>> execute(void input) async{
    return await _repository.getUserProfile();
  }





}
