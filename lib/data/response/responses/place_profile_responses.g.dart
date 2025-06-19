// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_profile_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceProfileCategory _$PlaceProfileCategoryFromJson(
        Map<String, dynamic> json) =>
    PlaceProfileCategory(
      (json['id'] as num).toInt(),
      json['name'] as String,
    );

Map<String, dynamic> _$PlaceProfileCategoryToJson(
        PlaceProfileCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

PlaceProfilePlace _$PlaceProfilePlaceFromJson(Map<String, dynamic> json) =>
    PlaceProfilePlace(
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
      json['map'] as String,
      json['is_favorite'] as bool,
      PlaceProfileCategory.fromJson(json['category'] as Map<String, dynamic>),
      ReviewsResponse.fromJson(json['reviews_count'] as Map<String, dynamic>),
      json['feats'] == null
          ? null
          : FeatsResponse.fromJson(json['feats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceProfilePlaceToJson(PlaceProfilePlace instance) =>
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
      'reviews_count': instance.reviews,
      'category': instance.category,
      'feats': instance.feats,
    };

PlaceProfileImage _$PlaceProfileImageFromJson(Map<String, dynamic> json) =>
    PlaceProfileImage(
      (json['id'] as num).toInt(),
      json['image'] as String,
      (json['profile_id'] as num).toInt(),
    );

Map<String, dynamic> _$PlaceProfileImageToJson(PlaceProfileImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'profile_id': instance.profileId,
    };

PosterResponse _$PosterResponseFromJson(Map<String, dynamic> json) =>
    PosterResponse(
      (json['id'] as num).toInt(),
      json['poster'] as String,
      json['video'] as String,
      (json['profile_id'] as num).toInt(),
    );

Map<String, dynamic> _$PosterResponseToJson(PosterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poster': instance.poster,
      'video': instance.video,
      'profile_id': instance.profileId,
    };

PlaceProfile _$PlaceProfileFromJson(Map<String, dynamic> json) => PlaceProfile(
      (json['id'] as num).toInt(),
      json['about'] as String,
      json['menue'] as String,
      (json['place_id'] as num).toInt(),
      json['insta_link'] as String,
      (json['menue_imgs'] as List<dynamic>)
          .map((e) => PlaceProfileImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['images'] as List<dynamic>)
          .map((e) => PlaceProfileImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      PosterResponse.fromJson(json['poster'] as Map<String, dynamic>),
      (json['gallary'] as List<dynamic>)
          .map((e) => PlaceProfileImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      PlaceProfilePlace.fromJson(json['place'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceProfileToJson(PlaceProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'about': instance.about,
      'menue': instance.menu,
      'place_id': instance.placeId,
      'insta_link': instance.instaLink,
      'menue_imgs': instance.menuImages,
      'images': instance.images,
      'poster': instance.poster,
      'gallary': instance.gallary,
      'place': instance.place,
    };

PlaceProfileData _$PlaceProfileDataFromJson(Map<String, dynamic> json) =>
    PlaceProfileData(
      PlaceProfile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceProfileDataToJson(PlaceProfileData instance) =>
    <String, dynamic>{
      'profile': instance.profile,
    };

PlaceProfileApiResponse _$PlaceProfileApiResponseFromJson(
        Map<String, dynamic> json) =>
    PlaceProfileApiResponse(
      PlaceProfileData.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$PlaceProfileApiResponseToJson(
        PlaceProfileApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
