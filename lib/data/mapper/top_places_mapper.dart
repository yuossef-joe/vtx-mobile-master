import 'package:applocation/app/constants.dart';
import 'package:applocation/app/extentions.dart';

import '../../domain/model/models.dart';
import '../response/responses/top_places_responses.dart';
import 'package:applocation/data/mapper/mapper.dart';

extension FeatsResponseMapper on FeatsResponse? {
  Feats toDomain() {
    return Feats(
      this?.id ?? Constants.zero,
      this?.beds ?? Constants.zero,
      this?.bathrooms ?? Constants.zero,
      this?.cars ?? Constants.zero,
      this?.pets ?? Constants.zero,
      this?.placeId ?? Constants.zero,
      this?.createdAt ?? Constants.empty,
      this?.updatedAt ?? Constants.empty,
      this?.from ?? 'Constants.zero',
      this?.to ?? 'Constants.zero',
    );
  }
}

extension TopPlaceResponseMapper on TopPlaceResponse? {
  TopPlace toDomain() {
    return TopPlace(
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
      this?.longitude ?? Constants.empty,
      this?.map.orEmpty() ?? Constants.empty,
      this?.isFavorite.orFalse() ?? Constants.constFalse,
      this?.ratingsSumTotal ?? Constants.empty,
      this?.feats?.toDomain(),
      (this?.reviewsCount.toDomain())!,
    );
  }
}

extension TopPlacesResponseMapper on TopPlacesResponse? {
  TopPlaces toDomain() {
    return TopPlaces(
      this?.currentPage ?? Constants.zero,
      this?.data.map((place) => place.toDomain()).toList() ?? [],
      this?.firstPageUrl ?? Constants.empty,
      this?.from,
      this?.lastPage ?? Constants.zero,
      this?.lastPageUrl ?? Constants.empty,
      this?.links.map((link) => link.toDomain()).toList() ?? [],
      this?.nextPageUrl,
      this?.path ?? Constants.empty,
      this?.perPage ?? Constants.zero,
      this?.prevPageUrl,
      this?.to,
      this?.total ?? Constants.zero,
    );
  }
}

extension TopPlacesApiNestResponseMapper on TopPlacesNestResponse? {
  TopPlacesApiNest toDomain() {
    return TopPlacesApiNest(
      this?.nest.toDomain(),
    );
  }
}

extension TopPlacesApiResponseMapper on TopPlacesApiResponse? {
  TopPlacesApiModel toDomain() {
    return TopPlacesApiModel(
      this?.data.toDomain(),
    );
  }
}
