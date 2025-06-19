// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_places_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularPlaceResponse _$PopularPlaceResponseFromJson(
        Map<String, dynamic> json) =>
    PopularPlaceResponse(
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
    );

Map<String, dynamic> _$PopularPlaceResponseToJson(
        PopularPlaceResponse instance) =>
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
    };

PopularPlacesResponse _$PopularPlacesResponseFromJson(
        Map<String, dynamic> json) =>
    PopularPlacesResponse(
      (json['current_page'] as num).toInt(),
      (json['data'] as List<dynamic>)
          .map((e) => PopularPlaceResponse.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$PopularPlacesResponseToJson(
        PopularPlacesResponse instance) =>
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

PopularPlaceNest _$PopularPlaceNestFromJson(Map<String, dynamic> json) =>
    PopularPlaceNest(
      PopularPlacesResponse.fromJson(json['places'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PopularPlaceNestToJson(PopularPlaceNest instance) =>
    <String, dynamic>{
      'places': instance.nest,
    };

PopularPlacesApiResponse _$PopularPlacesApiResponseFromJson(
        Map<String, dynamic> json) =>
    PopularPlacesApiResponse(
      PopularPlaceNest.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$PopularPlacesApiResponseToJson(
        PopularPlacesApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
