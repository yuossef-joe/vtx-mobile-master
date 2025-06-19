// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_places_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatsResponse _$FeatsResponseFromJson(Map<String, dynamic> json) =>
    FeatsResponse(
      (json['id'] as num).toInt(),
      (json['beds'] as num).toInt(),
      (json['bathrooms'] as num).toInt(),
      (json['cars'] as num).toInt(),
      (json['Pets'] as num).toInt(),
      (json['place_id'] as num).toInt(),
      json['created_at'] as String,
      json['updated_at'] as String,
      json['from'] as String,
      json['to'] as String,
    );

Map<String, dynamic> _$FeatsResponseToJson(FeatsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'beds': instance.beds,
      'bathrooms': instance.bathrooms,
      'cars': instance.cars,
      'Pets': instance.pets,
      'place_id': instance.placeId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'from': instance.from,
      'to': instance.to,
    };

TopPlaceResponse _$TopPlaceResponseFromJson(Map<String, dynamic> json) =>
    TopPlaceResponse(
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
      json['is_favorite'] as bool,
      json['ratings_sum_total'] as String,
      json['feats'] == null
          ? null
          : FeatsResponse.fromJson(json['feats'] as Map<String, dynamic>),
      json['map'] as String,
      ReviewsResponse.fromJson(json['reviews_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopPlaceResponseToJson(TopPlaceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'location': instance.location,
      'category_id': instance.categoryId,
      'rating_id': instance.ratingId,
      'open': instance.open,
      'close': instance.close,
      'discount': instance.discount,
      'price': instance.price,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'map': instance.map,
      'is_favorite': instance.isFavorite,
      'ratings_sum_total': instance.ratingsSumTotal,
      'feats': instance.feats,
      'reviews_count': instance.reviewsCount,
    };

TopPlacesResponse _$TopPlacesResponseFromJson(Map<String, dynamic> json) =>
    TopPlacesResponse(
      (json['current_page'] as num).toInt(),
      (json['data'] as List<dynamic>)
          .map((e) => TopPlaceResponse.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$TopPlacesResponseToJson(TopPlacesResponse instance) =>
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

TopPlacesNestResponse _$TopPlacesNestResponseFromJson(
        Map<String, dynamic> json) =>
    TopPlacesNestResponse(
      TopPlacesResponse.fromJson(json['top'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopPlacesNestResponseToJson(
        TopPlacesNestResponse instance) =>
    <String, dynamic>{
      'top': instance.nest,
    };

TopPlacesApiResponse _$TopPlacesApiResponseFromJson(
        Map<String, dynamic> json) =>
    TopPlacesApiResponse(
      TopPlacesNestResponse.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$TopPlacesApiResponseToJson(
        TopPlacesApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
