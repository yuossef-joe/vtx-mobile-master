import 'package:applocation/domain/model/models.dart';

class PlaceProfileCategoryModel {
  final int id;
  final String name;

  PlaceProfileCategoryModel(
     this.id,
     this.name,
  );
}

class PlaceProfilePlaceModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final String location;
  final int categoryId;
  final int ratingId;
  final String open;
  final String close;
  final int discount;
  final String price;
  final String latitude;
  final String longitude;
  final String map;
  final bool isFavorite;
  final Reviews? reviews;
  final PlaceProfileCategoryModel? category;
  final Feats? feats;

  PlaceProfilePlaceModel(
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
    this.feats,
  );
}

class PlaceProfileImageModel {
  final int id;
  final String image;
  final int profileId;

  PlaceProfileImageModel(
     this.id,
     this.image,
     this.profileId,
  );
}

class PosterModel {
  final int id;
  final String poster;
  final String video;
  final int profileId;

  PosterModel(
     this.id,
     this.poster,
     this.video,
     this.profileId,
  );
}

class ProfileModel {
  final int id;
  final String about;
  final String menu;
  final int placeId;
  final String instaLink;
  final List<PlaceProfileImageModel> menuImages;
  final List<PlaceProfileImageModel> images;
  final PosterModel? poster;
  final List<PlaceProfileImageModel> gallery;
  final PlaceProfilePlaceModel? place;

  ProfileModel(
     this.id,
     this.about,
     this.menu,
     this.placeId,
     this.instaLink,
     this.menuImages,
     this.images,
     this.poster,
     this.gallery,
     this.place,
  );
}

class PlaceProfileDataModel {
  final ProfileModel? profile;

  PlaceProfileDataModel( this.profile);
}

