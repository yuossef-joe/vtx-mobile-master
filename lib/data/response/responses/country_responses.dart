import 'package:applocation/data/response/responses.dart';
import 'package:json_annotation/json_annotation.dart';

import 'home_responses.dart';

part 'country_responses.g.dart';

@JsonSerializable()
class CountriesApiResponse extends BaseResponse{

  @JsonKey(name: 'data')
  final CountryDataResponse data;

  CountriesApiResponse(
     this.data,
  );

  factory CountriesApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CountriesApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesApiResponseToJson(this);
}

@JsonSerializable()
class CountryDataResponse {
  @JsonKey(name: 'countries')
  final List<CountryResponse> countries;

  CountryDataResponse(
     this.countries,
  );

  factory CountryDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDataResponseToJson(this);
}

@JsonSerializable()
class CountryResponse {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'image')
  final String image;


  CountryResponse(
    this.id,
     this.name,
     this.image,

  );

  factory CountryResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountryResponseToJson(this);
}


class HomeDestinationResponse extends BaseResponse {
  CategoryApiResponse? categories;
  CountriesApiResponse? destination;

  HomeDestinationResponse(this.categories, this.destination);
//
// List<CategoryResponse>? categories;
//
// List<FamousPlaceResponse>? famousPlaces;
//
// List<RecommendedPlaceResponse>? recommendedPlaces;
}
