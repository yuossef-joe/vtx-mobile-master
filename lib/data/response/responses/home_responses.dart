import 'package:json_annotation/json_annotation.dart';

import '../responses.dart';
part 'home_responses.g.dart';

@JsonSerializable()
class OnePlaceApiResponse extends BaseResponse{
  @JsonKey(name: 'data')
  OnePlaceData data;

  OnePlaceApiResponse(this.data);

  factory OnePlaceApiResponse.fromJson(Map<String, dynamic> json) =>
      _$OnePlaceApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OnePlaceApiResponseToJson(this);
}

@JsonSerializable()
class OnePlaceData {
  @JsonKey(name: 'place')
  OnePlaceResponse place;

  OnePlaceData(this.place);

  factory OnePlaceData.fromJson(Map<String, dynamic> json) =>
      _$OnePlaceDataFromJson(json);
  Map<String, dynamic> toJson() => _$OnePlaceDataToJson(this);
}

@JsonSerializable()
class OnePlaceResponse {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'location')
  String location;

  @JsonKey(name: 'category_id')
  int categoryId;


  @JsonKey(name: 'rating_id')
  int ratingId;

  @JsonKey(name: 'open')
  String open;

  @JsonKey(name: 'close')
  String close;

  @JsonKey(name: 'discount')
  int discount;

  @JsonKey(name: 'price')
  String price;

  @JsonKey(name: 'latitude')
  String latitude;

  @JsonKey(name: 'longitude')
  String longitude;

  @JsonKey(name: 'ratings_sum_total')
  String ratingsSumTotal;

  @JsonKey(name: 'map')
  String map;

  @JsonKey(name: 'category')
  SubCategoryResponse category;

  OnePlaceResponse(
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
      this.ratingsSumTotal,
      this.map,
      this.category,
      );

  factory OnePlaceResponse.fromJson(Map<String, dynamic> json) => _$OnePlaceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OnePlaceResponseToJson(this);
}




@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'image')
  String? image;

  CategoryResponse(this.id, this.name, this.image);

  // toJson
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);

//fromJson
  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}

@JsonSerializable()
class CategoryMap {
  @JsonKey(name: 'categories')
  List<CategoryResponse>? categories;

  CategoryMap(this.categories);

  // toJson
  Map<String, dynamic> toJson() => _$CategoryMapToJson(this);

//fromJson
  factory CategoryMap.fromJson(Map<String, dynamic> json) =>
      _$CategoryMapFromJson(json);
}

@JsonSerializable()
class CategoryApiResponse extends BaseResponse {
  @JsonKey(name: "data")
  CategoryMap? map;

  CategoryApiResponse(String? status, this.map);

// toJson
  Map<String, dynamic> toJson() => _$CategoryApiResponseToJson(this);

//fromJson
  factory CategoryApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryApiResponseFromJson(json);
}



//END OF CATEGORY HOME





@JsonSerializable()
class RecommendedPlaceResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'category_id')
  int? categoryId;
  @JsonKey(name: 'location')
  String? location;
  @JsonKey(name: 'rating_id')
  int? ratingId;
  @JsonKey(name: 'ratings_sum_total')
  String? ratingsSumTotal;
  RecommendedPlaceResponse(this.id, this.title,this.description, this.image,this.categoryId, this.location,this.ratingId,this.ratingsSumTotal);

  // toJson
  Map<String, dynamic> toJson() => _$RecommendedPlaceResponseToJson(this);

//fromJson
  factory RecommendedPlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendedPlaceResponseFromJson(json);
}

@JsonSerializable()
class SubCategory {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "category_id")
  int categoryId;



  SubCategory(
      this.id,
      this.name,
      this.categoryId,

      );

  factory SubCategory.fromJson(Map<String, dynamic> json) => _$SubCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);
}


@JsonSerializable()
class SubCategoryResponse {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "sub_categories")
  List<SubCategory> subCategories;

  SubCategoryResponse(
      this.id,
      this.name,
      this.image,
      this.subCategories,
      );

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) => _$SubCategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubCategoryResponseToJson(this);
}

@JsonSerializable()
class SubCategoryApiResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<SubCategoryResponse> data;

  SubCategoryApiResponse(this.data);

  factory SubCategoryApiResponse.fromJson(Map<String, dynamic> json) => _$SubCategoryApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SubCategoryApiResponseToJson(this);
}