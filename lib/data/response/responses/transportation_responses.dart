import 'package:applocation/data/response/responses.dart';
import 'package:applocation/data/response/responses/home_responses.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transportation_responses.g.dart';

@JsonSerializable()
class NearByTransportationApiResponse extends BaseResponse{

  @JsonKey(name: 'data')
  final List<TransportationResponse> data;

  NearByTransportationApiResponse(
     this.data,);

  factory NearByTransportationApiResponse.fromJson(Map<String, dynamic> json) =>
      _$NearByTransportationApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NearByTransportationApiResponseToJson(this);
}

@JsonSerializable()
class TransportationResponse {
  final int id;

  @JsonKey(name: 'image')
  final String image;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'location')
  final String location;

  @JsonKey(name: 'price')
  final String price;

  @JsonKey(name: 'latitude')
  final String latitude;

  @JsonKey(name: 'longitude')
  final String longitude;

  @JsonKey(name: 'category_id')
  final int categoryId;

  @JsonKey(name: 'distance')
  final int distance;

  TransportationResponse(
     this.id,
     this.image,
     this.name,
     this.location,
     this.price,
     this.latitude,
     this.longitude,
     this.categoryId,
     this.distance,
  );

  factory TransportationResponse.fromJson(Map<String, dynamic> json) =>
      _$TransportationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransportationResponseToJson(this);
}


@JsonSerializable()
class TransportationCategoryNestResponse {

  @JsonKey(name: 'categories')
  final List<CategoryResponse> data;

  TransportationCategoryNestResponse(
      this.data,);

  factory TransportationCategoryNestResponse.fromJson(Map<String, dynamic> json) =>
      _$TransportationCategoryNestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransportationCategoryNestResponseToJson(this);
}


@JsonSerializable()
class TransportationCategoryApiResponse extends BaseResponse{

  @JsonKey(name: 'data')
  final TransportationCategoryNestResponse data;

  TransportationCategoryApiResponse(
     this.data,);

  factory TransportationCategoryApiResponse.fromJson(Map<String, dynamic> json) =>
      _$TransportationCategoryApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransportationCategoryApiResponseToJson(this);
}