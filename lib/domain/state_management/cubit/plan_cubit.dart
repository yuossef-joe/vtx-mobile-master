import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/network/failure.dart';
import '../../model/models.dart';
import '../../usecase/plan_usecase.dart';
import '../states/plan_states.dart';

class PlansCubit extends Cubit<PlanState> {
  final PlanUseCase _plansUseCase;

  PlansCubit(this._plansUseCase) : super(PlanInitial());

  void fetchPlans() async {
    emit(PlanLoading());

    final Either<Failure, PlanApi> result = await _plansUseCase.execute(Void);

    result.fold(
          (failure) => emit(PlanError(failure.code)),
          (plans) => emit(PlanLoaded(plans)),
    );
  }

  Future<void> pickPlan(int planId) async {
    emit(PlanLoading());

    final Either<Failure, Register> result = await _plansUseCase.pickPlan(planId);

    result.fold(
          (failure) => emit(PlanError(failure.code)),
          (plans) => emit(PickPlanLoaded(plans)),
    );
  }
}