import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../repository/repository.dart';

class PlanUseCase extends BaseUsecase<void, PlanApi>{
  final Repository _repository;

  PlanUseCase(this._repository);



  @override
  Future<Either<Failure, PlanApi>> execute(Void)async {
    return await _repository.getPlans();
  }

  Future<Either<Failure, Register>> pickPlan(int planId)async {
    return await _repository.pickPlan(planId);
  }


}
