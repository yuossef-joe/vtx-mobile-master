import 'package:applocation/data/response/responses.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_responses.g.dart';

@JsonSerializable()
class SearchResultItemResponse {
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

  SearchResultItemResponse(
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
      );

  factory SearchResultItemResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResultItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultItemResponseToJson(this);
}

@JsonSerializable()
class SearchResultsResponse {
  @JsonKey(name: "current_page")
  final int currentPage;

  @JsonKey(name: "data")
  final List<SearchResultItemResponse> data;

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

  SearchResultsResponse(
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

  factory SearchResultsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultsResponseToJson(this);
}

@JsonSerializable()
class LinkResponse {
  @JsonKey(name: "url")
  final String? url;

  @JsonKey(name: "label")
  final String label;

  @JsonKey(name: "active")
  final bool active;

  LinkResponse(this.url, this.label, this.active);

  factory LinkResponse.fromJson(Map<String, dynamic> json) =>
      _$LinkResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LinkResponseToJson(this);
}

@JsonSerializable()
class SearchResponse extends BaseResponse{

  @JsonKey(name: "data")
  final SearchResultsResponse data;

  SearchResponse(this.data);

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
