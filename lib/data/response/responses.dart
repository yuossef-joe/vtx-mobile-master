import 'package:applocation/data/response/responses/famous_place_responses.dart';
import 'package:applocation/data/response/responses/home_responses.dart';
import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  String? status;
}

//Home Category

@JsonSerializable()
class ReviewsResponse {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "total")
  String total;
  @JsonKey(name: "one")
  int one;
  @JsonKey(name: "two")
  int two;
  @JsonKey(name: "three")
  int three;
  @JsonKey(name: "four")
  int four;
  @JsonKey(name: "five")
  int five;
  @JsonKey(name: "place_id")
  int? placeId;
  @JsonKey(name:"trip_id")
  int? tripId;
  @JsonKey(name: "rates_count")
  int ratesCount;

  ReviewsResponse(this.id, this.total, this.one, this.two, this.three,
      this.four, this.five, this.placeId,this.tripId, this.ratesCount);

  Map<String, dynamic> toJson() => _$ReviewsResponseToJson(this);

  // fromJson
  factory ReviewsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewsResponseFromJson(json);
}

@JsonSerializable()
class NearbyPlaceApi {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "category_id")
  int categoryId;
  @JsonKey(name: "location")
  String location;
  @JsonKey(name: "rating_id")
  int ratingId;
  @JsonKey(name: "open")
  String open;
  @JsonKey(name: "close")
  String close;
  @JsonKey(name: "discount")
  int discount;
  @JsonKey(name: "price")
  String price;
  @JsonKey(name: "latitude")
  String latitude;
  @JsonKey(name: "longitude")
  String longitude;
  @JsonKey(name: "distance")
  int distance;
  @JsonKey(name: "is_favorite")
  bool isFavorite;
  @JsonKey(name: "ratings_sum_total")
  String ratingsSumTotal;
  @JsonKey(name: "category")
  CategoryResponse category;
  @JsonKey(name: "reviews_count")
  ReviewsResponse reviews;
  NearbyPlaceApi(
    this.id,
    this.title,
    this.description,
    this.image,
    this.location,
    this.categoryId,
    this.ratingId,
    this.open,
    this.close,
    this.discount,
    this.price,
    this.latitude,
    this.longitude,
    this.distance,
    this.isFavorite,
    this.ratingsSumTotal,
    this.category,
    this.reviews,
  );

  // toJson
  Map<String, dynamic> toJson() => _$NearbyPlaceApiToJson(this);

  // fromJson
  factory NearbyPlaceApi.fromJson(Map<String, dynamic> json) =>
      _$NearbyPlaceApiFromJson(json);
}

@JsonSerializable()
class NearByPlacesApi {
  @JsonKey(name: "nearby")
  List<NearbyPlaceApi>? nearByPlace;
  NearByPlacesApi(this.nearByPlace);

  // toJson
  Map<String, dynamic> toJson() => _$NearByPlacesApiToJson(this);

//fromJson
  factory NearByPlacesApi.fromJson(Map<String, dynamic> json) =>
      _$NearByPlacesApiFromJson(json);
}

@JsonSerializable()
class NearbyPlaceApiResponse extends BaseResponse {
  @JsonKey(name: "data")
  NearByPlacesApi nearBy;
  NearbyPlaceApiResponse(this.nearBy);

  // toJson
  Map<String, dynamic> toJson() => _$NearbyPlaceApiResponseToJson(this);

//fromJson
  factory NearbyPlaceApiResponse.fromJson(Map<String, dynamic> json) =>
      _$NearbyPlaceApiResponseFromJson(json);
}



@JsonSerializable()
class RecommendedPlaceMapResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<RecommendedPlaceResponse>? recommendedPlaces;

  RecommendedPlaceMapResponse(String? status, this.recommendedPlaces);

  // toJson
  Map<String, dynamic> toJson() => _$RecommendedPlaceMapResponseToJson(this);

//fromJson
  factory RecommendedPlaceMapResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendedPlaceMapResponseFromJson(json);
}

@JsonSerializable()
class RecommendedPlaceNestedResponse extends BaseResponse {
  @JsonKey(name: "top_places")
  RecommendedPlaceMapResponse? map;

  RecommendedPlaceNestedResponse(String? status, this.map);

  // toJson
  Map<String, dynamic> toJson() => _$RecommendedPlaceNestedResponseToJson(this);

//fromJson
  factory RecommendedPlaceNestedResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendedPlaceNestedResponseFromJson(json);
}

@JsonSerializable()
class RecommendedPlaceApiResponse extends BaseResponse {
  @JsonKey(name: "data")
  RecommendedPlaceNestedResponse? nest;

  RecommendedPlaceApiResponse(String? status, this.nest);

  // toJson
  Map<String, dynamic> toJson() => _$RecommendedPlaceApiResponseToJson(this);

//fromJson
  factory RecommendedPlaceApiResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendedPlaceApiResponseFromJson(json);
}

class HomeDataResponse extends BaseResponse {
  CategoryApiResponse? categories;

  FamousPlaceApiResponse? famousPlaces;

  FamousPlaceApiResponse? recommendedPlaces;

  HomeDataResponse(this.categories, this.famousPlaces, this.recommendedPlaces);
  //
  // List<CategoryResponse>? categories;
  //
  // List<FamousPlaceResponse>? famousPlaces;
  //
  // List<RecommendedPlaceResponse>? recommendedPlaces;
}
