import 'package:applocation/data/response/responses.dart';
import 'package:applocation/data/response/responses/search_responses.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_places_responses.g.dart';

@JsonSerializable()
class FeatsResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "beds")
  final int beds;

  @JsonKey(name: "bathrooms")
  final int bathrooms;

  @JsonKey(name: "cars")
  final int cars;

  @JsonKey(name: "Pets")
  final int pets;

  @JsonKey(name: "place_id")
  final int placeId;

  @JsonKey(name: "created_at")
  final String createdAt;

  @JsonKey(name: "updated_at")
  final String updatedAt;

  @JsonKey(name: "from")
  final String from;

  @JsonKey(name: "to")
  final String to;

  FeatsResponse(
      this.id,
      this.beds,
      this.bathrooms,
      this.cars,
      this.pets,
      this.placeId,
      this.createdAt,
      this.updatedAt,
      this.from,
      this.to,
      );

  factory FeatsResponse.fromJson(Map<String, dynamic> json) =>
      _$FeatsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeatsResponseToJson(this);
}

@JsonSerializable()
class TopPlaceResponse {
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

  @JsonKey(name: "map")
  final String map;

  @JsonKey(name: "is_favorite")
  final bool isFavorite;

  @JsonKey(name: "ratings_sum_total")
  final String ratingsSumTotal;

  @JsonKey(name: "feats")
  final FeatsResponse? feats;

  @JsonKey(name: "reviews_count")
  final ReviewsResponse reviewsCount;
  TopPlaceResponse(
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
      this.isFavorite,
      this.ratingsSumTotal,
      this.feats,
      this.map,
      this.reviewsCount,
      );

  factory TopPlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$TopPlaceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopPlaceResponseToJson(this);
}

@JsonSerializable()
class TopPlacesResponse {
  @JsonKey(name: "current_page")
  final int currentPage;

  @JsonKey(name: "data")
  final List<TopPlaceResponse> data;

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

  TopPlacesResponse(
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

  factory TopPlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$TopPlacesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopPlacesResponseToJson(this);
}

@JsonSerializable()
class TopPlacesNestResponse {

  @JsonKey(name: "top")
  final TopPlacesResponse nest;

  TopPlacesNestResponse( this.nest);

  factory TopPlacesNestResponse.fromJson(Map<String, dynamic> json) =>
      _$TopPlacesNestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopPlacesNestResponseToJson(this);
}


@JsonSerializable()
class TopPlacesApiResponse extends BaseResponse{

  @JsonKey(name: "data")
  final TopPlacesNestResponse data;

  TopPlacesApiResponse( this.data);

  factory TopPlacesApiResponse.fromJson(Map<String, dynamic> json) =>
      _$TopPlacesApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopPlacesApiResponseToJson(this);
}
