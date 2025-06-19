// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateResponse _$RateResponseFromJson(Map<String, dynamic> json) => RateResponse(
      (json['id'] as num).toInt(),
      json['type'] as String,
      json['content'] as String,
      (json['user_id'] as num).toInt(),
      (json['rating_id'] as num).toInt(),
      json['created_at'] as String,
      json['updated_at'] as String,
      (json['place_id'] as num).toInt(),
    );

Map<String, dynamic> _$RateResponseToJson(RateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'content': instance.content,
      'user_id': instance.userId,
      'rating_id': instance.ratingId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'place_id': instance.placeId,
    };

RatesResponse _$RatesResponseFromJson(Map<String, dynamic> json) =>
    RatesResponse(
      (json['current_page'] as num).toInt(),
      (json['data'] as List<dynamic>)
          .map((e) => RateResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['first_page_url'] as String,
      (json['from'] as num?)?.toInt(),
      (json['last_page'] as num).toInt(),
      json['last_page_url'] as String,
      (json['links'] as List<dynamic>)
          .map((e) => LinkResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['next_page_url'] as String?,
      json['path'] as String,
      (json['per_page'] as num).toInt(),
      json['prev_page_url'] as String?,
      (json['to'] as num).toInt(),
      (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$RatesResponseToJson(RatesResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'links': instance.links,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };

RatingApiResponse _$RatingApiResponseFromJson(Map<String, dynamic> json) =>
    RatingApiResponse(
      RatesResponse.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$RatingApiResponseToJson(RatingApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

RatingDetailResponse _$RatingDetailResponseFromJson(
        Map<String, dynamic> json) =>
    RatingDetailResponse(
      (json['id'] as num).toInt(),
      json['total'] as String,
      (json['one'] as num).toInt(),
      (json['two'] as num).toInt(),
      (json['three'] as num).toInt(),
      (json['four'] as num).toInt(),
      (json['five'] as num).toInt(),
      json['created_at'] as String,
      json['updated_at'] as String,
      (json['place_id'] as num?)?.toInt(),
      (json['trip_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RatingDetailResponseToJson(
        RatingDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'one': instance.one,
      'two': instance.two,
      'three': instance.three,
      'four': instance.four,
      'five': instance.five,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'place_id': instance.placeId,
      'trip_id': instance.tripId,
    };

RateDetailResponse _$RateDetailResponseFromJson(Map<String, dynamic> json) =>
    RateDetailResponse(
      (json['id'] as num).toInt(),
      json['type'] as String,
      json['content'] as String,
      (json['user_id'] as num).toInt(),
      (json['rating_id'] as num).toInt(),
      json['created_at'] as String,
      json['updated_at'] as String,
      (json['place_id'] as num?)?.toInt(),
      (json['trip_id'] as num?)?.toInt(),
      RatingDetailResponse.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RateDetailResponseToJson(RateDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'content': instance.content,
      'user_id': instance.userId,
      'rating_id': instance.ratingId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'place_id': instance.placeId,
      'trip_id': instance.tripId,
      'rating': instance.rating,
    };

RateApiResponse _$RateApiResponseFromJson(Map<String, dynamic> json) =>
    RateApiResponse(
      RateDetailResponse.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$RateApiResponseToJson(RateApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
