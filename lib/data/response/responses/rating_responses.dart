import 'package:applocation/data/response/responses.dart';
import 'package:applocation/data/response/responses/search_responses.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_responses.g.dart';

@JsonSerializable()
class RateResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "type")
  final String type;

  @JsonKey(name: "content")
  final String content;

  @JsonKey(name: "user_id")
  final int userId;

  @JsonKey(name: "rating_id")
  final int ratingId;

  @JsonKey(name: "created_at")
  final String createdAt;

  @JsonKey(name: "updated_at")
  final String updatedAt;

  @JsonKey(name: "place_id")
  final int placeId;

  RateResponse(
      this.id,
      this.type,
      this.content,
      this.userId,
      this.ratingId,
      this.createdAt,
      this.updatedAt,
      this.placeId,
      );

  factory RateResponse.fromJson(Map<String, dynamic> json) =>
      _$RateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RateResponseToJson(this);
}

@JsonSerializable()
class RatesResponse {
  @JsonKey(name: "current_page")
  final int currentPage;

  @JsonKey(name: "data")
  final List<RateResponse> data;

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

  RatesResponse(
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

  factory RatesResponse.fromJson(Map<String, dynamic> json) =>
      _$RatesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RatesResponseToJson(this);
}

@JsonSerializable()
class RatingApiResponse extends BaseResponse{
  @JsonKey(name: "data")
  final RatesResponse data;

  RatingApiResponse( this.data);

  factory RatingApiResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RatingApiResponseToJson(this);
}



@JsonSerializable()
class RatingDetailResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "total")
  final String total;

  @JsonKey(name: "one")
  final int one;

  @JsonKey(name: "two")
  final int two;

  @JsonKey(name: "three")
  final int three;

  @JsonKey(name: "four")
  final int four;

  @JsonKey(name: "five")
  final int five;

  @JsonKey(name: "created_at")
  final String createdAt;

  @JsonKey(name: "updated_at")
  final String updatedAt;

  @JsonKey(name: "place_id")
  final int? placeId;

  @JsonKey(name: "trip_id")
  final int? tripId;

  RatingDetailResponse(
      this.id,
      this.total,
      this.one,
      this.two,
      this.three,
      this.four,
      this.five,
      this.createdAt,
      this.updatedAt,
      this.placeId,
      this.tripId,
      );

  factory RatingDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RatingDetailResponseToJson(this);
}

@JsonSerializable()
class RateDetailResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "type")
  final String type;

  @JsonKey(name: "content")
  final String content;

  @JsonKey(name: "user_id")
  final int userId;

  @JsonKey(name: "rating_id")
  final int ratingId;

  @JsonKey(name: "created_at")
  final String createdAt;

  @JsonKey(name: "updated_at")
  final String updatedAt;

  @JsonKey(name: "place_id")
  final int? placeId;

  @JsonKey(name: "trip_id")
  final int? tripId;

  @JsonKey(name: "rating")
  final RatingDetailResponse rating;

  RateDetailResponse(
      this.id,
      this.type,
      this.content,
      this.userId,
      this.ratingId,
      this.createdAt,
      this.updatedAt,
      this.placeId,
      this.tripId,
      this.rating,
      );

  factory RateDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$RateDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RateDetailResponseToJson(this);
}

@JsonSerializable()
class RateApiResponse extends BaseResponse{

  @JsonKey(name: "data")
  final RateDetailResponse data;

  RateApiResponse( this.data);

  factory RateApiResponse.fromJson(Map<String, dynamic> json) =>
      _$RateApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RateApiResponseToJson(this);
}
