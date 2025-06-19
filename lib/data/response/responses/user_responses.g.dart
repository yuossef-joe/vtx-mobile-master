// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['email'] as String,
      json['prefix'] as String,
      json['phone'] as String,
      json['email_verified_at'] as String,
      (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      json['avatar'] as String?,
      (json['active'] as num).toInt(),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'prefix': instance.prefix,
      'phone': instance.phone,
      'email_verified_at': instance.emailVerifiedAt,
      'roles': instance.roles,
      'avatar': instance.avatar,
      'active': instance.active,
    };

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

UserApiResponse _$UserApiResponseFromJson(Map<String, dynamic> json) =>
    UserApiResponse(
      UserDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$UserApiResponseToJson(UserApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
