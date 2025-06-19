// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'famous_place_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FamousPlaceResponse _$FamousPlaceResponseFromJson(Map<String, dynamic> json) =>
    FamousPlaceResponse(
      (json['id'] as num).toInt(),
      json['title'] as String,
      json['description'] as String,
      json['image'] as String,
      json['location'] as String,
      (json['category_id'] as num).toInt(),
      json['created_at'] as String,
      json['updated_at'] as String,
      (json['rating_id'] as num).toInt(),
      json['open'] as String,
      json['close'] as String,
      (json['discount'] as num).toInt(),
      json['price'] as String,
      json['latitude'] as String,
      json['longitude'] as String,
      json['ratings_sum_total'] as String,
      CategoryResponse.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FamousPlaceResponseToJson(
        FamousPlaceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'location': instance.location,
      'category_id': instance.categoryId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'rating_id': instance.ratingId,
      'open': instance.open,
      'close': instance.close,
      'discount': instance.discount,
      'price': instance.price,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'ratings_sum_total': instance.ratingsSumTotal,
      'category': instance.category,
    };

FamousPlaceMapResponse _$FamousPlaceMapResponseFromJson(
        Map<String, dynamic> json) =>
    FamousPlaceMapResponse(
      (json['current_page'] as num).toInt(),
      (json['data'] as List<dynamic>)
          .map((e) => FamousPlaceResponse.fromJson(e as Map<String, dynamic>))
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
      (json['to'] as num?)?.toInt(),
      (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$FamousPlaceMapResponseToJson(
        FamousPlaceMapResponse instance) =>
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

FamousPlaceNestResponse _$FamousPlaceNestResponseFromJson(
        Map<String, dynamic> json) =>
    FamousPlaceNestResponse(
      json['places'] == null
          ? null
          : FamousPlaceMapResponse.fromJson(
              json['places'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FamousPlaceNestResponseToJson(
        FamousPlaceNestResponse instance) =>
    <String, dynamic>{
      'places': instance.map,
    };

FamousPlaceApiResponse _$FamousPlaceApiResponseFromJson(
        Map<String, dynamic> json) =>
    FamousPlaceApiResponse(
      json['data'] == null
          ? null
          : FamousPlaceNestResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$FamousPlaceApiResponseToJson(
        FamousPlaceApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.map,
    };
