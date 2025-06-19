// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceResponse _$PlaceResponseFromJson(Map<String, dynamic> json) =>
    PlaceResponse(
      (json['id'] as num).toInt(),
      json['location'] as String,
    );

Map<String, dynamic> _$PlaceResponseToJson(PlaceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
    };

CollectionItemResponse _$CollectionItemResponseFromJson(
        Map<String, dynamic> json) =>
    CollectionItemResponse(
      (json['id'] as num).toInt(),
      json['title'] as String,
      json['image'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      (json['place_id'] as num).toInt(),
      PlaceResponse.fromJson(json['place'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CollectionItemResponseToJson(
        CollectionItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'place_id': instance.placeId,
      'place': instance.place,
    };

CollectionsResponse _$CollectionsResponseFromJson(Map<String, dynamic> json) =>
    CollectionsResponse(
      (json['current_page'] as num).toInt(),
      (json['data'] as List<dynamic>)
          .map(
              (e) => CollectionItemResponse.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$CollectionsResponseToJson(
        CollectionsResponse instance) =>
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

CollectionsApiResponse _$CollectionsApiResponseFromJson(
        Map<String, dynamic> json) =>
    CollectionsApiResponse(
      CollectionsResponse.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$CollectionsApiResponseToJson(
        CollectionsApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

FoodItemResponse _$FoodItemResponseFromJson(Map<String, dynamic> json) =>
    FoodItemResponse(
      (json['id'] as num).toInt(),
      json['name'] as String,
      json['image'] as String,
      json['description'] as String,
      json['price'] as String,
      (json['collection_id'] as num).toInt(),
      json['created_at'] as String,
      json['updated_at'] as String,
    );

Map<String, dynamic> _$FoodItemResponseToJson(FoodItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'price': instance.price,
      'collection_id': instance.collectionId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

FoodsResponse _$FoodsResponseFromJson(Map<String, dynamic> json) =>
    FoodsResponse(
      (json['current_page'] as num).toInt(),
      (json['data'] as List<dynamic>)
          .map((e) => FoodItemResponse.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$FoodsResponseToJson(FoodsResponse instance) =>
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

FoodsApiNest _$FoodsApiNestFromJson(Map<String, dynamic> json) => FoodsApiNest(
      FoodsResponse.fromJson(json['foods'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FoodsApiNestToJson(FoodsApiNest instance) =>
    <String, dynamic>{
      'foods': instance.foods,
    };

FoodsApiResponse _$FoodsApiResponseFromJson(Map<String, dynamic> json) =>
    FoodsApiResponse(
      FoodsApiNest.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$FoodsApiResponseToJson(FoodsApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

TittledPlaceResponse _$TittledPlaceResponseFromJson(
        Map<String, dynamic> json) =>
    TittledPlaceResponse(
      (json['id'] as num).toInt(),
      json['location'] as String,
      json['title'] as String,
    );

Map<String, dynamic> _$TittledPlaceResponseToJson(
        TittledPlaceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'title': instance.title,
    };

CollectionResponse _$CollectionResponseFromJson(Map<String, dynamic> json) =>
    CollectionResponse(
      (json['id'] as num).toInt(),
      json['title'] as String,
      json['image'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      (json['place_id'] as num).toInt(),
      (json['foods'] as List<dynamic>)
          .map((e) => FoodItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      TittledPlaceResponse.fromJson(json['place'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CollectionResponseToJson(CollectionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'place_id': instance.placeId,
      'foods': instance.foods,
      'place': instance.place,
    };

CollectionDataResponse _$CollectionDataResponseFromJson(
        Map<String, dynamic> json) =>
    CollectionDataResponse(
      (json['collection'] as List<dynamic>)
          .map((e) => CollectionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionDataResponseToJson(
        CollectionDataResponse instance) =>
    <String, dynamic>{
      'collection': instance.collection,
    };

CollectionApiResponse _$CollectionApiResponseFromJson(
        Map<String, dynamic> json) =>
    CollectionApiResponse(
      CollectionDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )..status = json['status'] as String?;

Map<String, dynamic> _$CollectionApiResponseToJson(
        CollectionApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
