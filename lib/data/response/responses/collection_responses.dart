import 'package:applocation/data/response/responses.dart';
import 'package:applocation/data/response/responses/search_responses.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_responses.g.dart';

@JsonSerializable()
class PlaceResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "location")
  final String location;

  PlaceResponse(this.id, this.location);

  factory PlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceResponseToJson(this);
}

@JsonSerializable()
class CollectionItemResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "image")
  final String image;

  @JsonKey(name: "created_at")
  final String createdAt;

  @JsonKey(name: "updated_at")
  final String updatedAt;

  @JsonKey(name: "place_id")
  final int placeId;

  @JsonKey(name: "place")
  final PlaceResponse place;

  CollectionItemResponse(
      this.id,
      this.title,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.placeId,
      this.place,
      );

  factory CollectionItemResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionItemResponseToJson(this);
}

@JsonSerializable()
class CollectionsResponse {
  @JsonKey(name: "current_page")
  final int currentPage;

  @JsonKey(name: "data")
  final List<CollectionItemResponse> data;

  @JsonKey(name: "first_page_url")
  final String firstPageUrl;

  @JsonKey(name: "from")
  final int? from;

  @JsonKey(name: "last_page")
  final int lastPage;

  @JsonKey(name: "last_page_url")
  final String lastPageUrl;

  @JsonKey(name: "links")
  final List<LinkResponse> links;

  @JsonKey(name: "next_page_url")
  final String? nextPageUrl;

  @JsonKey(name: "path")
  final String path;

  @JsonKey(name: "per_page")
  final int perPage;

  @JsonKey(name: "prev_page_url")
  final String? prevPageUrl;

  @JsonKey(name: "to")
  final int to;

  @JsonKey(name: "total")
  final int total;

  CollectionsResponse(
      this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total,
      );

  factory CollectionsResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionsResponseToJson(this);
}

@JsonSerializable()
class CollectionsApiResponse extends BaseResponse{

  @JsonKey(name: "data")
  final CollectionsResponse data;

  CollectionsApiResponse( this.data);

  factory CollectionsApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionsApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionsApiResponseToJson(this);
}


@JsonSerializable()
class FoodItemResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "image")
  final String image;

  @JsonKey(name: "description")
  final String description;

  @JsonKey(name: "price")
  final String price;

  @JsonKey(name: "collection_id")
  final int collectionId;

  @JsonKey(name: "created_at")
  final String createdAt;

  @JsonKey(name: "updated_at")
  final String updatedAt;

  FoodItemResponse(
      this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.collectionId,
      this.createdAt,
      this.updatedAt,
      );

  factory FoodItemResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FoodItemResponseToJson(this);
}

@JsonSerializable()
class FoodsResponse {
  @JsonKey(name: "current_page")
  final int currentPage;

  @JsonKey(name: "data")
  final List<FoodItemResponse> data;

  @JsonKey(name: "first_page_url")
  final String firstPageUrl;

  @JsonKey(name: "from")
  final int? from;

  @JsonKey(name: "last_page")
  final int lastPage;

  @JsonKey(name: "last_page_url")
  final String lastPageUrl;

  @JsonKey(name: "links")
  final List<LinkResponse> links;

  @JsonKey(name: "next_page_url")
  final String? nextPageUrl;

  @JsonKey(name: "path")
  final String path;

  @JsonKey(name: "per_page")
  final int perPage;

  @JsonKey(name: "prev_page_url")
  final String? prevPageUrl;

  @JsonKey(name: "to")
  final int to;

  @JsonKey(name: "total")
  final int total;

  FoodsResponse(
      this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total,
      );

  factory FoodsResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FoodsResponseToJson(this);
}

@JsonSerializable()
class FoodsApiNest{

  @JsonKey(name: "foods")
  final FoodsResponse foods;

  FoodsApiNest( this.foods);

  factory FoodsApiNest.fromJson(Map<String, dynamic> json) =>
      _$FoodsApiNestFromJson(json);

  Map<String, dynamic> toJson() => _$FoodsApiNestToJson(this);
}


@JsonSerializable()
class FoodsApiResponse extends BaseResponse{

  @JsonKey(name: "data")
  final FoodsApiNest data;

  FoodsApiResponse( this.data);

  factory FoodsApiResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodsApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FoodsApiResponseToJson(this);
}


@JsonSerializable()
class TittledPlaceResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "location")
  final String location;

  @JsonKey(name: "title")
  final String title;

  TittledPlaceResponse(this.id, this.location, this.title);

  factory TittledPlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$TittledPlaceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TittledPlaceResponseToJson(this);
}



@JsonSerializable()
class CollectionResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "image")
  final String image;

  @JsonKey(name: "created_at")
  final String createdAt;

  @JsonKey(name: "updated_at")
  final String updatedAt;

  @JsonKey(name: "place_id")
  final int placeId;

  @JsonKey(name: "foods")
  final List<FoodItemResponse> foods;

  @JsonKey(name: "place")
  final TittledPlaceResponse place;

  CollectionResponse(
      this.id,
      this.title,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.placeId,
      this.foods,
      this.place,
      );

  factory CollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionResponseToJson(this);
}

@JsonSerializable()
class CollectionDataResponse {
  @JsonKey(name: "collection")
  final List<CollectionResponse> collection;

  CollectionDataResponse(this.collection);

  factory CollectionDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionDataResponseToJson(this);
}

@JsonSerializable()
class CollectionApiResponse extends BaseResponse {


  @JsonKey(name: "data")
  final CollectionDataResponse data;

  CollectionApiResponse(this.data);

  factory CollectionApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CollectionApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionApiResponseToJson(this);
}
