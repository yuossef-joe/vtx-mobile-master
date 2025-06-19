import 'package:applocation/data/response/responses/home_responses.dart';
import 'package:applocation/domain/model/models.dart';

extension SubCategoryMapper on  SubCategory?{
  SubCategoryModel toDomain() {
    return SubCategoryModel(
      this?.id ?? 0,
      this?.name ?? '',
      this?.categoryId ?? 0,
    );
  }
}

extension CategorySubCategoryResponseMapper on SubCategoryResponse? {
  CategorySubCategoryModel toDomain() {
    return CategorySubCategoryModel(
      this?.id ?? 0,
      this?.name ?? '',
      this?.image ?? '',
      (this?.subCategories.map((sub)=>sub.toDomain())??const Iterable.empty()).cast<SubCategoryModel>().toList(),
    );
  }
}

extension PlaceResponseMapper on OnePlaceResponse? {
  OnePlaceModel toDomain() {
    return OnePlaceModel(
      this?.id ?? 0,
      this?.title ?? '',
      this?.description ?? '',
      this?.image ?? '',
      this?.location ?? '',
      this?.categoryId ?? 0,
      this?.ratingId ?? 0,
      this?.open ?? '',
      this?.close ?? '',
      this?.discount ?? 0,
      this?.price ?? '0.0',
      this?.latitude ?? '',
      this?.longitude ?? '',
      this?.map ?? '',
      this?.ratingsSumTotal ?? '0.0',
      this?.category.toDomain(),
    );
  }
}

extension PlaceDataResponseMapper on OnePlaceData? {
  OnePlaceNestModel toDomain() {
    return OnePlaceNestModel(this?.place.toDomain());
  }
}

extension PlaceApiResponseMapper on OnePlaceApiResponse? {
  OnePlaceResponseModel toDomain() {
    return OnePlaceResponseModel(
      this?.data.toDomain(),
    );
  }
}
