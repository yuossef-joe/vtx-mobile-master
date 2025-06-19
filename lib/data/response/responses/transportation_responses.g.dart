// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transportation_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearByTransportationApiResponse _$NearByTransportationApiResponseFromJson(
        Map<String, dynamic> json) =>
    NearByTransportationApiResponse(
      (json['data'] as List<dynamic>)
          .map(
              (e) => TransportationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..status = json['status'] as String?;

Map<String, dynamic> _$NearByTransportationApiResponseToJson(
        NearByTransportationApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

TransportationResponse _$TransportationResponseFromJson(
        Map<String, dynamic> json) =>
    TransportationResponse(
      (json['id'] as num).toInt(),
      json['image'] as String,
      json['name'] as String,
      json['location'] as String,
      json['price'] as String,
      json['latitude'] as String,
      json['longitude'] as String,
      (json['category_id'] as num).toInt(),
      (json['distance'] as num).toInt(),
    );

Map<String, dynamic> _$TransportationResponseToJson(
        TransportationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'location': instance.location,
      'price': instance.price,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'category_id': instance.categoryId,
      'distance': instance.distance,
    };

TransportationCategoryNestResponse _$TransportationCategoryNestResponseFromJson(
        Map<String, dynamic> json) =>
    TransportationCategoryNestResponse(
      (json['categories'] as List<dynamic>)
          .map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransportationCategoryNestResponseToJson(
        TransportationCategoryNestResponse instance) =>
    <String, dynamic>{
      'categories': instance.data,
    };

TransportationCategoryApiResponse _$TransportationCategoryApiResponseFromJson(
        Map<String, dynamic> json) =>
    TransportationCategoryApiResponse(
      TransportationCategoryNestResponse.fromJson(
          json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$TransportationCategoryApiResponseToJson(
        TransportationCategoryApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
