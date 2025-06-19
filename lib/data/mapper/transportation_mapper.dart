import 'package:applocation/app/constants.dart';
import 'package:applocation/app/extentions.dart';
import 'package:applocation/data/mapper/mapper.dart';
import 'package:applocation/domain/model/models.dart';

import '../../domain/model/transportation_models.dart';
import '../response/responses/transportation_responses.dart';

extension NearByTransportationMapper on NearByTransportationApiResponse? {
  NearByTransportationModel toDomain() {
    return NearByTransportationModel(
      (this?.data.map((tran) => tran.toDomain()) ??
          const Iterable.empty())
          .cast<Transportation>()
          .toList(),
    );
  }
}

extension TransportationMapper on TransportationResponse? {
  Transportation toDomain() {
    return Transportation(
      this?.id.orZero()??Constants.zero,
      this?.image.orEmpty() ??Constants.empty,
      this?.name.orEmpty() ??Constants.empty,
      this?.location.orEmpty() ??Constants.empty,
      this?.price.orEmpty() ??Constants.empty,
      this?.latitude.orEmpty() ??Constants.empty,
      this?.longitude.orEmpty() ??Constants.empty,
      this?.categoryId.orZero() ??Constants.zero,
      this?.distance.orZero() ??Constants.zero,

    );
  }
}


extension TransportationCategoriesMapper on TransportationCategoryApiResponse?{
  CategoryResponseModel toDomain(){
    return CategoryResponseModel(
        (this?.data.data.map((category)=>category.toDomain())??const Iterable.empty()).cast<Category>().toList()
    );
  }
}