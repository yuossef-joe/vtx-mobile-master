
import 'package:applocation/app/extentions.dart';
import 'package:applocation/data/mapper/mapper.dart';
import 'package:applocation/data/mapper/top_places_mapper.dart';
import 'package:applocation/data/response/responses/place_profile_responses.dart';
import 'package:applocation/domain/model/models.dart';
import 'package:applocation/app/constants.dart';
import 'package:applocation/domain/model/place_profile_models.dart';

extension PlaceProfileCategoryMapper on PlaceProfileCategory? {
  PlaceProfileCategoryModel toDomain() {
    return PlaceProfileCategoryModel(
       this?.id.orZero() ?? Constants.zero,
       this?.name.orEmpty() ?? Constants.empty,
    );
  }
}

extension PlaceProfilePlaceMapper on PlaceProfilePlace? {
  PlaceProfilePlaceModel toDomain() {
    return PlaceProfilePlaceModel(
       this?.id.orZero() ?? Constants.zero,
      this?.title.orEmpty() ?? Constants.empty,
     this?.description.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
       this?.location.orEmpty() ?? Constants.empty,
       this?.categoryId.orZero() ?? Constants.zero,
       this?.ratingId.orZero() ?? Constants.zero,
       this?.open.orEmpty() ?? Constants.empty,
      this?.close.orEmpty() ?? Constants.empty,
       this?.discount.orZero() ?? Constants.zero,
       this?.price.orEmpty() ?? Constants.empty,
       this?.latitude.orEmpty() ?? Constants.empty,
      this?.longitude.orEmpty() ?? Constants.empty,
       this?.map.orEmpty() ?? Constants.empty,
       this?.isFavorite ?? false,
       this?.category.toDomain(),
       this?.reviews.toDomain(),
       this?.feats?.toDomain(),
    );
  }
}

extension PlaceProfileImageMapper on PlaceProfileImage? {
  PlaceProfileImageModel toDomain() {
    return PlaceProfileImageModel(
      this?.id.orZero() ?? Constants.zero,
      this?.image.orEmpty() ?? Constants.empty,
       this?.profileId.orZero() ?? Constants.zero,
    );
  }
}

extension PosterResponseMapper on PosterResponse? {
  PosterModel toDomain() {
    return PosterModel(
     this?.id.orZero() ?? Constants.zero,
       this?.poster.orEmpty() ?? Constants.empty,
     this?.video.orEmpty() ?? Constants.empty,
       this?.profileId.orZero() ?? Constants.zero,
    );
  }
}

extension PlaceProfileMapper on PlaceProfile? {
  ProfileModel toDomain() {
    return ProfileModel(
    this?.id.orZero() ?? Constants.zero,
       this?.about.orEmpty() ?? Constants.empty,
       this?.menu.orEmpty() ?? Constants.empty,
      this?.placeId.orZero() ?? Constants.zero,
       this?.instaLink.orEmpty() ?? Constants.empty,
       (this?.menuImages.map((img)=>img.toDomain())??const Iterable.empty()).cast<PlaceProfileImageModel>().toList(),
        (this?.images.map((img)=>img.toDomain())??const Iterable.empty()).cast<PlaceProfileImageModel>().toList(),
       this?.poster.toDomain(),
       (this?.gallary.map((img)=>img.toDomain())??const Iterable.empty()).cast<PlaceProfileImageModel>().toList(),
      this?.place.toDomain(),
    );
  }
}

extension PlaceProfileDataMapper on PlaceProfileData? {
  PlaceProfileDataModel toDomain() {
    return PlaceProfileDataModel(
     this?.profile.toDomain(),
    );
  }
}

extension PlaceProfileApiResponseMapper on PlaceProfileApiResponse? {
  PlaceProfileModel toDomain() {
    return PlaceProfileModel(
      this?.data.toDomain(),
    );
  }
}
