import 'package:applocation/app/constants.dart';

import '../../domain/model/models.dart';
import '../response/responses/plan_responses.dart';

extension FeatureResponseMapper on FeatureResponse? {
  Feature toDomain() {
    return Feature(
      this?.id ?? Constants.zero,
      this?.planId ?? Constants.zero,
      this?.featureName ?? Constants.empty,
      this?.createdAt ?? Constants.empty,
      this?.updatedAt ?? Constants.empty,
    );
  }
}

extension PlanResponseMapper on PlanResponse? {
  Plan toDomain() {
    return Plan(
      this?.id ?? Constants.zero,
      this?.planName ?? Constants.empty,
      this?.billingMonthly ?? Constants.empty,
      this?.billingYearly ?? Constants.empty,
      this?.createdAt ?? Constants.empty,
      this?.updatedAt ?? Constants.empty,
      this?.description ?? Constants.empty,
      this?.features.map((feature) => feature.toDomain()).toList() ?? [],
    );
  }
}

extension PlanDataResponseMapper on PlanDataResponse? {
  List<Plan> toDomain() {
    return this?.plans.map((plan) => plan.toDomain()).toList() ?? [];
  }
}

extension PlanApiResponseMapper on PlanApiResponse? {
  PlanApi toDomain() {
    return PlanApi(
      this?.data.toDomain(),
    );
  }
}



extension UserResponseMapper on UserResponse? {
  UserPlanCred toDomain() {
    return UserPlanCred(
      this?.id ?? Constants.zero,
      this?.name ?? '',
      this?.email ?? '',
    );
  }
}


extension UserPlanResponseMapper on UserPlanResponse? {
  UserPlan toDomain() {
    return UserPlan(
      this?.id ?? Constants.zero,
      this?.userId ?? Constants.zero,
      this?.planId ?? Constants.zero,
      this?.createdAt ?? Constants.empty,
      this?.updatedAt ?? Constants.empty,
      this?.user.toDomain(),
      this?.plan.toDomain(),
    );
  }
}

extension UserPlanApiResponseMapper on UserPlanApiResponse? {
  UserPlanApi toDomain() {
    return UserPlanApi(
      this?.data.userPlan.toDomain(),
    );
  }
}
