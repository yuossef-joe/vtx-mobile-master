import 'package:applocation/data/mapper/mapper.dart';

import '../../app/constants.dart';
import '../../domain/model/models.dart';
import '../response/responses/popular_places_responses.dart';

extension PopularPlaceResponseMapper on PopularPlaceResponse? {
  PopularPlace toDomain() {
    return PopularPlace(
      this?.id ?? Constants.zero,
      this?.title ?? Constants.empty,
      this?.description ?? Constants.empty,
      this?.image ?? Constants.empty,
      this?.location ?? Constants.empty,
      this?.categoryId ?? Constants.zero,
      this?.createdAt ?? Constants.empty,
      this?.updatedAt ?? Constants.empty,
      this?.ratingId ?? Constants.zero,
      this?.open ?? Constants.empty,
      this?.close ?? Constants.empty,
      this?.discount ?? Constants.zero,
      this?.price ?? Constants.empty,
      this?.latitude ?? Constants.empty,
      this?.longitude ?? Constants.empty,
      this?.ratingsSumTotal ?? Constants.empty,
    );
  }
}

extension PopularPlacesResponseMapper on PopularPlacesResponse? {
  PopularPlaces toDomain() {
    return PopularPlaces(
      this?.currentPage ?? Constants.zero,
      this?.data.map((place) => place.toDomain()).toList() ?? [],
      this?.firstPageUrl ?? Constants.empty,
      this?.from ?? Constants.zero,
      this?.lastPage ?? Constants.zero,
      this?.lastPageUrl ?? Constants.empty,
      this?.links.map((link) => link.toDomain()).toList() ?? [],
      this?.nextPageUrl,
      this?.path ?? Constants.empty,
      this?.perPage ?? Constants.zero,
      this?.prevPageUrl,
      this?.to ?? Constants.zero,
      this?.total ?? Constants.zero,
    );
  }
}

extension PopularPlacesApiNestResponseMapper on PopularPlaceNest? {
  PopularPlacesApiNest toDomain() {
    return PopularPlacesApiNest(
      this?.nest.toDomain(),
    );
  }
}

extension PopularPlacesApiResponseMapper on PopularPlacesApiResponse? {
  PopularPlacesApiModel toDomain() {
    return PopularPlacesApiModel(
      this?.data.toDomain(),
    );
  }
}