
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../../data/network/requestes.dart';
import '../model/models.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';


class RegisterUseCase
    implements BaseUsecase<RegisterUseCaseInput, Register> {
  final Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, Register>> execute(
      RegisterUseCaseInput input) async {
    return await _repository.register(RegisterRequest(
        input.userName,
        input.countryMobileCode,
        input.mobileNumber,
        input.email,
        input.password));
  }
}

class RegisterUseCaseInput {
  String userName;
  String countryMobileCode;
  String mobileNumber;
  String email;
  String password;

  RegisterUseCaseInput(this.userName, this.countryMobileCode, this.mobileNumber,
      this.email, this.password);
}
