import 'package:applocation/app/extentions.dart';
import 'package:applocation/domain/model/booking_models.dart';

import '../../app/constants.dart';
import '../response/responses/booking_response.dart';

extension PlaceBookingFeatsMapper on PlaceBookingFeats? {
  PlaceBookingFeatsModel toDomain() {
    return PlaceBookingFeatsModel(
      this?.id ?? Constants.zero,
      this?.games ?? Constants.empty,
      this?.projector ?? Constants.empty,
      this?.taxes ?? Constants.empty,
      this?.placeId ?? Constants.zero,
    );
  }
}

extension PlaceBookingInfoMapper on PlaceBookingInfo? {
  PlaceBookingInfoModel toDomain() {
    return PlaceBookingInfoModel(
      this?.bookId ?? Constants.empty,
      this?.pax ?? Constants.zero,
      this?.status ?? Constants.empty,
      this?.feats.toDomain(),
    );
  }
}

extension PlaceBookingApiNestResponseMapper on PlaceBookingNest? {
  PlaceBookingNestModel toDomain() {
    return PlaceBookingNestModel(
      this?.info.toDomain(),
    this?.msg.orEmpty()??Constants.empty,
    );
  }
}

extension PlaceBookingApiResponseMapper on PlaceBookingApiResponse? {
  PlaceBookingModel toDomain() {
    return PlaceBookingModel(this?.data.toDomain());
  }
}
