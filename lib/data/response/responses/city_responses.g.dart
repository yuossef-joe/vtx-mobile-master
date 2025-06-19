// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResponse _$CityResponseFromJson(Map<String, dynamic> json) => CityResponse(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
    );

Map<String, dynamic> _$CityResponseToJson(CityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

CityDataResponse _$CityDataResponseFromJson(Map<String, dynamic> json) =>
    CityDataResponse(
      (json['cyties'] as List<dynamic>)
          .map((e) => CityResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityDataResponseToJson(CityDataResponse instance) =>
    <String, dynamic>{
      'cyties': instance.cities,
    };

CityApiResponse _$CityApiResponseFromJson(Map<String, dynamic> json) =>
    CityApiResponse(
      CityDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$CityApiResponseToJson(CityApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
