import 'package:applocation/data/response/responses/home_responses.dart';
import 'package:applocation/data/response/responses/search_responses.dart';
import 'package:json_annotation/json_annotation.dart';

import '../responses.dart';
part 'famous_place_responses.g.dart';

@JsonSerializable()
class FamousPlaceResponse {
   @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "description")
  final String description;

  @JsonKey(name: "image")
  final String image;

  @JsonKey(name: "location")
  final String location;

  @JsonKey(name: "category_id")
  final int categoryId;

  @JsonKey(name: "created_at")
  final String createdAt;

  @JsonKey(name: "updated_at")
  final String updatedAt;

  @JsonKey(name: "rating_id")
  final int ratingId;

  @JsonKey(name: "open")
  final String open;

  @JsonKey(name: "close")
  final String close;

  @JsonKey(name: "discount")
  final int discount;

  @JsonKey(name: "price")
  final String price;

  @JsonKey(name: "latitude")
  final String latitude;

  @JsonKey(name: "longitude")
  final String longitude;

  @JsonKey(name: "ratings_sum_total")
  final String ratingsSumTotal;

  @JsonKey(name:"category")
  final CategoryResponse category;
        
  FamousPlaceResponse(this.id,
    this.title,
    this.description,
    this.image,
    this.location,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.ratingId,
    this.open,
    this.close,
    this.discount,
    this.price,
    this.latitude,
    this.longitude,
    this.ratingsSumTotal,
    this.category);

  // toJson
  Map<String, dynamic> toJson() => _$FamousPlaceResponseToJson(this);

//fromJson
  factory FamousPlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$FamousPlaceResponseFromJson(json);
}

@JsonSerializable()
class FamousPlaceMapResponse  {
    @JsonKey(name: "current_page")
  final int currentPage;

  @JsonKey(name: "data")
  final List<FamousPlaceResponse> data;

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
  final int? to;

  @JsonKey(name: "total")
  final int total;

  FamousPlaceMapResponse(this.currentPage,
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
    this.total,);

// toJson
  Map<String, dynamic> toJson() => _$FamousPlaceMapResponseToJson(this);

//fromJson
  factory FamousPlaceMapResponse.fromJson(Map<String, dynamic> json) =>
      _$FamousPlaceMapResponseFromJson(json);
}
@JsonSerializable()
class FamousPlaceNestResponse  {
  @JsonKey(name: "places")
  FamousPlaceMapResponse? map;

  FamousPlaceNestResponse(this.map);

// toJson
  Map<String, dynamic> toJson() => _$FamousPlaceNestResponseToJson(this);

//fromJson
  factory FamousPlaceNestResponse.fromJson(Map<String, dynamic> json) =>
      _$FamousPlaceNestResponseFromJson(json);
}

@JsonSerializable()
class FamousPlaceApiResponse extends BaseResponse {
  @JsonKey(name: "data")
  FamousPlaceNestResponse? map;

  FamousPlaceApiResponse(this.map);

// toJson
  Map<String, dynamic> toJson() => _$FamousPlaceApiResponseToJson(this);

//fromJson
  factory FamousPlaceApiResponse.fromJson(Map<String, dynamic> json) =>
      _$FamousPlaceApiResponseFromJson(json);
}
