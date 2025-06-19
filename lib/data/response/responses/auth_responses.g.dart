// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) =>
    CustomerResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['email'] as String?,
      json['avatar'] as String?,
      json['role'] as String,
      json['verified'] as bool,
      json['type'] as String,
      json['access_token'] as String?,
    );

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'role': instance.role,
      'verified': instance.verify,
      'type': instance.approval,
      'access_token': instance.token,
    };

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      json['data'] == null
          ? null
          : CustomerResponse.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.customer,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      json['data'] == null
          ? null
          : RegisterMap.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.map,
    };

RegisterMap _$RegisterMapFromJson(Map<String, dynamic> json) => RegisterMap(
      json['msg'] as String?,
    );

Map<String, dynamic> _$RegisterMapToJson(RegisterMap instance) =>
    <String, dynamic>{
      'msg': instance.msg,
    };

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgotPasswordResponse(
      json['support'] as String?,
    )..status = json['status'] as String?;

Map<String, dynamic> _$ForgotPasswordResponseToJson(
        ForgotPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'support': instance.support,
    };

AuthStatus _$AuthStatusFromJson(Map<String, dynamic> json) => AuthStatus(
      json['auth'] as bool?,
    );

Map<String, dynamic> _$AuthStatusToJson(AuthStatus instance) =>
    <String, dynamic>{
      'auth': instance.auth,
    };

CheckAuthResponse _$CheckAuthResponseFromJson(Map<String, dynamic> json) =>
    CheckAuthResponse(
      json['data'] == null
          ? null
          : AuthStatus.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$CheckAuthResponseToJson(CheckAuthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.authStatus,
    };
