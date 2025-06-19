import 'package:applocation/app/constants.dart';
import 'package:applocation/data/mapper/mapper.dart';

import '../../domain/model/models.dart';
import '../response/responses/collection_responses.dart';

extension PlaceResponseMapper on PlaceResponse? {
  Place toDomain() {
    return Place(
      this?.id ?? Constants.zero,
      this?.location ?? Constants.empty,
    );
  }
}

extension CollectionItemResponseMapper on CollectionItemResponse? {
  CollectionItem toDomain() {
    return CollectionItem(
      this?.id ?? Constants.zero,
      this?.title ?? Constants.empty,
      this?.image ?? Constants.empty,
      this?.createdAt ?? Constants.empty,
      this?.updatedAt ?? Constants.empty,
      this?.placeId ?? Constants.zero,
      this?.place.toDomain(),
    );
  }
}

extension CollectionsResponseMapper on CollectionsResponse? {
  Collections toDomain() {
    return Collections(
      this?.currentPage ?? Constants.zero,
      this?.data.map((item) => item.toDomain()).toList() ?? [],
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

extension CollectionsApiResponseMapper on CollectionsApiResponse? {
  CollectionsApi toDomain() {
    return CollectionsApi(
      this?.data.toDomain(),
    );
  }
}

extension FoodItemResponseMapper on FoodItemResponse? {
  FoodItem toDomain() {
    return FoodItem(
      this?.id ?? Constants.zero,
      this?.name ?? Constants.empty,
      this?.image ?? Constants.empty,
      this?.description ?? Constants.empty,
      this?.price ?? Constants.empty,
      this?.collectionId ?? Constants.zero,
      this?.createdAt ?? Constants.empty,
      this?.updatedAt ?? Constants.empty,
    );
  }
}

extension FoodsResponseMapper on FoodsResponse? {
  Foods toDomain() {
    return Foods(
      this?.currentPage ?? Constants.zero,
      this?.data.map((item) => item.toDomain()).toList() ?? [],
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

extension FoodsApiNestMapper on FoodsApiNest? {
  FoodsApiNestModel toDomain() {
    return FoodsApiNestModel(
      this?.foods.toDomain(),
    );
  }
}

extension FoodsApiResponseMapper on FoodsApiResponse? {
  FoodsApi toDomain() {
    return FoodsApi(
      this?.data.toDomain(),
    );
  }
}

extension TittledPlaceResponseMapper on TittledPlaceResponse? {
  TittledPlace toDomain() {
    return TittledPlace(
      this?.id ?? Constants.zero,
      this?.location ?? Constants.empty,
      this?.title ?? Constants.empty,
    );
  }
}

extension CollectionResponseMapper on CollectionResponse? {
  Collection toDomain() {
    return Collection(
      this?.id ?? Constants.zero,
      this?.title ?? Constants.empty,
      this?.image ?? Constants.empty,
      this?.createdAt ?? Constants.empty,
      this?.updatedAt ?? Constants.empty,
      this?.placeId ?? Constants.zero,
      this?.foods.map((food) => food.toDomain()).toList() ?? [],
      this?.place.toDomain(),
    );
  }
}

extension CollectionDataResponseMapper on CollectionDataResponse? {
  List<Collection> toDomain() {
    return this
            ?.collection
            .map((collection) => collection.toDomain())
            .toList() ??
        [];
  }
}

extension CollectionApiResponseMapper on CollectionApiResponse? {
  CollectionApi toDomain() {
    return CollectionApi(
      this?.data.toDomain(),
    );
  }
}
