import 'package:applocation/data/response/responses.dart';
import 'package:applocation/data/response/responses/top_places_responses.dart';
import 'package:json_annotation/json_annotation.dart';
part 'place_profile_responses.g.dart';

@JsonSerializable()
class PlaceProfileCategory {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  PlaceProfileCategory(
    this.id,
    this.name,
  );

  factory PlaceProfileCategory.fromJson(Map<String, dynamic> json) =>
      _$PlaceProfileCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceProfileCategoryToJson(this);
}

@JsonSerializable()
class PlaceProfilePlace {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "location")
  String location;
  @JsonKey(name: "category_id")
  int categoryId;
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
  @JsonKey(name: "map")
  String map;
  @JsonKey(name: "is_favorite")
  bool isFavorite;
  @JsonKey(name: "reviews_count")
  ReviewsResponse reviews;
  @JsonKey(name: "category")
  PlaceProfileCategory category;
  @JsonKey(name: "feats")
  FeatsResponse? feats;

  PlaceProfilePlace(
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
      this.map,
      this.isFavorite,
      this.category,
      this.reviews,
      this.feats);

  factory PlaceProfilePlace.fromJson(Map<String, dynamic> json) =>
      _$PlaceProfilePlaceFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceProfilePlaceToJson(this);
}

@JsonSerializable()
class PlaceProfileImage {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "image")
  String image;

  @JsonKey(name: "profile_id")
  int profileId;

  PlaceProfileImage(
    this.id,
    this.image,
    this.profileId,
  );

  factory PlaceProfileImage.fromJson(Map<String, dynamic> json) =>
      _$PlaceProfileImageFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceProfileImageToJson(this);
}

@JsonSerializable()
class PosterResponse {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "poster")
  String poster;

  @JsonKey(name: "video")
  String video;

  @JsonKey(name: "profile_id")
  int profileId;

  PosterResponse(this.id, this.poster, this.video, this.profileId);

  factory PosterResponse.fromJson(Map<String, dynamic> json) =>
      _$PosterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PosterResponseToJson(this);
}

@JsonSerializable()
class PlaceProfile {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "about")
  String about;

  @JsonKey(name: "menue")
  String menu;

  @JsonKey(name: "place_id")
  int placeId;

  @JsonKey(name: "insta_link")
  String instaLink;

  @JsonKey(name: "menue_imgs")
  List<PlaceProfileImage> menuImages;

  @JsonKey(name: "images")
  List<PlaceProfileImage> images;

  @JsonKey(name: "poster")
  PosterResponse poster;

  @JsonKey(name: "gallary")
  List<PlaceProfileImage> gallary;

  @JsonKey(name: "place")
  PlaceProfilePlace place;
  PlaceProfile(this.id, this.about, this.menu, this.placeId, this.instaLink,
      this.menuImages, this.images, this.poster, this.gallary, this.place);

  factory PlaceProfile.fromJson(Map<String, dynamic> json) =>
      _$PlaceProfileFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceProfileToJson(this);
}

@JsonSerializable()
class PlaceProfileData {
  @JsonKey(name: "profile")
  PlaceProfile profile;

  PlaceProfileData(this.profile);

  factory PlaceProfileData.fromJson(Map<String, dynamic> json) =>
      _$PlaceProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceProfileDataToJson(this);
}

@JsonSerializable()
class PlaceProfileApiResponse extends BaseResponse {
  @JsonKey(name: "data")
  PlaceProfileData data;

  PlaceProfileApiResponse(this.data);

  factory PlaceProfileApiResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceProfileApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceProfileApiResponseToJson(this);
}
