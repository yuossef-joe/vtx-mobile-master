import 'package:applocation/data/response/responses.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_responses.g.dart';

@JsonSerializable()
class CityResponse {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "created_at")
  final String createdAt;

  @JsonKey(name: "updated_at")
  final String updatedAt;

  CityResponse(
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  );

  factory CityResponse.fromJson(Map<String, dynamic> json) =>
      _$CityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityResponseToJson(this);
}

@JsonSerializable()
class CityDataResponse {
  @JsonKey(name: "cyties")
  final List<CityResponse> cities;

  CityDataResponse(this.cities);

  factory CityDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CityDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityDataResponseToJson(this);
}

@JsonSerializable()
class CityApiResponse extends BaseResponse{

  @JsonKey(name: "data")
  final CityDataResponse data;

  CityApiResponse( this.data);

  factory CityApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CityApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityApiResponseToJson(this);
}
