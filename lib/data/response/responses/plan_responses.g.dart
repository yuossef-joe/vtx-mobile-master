// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureResponse _$FeatureResponseFromJson(Map<String, dynamic> json) =>
    FeatureResponse(
      (json['id'] as num).toInt(),
      (json['plan_id'] as num).toInt(),
      json['feature_name'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
    );

Map<String, dynamic> _$FeatureResponseToJson(FeatureResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_id': instance.planId,
      'feature_name': instance.featureName,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

PlanResponse _$PlanResponseFromJson(Map<String, dynamic> json) => PlanResponse(
      (json['id'] as num).toInt(),
      json['plan_name'] as String,
      json['billing_monthly'] as String,
      json['billing_yearly'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['description'] as String,
      (json['features'] as List<dynamic>)
          .map((e) => FeatureResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlanResponseToJson(PlanResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_name': instance.planName,
      'billing_monthly': instance.billingMonthly,
      'billing_yearly': instance.billingYearly,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'description': instance.description,
      'features': instance.features,
    };

PlanDataResponse _$PlanDataResponseFromJson(Map<String, dynamic> json) =>
    PlanDataResponse(
      (json['plans'] as List<dynamic>)
          .map((e) => PlanResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlanDataResponseToJson(PlanDataResponse instance) =>
    <String, dynamic>{
      'plans': instance.plans,
    };

PlanApiResponse _$PlanApiResponseFromJson(Map<String, dynamic> json) =>
    PlanApiResponse(
      PlanDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$PlanApiResponseToJson(PlanApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };

UserPlanResponse _$UserPlanResponseFromJson(Map<String, dynamic> json) =>
    UserPlanResponse(
      (json['id'] as num).toInt(),
      (json['user_id'] as num).toInt(),
      (json['plan_id'] as num).toInt(),
      json['created_at'] as String,
      json['updated_at'] as String,
      UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      PlanResponse.fromJson(json['plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserPlanResponseToJson(UserPlanResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'plan_id': instance.planId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user': instance.user,
      'plan': instance.plan,
    };

UserPlanDataResponse _$UserPlanDataResponseFromJson(
        Map<String, dynamic> json) =>
    UserPlanDataResponse(
      UserPlanResponse.fromJson(json['user_plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserPlanDataResponseToJson(
        UserPlanDataResponse instance) =>
    <String, dynamic>{
      'user_plan': instance.userPlan,
    };

UserPlanApiResponse _$UserPlanApiResponseFromJson(Map<String, dynamic> json) =>
    UserPlanApiResponse(
      UserPlanDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$UserPlanApiResponseToJson(
        UserPlanApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
