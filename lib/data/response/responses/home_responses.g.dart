// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnePlaceApiResponse _$OnePlaceApiResponseFromJson(Map<String, dynamic> json) =>
    OnePlaceApiResponse(
      OnePlaceData.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$OnePlaceApiResponseToJson(
        OnePlaceApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

OnePlaceData _$OnePlaceDataFromJson(Map<String, dynamic> json) => OnePlaceData(
      OnePlaceResponse.fromJson(json['place'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OnePlaceDataToJson(OnePlaceData instance) =>
    <String, dynamic>{
      'place': instance.place,
    };

OnePlaceResponse _$OnePlaceResponseFromJson(Map<String, dynamic> json) =>
    OnePlaceResponse(
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
      json['ratings_sum_total'] as String,
      json['map'] as String,
      SubCategoryResponse.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OnePlaceResponseToJson(OnePlaceResponse instance) =>
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
      'ratings_sum_total': instance.ratingsSumTotal,
      'map': instance.map,
      'category': instance.category,
    };

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

CategoryMap _$CategoryMapFromJson(Map<String, dynamic> json) => CategoryMap(
      (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryMapToJson(CategoryMap instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

CategoryApiResponse _$CategoryApiResponseFromJson(Map<String, dynamic> json) =>
    CategoryApiResponse(
      json['status'] as String?,
      json['data'] == null
          ? null
          : CategoryMap.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryApiResponseToJson(
        CategoryApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.map,
    };

RecommendedPlaceResponse _$RecommendedPlaceResponseFromJson(
        Map<String, dynamic> json) =>
    RecommendedPlaceResponse(
      (json['id'] as num?)?.toInt(),
      json['title'] as String?,
      json['description'] as String?,
      json['image'] as String?,
      (json['category_id'] as num?)?.toInt(),
      json['location'] as String?,
      (json['rating_id'] as num?)?.toInt(),
      json['ratings_sum_total'] as String?,
    );

Map<String, dynamic> _$RecommendedPlaceResponseToJson(
        RecommendedPlaceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'category_id': instance.categoryId,
      'location': instance.location,
      'rating_id': instance.ratingId,
      'ratings_sum_total': instance.ratingsSumTotal,
    };

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => SubCategory(
      (json['id'] as num).toInt(),
      json['name'] as String,
      (json['category_id'] as num).toInt(),
    );

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category_id': instance.categoryId,
    };

SubCategoryResponse _$SubCategoryResponseFromJson(Map<String, dynamic> json) =>
    SubCategoryResponse(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['image'] as String,
      (json['sub_categories'] as List<dynamic>)
          .map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubCategoryResponseToJson(
        SubCategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'sub_categories': instance.subCategories,
    };

SubCategoryApiResponse _$SubCategoryApiResponseFromJson(
        Map<String, dynamic> json) =>
    SubCategoryApiResponse(
      (json['data'] as List<dynamic>)
          .map((e) => SubCategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..status = json['status'] as String?;

Map<String, dynamic> _$SubCategoryApiResponseToJson(
        SubCategoryApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
