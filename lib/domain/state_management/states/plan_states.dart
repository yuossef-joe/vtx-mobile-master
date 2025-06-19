import '../../model/models.dart';

abstract class PlanState {}

class PlanInitial extends PlanState {}

class PlanLoading extends PlanState {}

class PlanLoaded extends PlanState {
  final PlanApi plans;

  PlanLoaded(this.plans);
}

class PickPlanLoaded extends PlanState {
  final Register message;

  PickPlanLoaded(this.message);
}

class PlanError extends PlanState {
  final String message;

  PlanError(this.message);
}
