// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesApiResponse _$CountriesApiResponseFromJson(
        Map<String, dynamic> json) =>
    CountriesApiResponse(
      CountryDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$CountriesApiResponseToJson(
        CountriesApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

CountryDataResponse _$CountryDataResponseFromJson(Map<String, dynamic> json) =>
    CountryDataResponse(
      (json['countries'] as List<dynamic>)
          .map((e) => CountryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryDataResponseToJson(
        CountryDataResponse instance) =>
    <String, dynamic>{
      'countries': instance.countries,
    };

CountryResponse _$CountryResponseFromJson(Map<String, dynamic> json) =>
    CountryResponse(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['image'] as String,
    );

Map<String, dynamic> _$CountryResponseToJson(CountryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
