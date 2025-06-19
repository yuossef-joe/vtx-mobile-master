import 'package:applocation/data/response/responses.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plan_responses.g.dart';

@JsonSerializable()
class FeatureResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "plan_id")
  final int planId;

  @JsonKey(name: "feature_name")
  final String featureName;

  @JsonKey(name: "created_at")
  final String createdAt;

  @JsonKey(name: "updated_at")
  final String updatedAt;

  FeatureResponse(
      this.id,
      this.planId,
      this.featureName,
      this.createdAt,
      this.updatedAt,
      );

  factory FeatureResponse.fromJson(Map<String, dynamic> json) =>
      _$FeatureResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureResponseToJson(this);
}

@JsonSerializable()
class PlanResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "plan_name")
  final String planName;

  @JsonKey(name: "billing_monthly")
  final String billingMonthly;

  @JsonKey(name: "billing_yearly")
  final String billingYearly;

  @JsonKey(name: "created_at")
  final String createdAt;

  @JsonKey(name: "updated_at")
  final String updatedAt;

  @JsonKey(name: "description")
  final String description;

  @JsonKey(name: "features")
  final List<FeatureResponse> features;

  PlanResponse(
      this.id,
      this.planName,
      this.billingMonthly,
      this.billingYearly,
      this.createdAt,
      this.updatedAt,
      this.description,
      this.features,
      );

  factory PlanResponse.fromJson(Map<String, dynamic> json) =>
      _$PlanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlanResponseToJson(this);
}

@JsonSerializable()
class PlanDataResponse {
  @JsonKey(name: "plans")
  final List<PlanResponse> plans;

  PlanDataResponse(this.plans);

  factory PlanDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PlanDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlanDataResponseToJson(this);
}

@JsonSerializable()
class PlanApiResponse extends BaseResponse{

  @JsonKey(name: "data")
  final PlanDataResponse data;

  PlanApiResponse( this.data);

  factory PlanApiResponse.fromJson(Map<String, dynamic> json) =>
      _$PlanApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlanApiResponseToJson(this);
}




@JsonSerializable()
class UserResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "email")
  final String email;

  UserResponse(this.id, this.name, this.email);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}


@JsonSerializable()
class UserPlanResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "user_id")
  final int userId;

  @JsonKey(name: "plan_id")
  final int planId;

  @JsonKey(name: "created_at")
  final String createdAt;

  @JsonKey(name: "updated_at")
  final String updatedAt;

  @JsonKey(name: "user")
  final UserResponse user;

  @JsonKey(name: "plan")
  final PlanResponse plan;

  UserPlanResponse(
      this.id,
      this.userId,
      this.planId,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.plan,
      );

  factory UserPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$UserPlanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserPlanResponseToJson(this);
}

@JsonSerializable()
class UserPlanDataResponse {
  @JsonKey(name: "user_plan")
  final UserPlanResponse userPlan;

  UserPlanDataResponse(this.userPlan);

  factory UserPlanDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserPlanDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserPlanDataResponseToJson(this);
}

@JsonSerializable()
class UserPlanApiResponse extends BaseResponse{

  @JsonKey(name: "data")
  final UserPlanDataResponse data;

  UserPlanApiResponse( this.data);

  factory UserPlanApiResponse.fromJson(Map<String, dynamic> json) =>
      _$UserPlanApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserPlanApiResponseToJson(this);
}
