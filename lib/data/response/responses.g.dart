// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) =>
    BaseResponse()..status = json['status'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
    };

ReviewsResponse _$ReviewsResponseFromJson(Map<String, dynamic> json) =>
    ReviewsResponse(
      (json['id'] as num).toInt(),
      json['total'] as String,
      (json['one'] as num).toInt(),
      (json['two'] as num).toInt(),
      (json['three'] as num).toInt(),
      (json['four'] as num).toInt(),
      (json['five'] as num).toInt(),
      (json['place_id'] as num?)?.toInt(),
      (json['trip_id'] as num?)?.toInt(),
      (json['rates_count'] as num).toInt(),
    );

Map<String, dynamic> _$ReviewsResponseToJson(ReviewsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'one': instance.one,
      'two': instance.two,
      'three': instance.three,
      'four': instance.four,
      'five': instance.five,
      'place_id': instance.placeId,
      'trip_id': instance.tripId,
      'rates_count': instance.ratesCount,
    };

NearbyPlaceApi _$NearbyPlaceApiFromJson(Map<String, dynamic> json) =>
    NearbyPlaceApi(
      (json['id'] as num).toInt(),
      json['title'] as String,
      json['description'] as String,
      json['image'] as String,
      json['location'] as String,
      (json['category_id'] as num).toInt(),
      (json['rating_id'] as num).toInt(),
      json['open'] as String,
      json['close'] as String,
      (json['discount'] as num).toInt(),
      json['price'] as String,
      json['latitude'] as String,
      json['longitude'] as String,
      (json['distance'] as num).toInt(),
      json['is_favorite'] as bool,
      json['ratings_sum_total'] as String,
      CategoryResponse.fromJson(json['category'] as Map<String, dynamic>),
      ReviewsResponse.fromJson(json['reviews_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NearbyPlaceApiToJson(NearbyPlaceApi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'category_id': instance.categoryId,
      'location': instance.location,
      'rating_id': instance.ratingId,
      'open': instance.open,
      'close': instance.close,
      'discount': instance.discount,
      'price': instance.price,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'distance': instance.distance,
      'is_favorite': instance.isFavorite,
      'ratings_sum_total': instance.ratingsSumTotal,
      'category': instance.category,
      'reviews_count': instance.reviews,
    };

NearByPlacesApi _$NearByPlacesApiFromJson(Map<String, dynamic> json) =>
    NearByPlacesApi(
      (json['nearby'] as List<dynamic>?)
          ?.map((e) => NearbyPlaceApi.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NearByPlacesApiToJson(NearByPlacesApi instance) =>
    <String, dynamic>{
      'nearby': instance.nearByPlace,
    };

NearbyPlaceApiResponse _$NearbyPlaceApiResponseFromJson(
        Map<String, dynamic> json) =>
    NearbyPlaceApiResponse(
      NearByPlacesApi.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$NearbyPlaceApiResponseToJson(
        NearbyPlaceApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.nearBy,
    };

RecommendedPlaceMapResponse _$RecommendedPlaceMapResponseFromJson(
        Map<String, dynamic> json) =>
    RecommendedPlaceMapResponse(
      json['status'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              RecommendedPlaceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecommendedPlaceMapResponseToJson(
        RecommendedPlaceMapResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.recommendedPlaces,
    };

RecommendedPlaceNestedResponse _$RecommendedPlaceNestedResponseFromJson(
        Map<String, dynamic> json) =>
    RecommendedPlaceNestedResponse(
      json['status'] as String?,
      json['top_places'] == null
          ? null
          : RecommendedPlaceMapResponse.fromJson(
              json['top_places'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecommendedPlaceNestedResponseToJson(
        RecommendedPlaceNestedResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'top_places': instance.map,
    };

RecommendedPlaceApiResponse _$RecommendedPlaceApiResponseFromJson(
        Map<String, dynamic> json) =>
    RecommendedPlaceApiResponse(
      json['status'] as String?,
      json['data'] == null
          ? null
          : RecommendedPlaceNestedResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecommendedPlaceApiResponseToJson(
        RecommendedPlaceApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.nest,
    };
