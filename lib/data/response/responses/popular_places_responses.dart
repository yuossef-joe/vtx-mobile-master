import 'package:applocation/data/response/responses.dart';
import 'package:json_annotation/json_annotation.dart';

import 'search_responses.dart';

part 'popular_places_responses.g.dart';

@JsonSerializable()
class PopularPlaceResponse {
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

  PopularPlaceResponse(
    this.id,
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
  );


   

  factory PopularPlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularPlaceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularPlaceResponseToJson(this);
}

@JsonSerializable()
class PopularPlacesResponse {
  @JsonKey(name: "current_page")
  final int currentPage;

  @JsonKey(name: "data")
  final List<PopularPlaceResponse> data;

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

  PopularPlacesResponse(
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


  factory PopularPlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularPlacesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularPlacesResponseToJson(this);
}

@JsonSerializable()
class PopularPlaceNest {
  @JsonKey(name: "places")
  final PopularPlacesResponse nest;

  PopularPlaceNest(this.nest);

  factory PopularPlaceNest.fromJson(Map<String, dynamic> json) =>
      _$PopularPlaceNestFromJson(json);

  Map<String, dynamic> toJson() => _$PopularPlaceNestToJson(this);
}

@JsonSerializable()
class PopularPlacesApiResponse extends BaseResponse {
  @JsonKey(name: "data")
  final PopularPlaceNest data;

  PopularPlacesApiResponse(this.data);

  factory PopularPlacesApiResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularPlacesApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularPlacesApiResponseToJson(this);
}
