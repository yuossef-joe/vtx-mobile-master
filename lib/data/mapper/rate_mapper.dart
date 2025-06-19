import 'package:applocation/app/constants.dart';
import 'package:applocation/data/mapper/mapper.dart';

import '../../domain/model/models.dart';
import '../response/responses/rating_responses.dart';

extension RateResponseMapper on RateResponse? {
  Rate toDomain() {
    return Rate(
      this?.id ?? Constants.zero,
      this?.type ?? Constants.empty,
      this?.content ?? Constants.empty,
      this?.userId ?? Constants.zero,
      this?.ratingId ?? Constants.zero,
      this?.createdAt ?? Constants.empty,
      this?.updatedAt ?? Constants.empty,
      this?.placeId ?? Constants.zero,
    );
  }
}

extension RatesResponseMapper on RatesResponse? {
  Rates toDomain() {
    return Rates(
      this?.currentPage ?? Constants.zero,
      this?.data.map((rate) => rate.toDomain()).toList() ?? [],
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

extension RatingApiResponseMapper on RatingApiResponse? {
  RatingApi toDomain() {
    return RatingApi(
      this?.data.toDomain(),
    );
  }
}


extension RatingDetailResponseMapper on RatingDetailResponse? {
  RatingDetail toDomain() {
    return RatingDetail(
      this?.id ?? Constants.zero,
      this?.total ?? Constants.empty,
      this?.one ?? Constants.zero,
      this?.two ?? Constants.zero,
      this?.three ?? Constants.zero,
      this?.four ?? Constants.zero,
      this?.five ?? Constants.zero,
      this?.createdAt ?? Constants.empty,
      this?.updatedAt ?? Constants.empty,
      this?.placeId,
      this?.tripId,
    );
  }
}

extension RateDetailResponseMapper on RateDetailResponse? {
  RateDetail toDomain() {
    return RateDetail(
      this?.id ?? Constants.zero,
      this?.type ?? Constants.empty,
      this?.content ?? Constants.empty,
      this?.userId ?? Constants.zero,
      this?.ratingId ?? Constants.zero,
      this?.createdAt ?? Constants.empty,
      this?.updatedAt ?? Constants.empty,
      this?.placeId,
      this?.tripId,
      this?.rating.toDomain(),
    );
  }
}

extension RateApiResponseMapper on RateApiResponse? {
  RateApi toDomain() {
    return RateApi(
      this?.data.toDomain(),
    );
  }
}
