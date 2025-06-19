import 'package:applocation/data/network/failure.dart';
import 'package:applocation/data/network/requestes.dart';
import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/repository/repository.dart';
import 'package:applocation/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUsecase <LoginUseCaseInput,Authentication>{
  final Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input) async{
  return await _repository.login(LoginRequest(input.email,input.password),input.token);
  }

  Future<Either<Failure,CheckAuthModel>> checkAuth()async{
    return await _repository.getCheckAuth();
  }

}

class LoginUseCaseInput {
  String email;
  String password;
  bool token;
  LoginUseCaseInput(this.email,this.password,this.token);
}