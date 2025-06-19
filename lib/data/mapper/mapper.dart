import 'package:applocation/app/constants/functions.dart';
import 'package:applocation/app/extentions.dart';
import 'package:applocation/data/response/responses.dart';
import 'package:applocation/domain/model/models.dart';

import '../../app/constants.dart';
import '../response/responses/auth_responses.dart';
import '../response/responses/booking_response.dart';
import '../response/responses/famous_place_responses.dart';
import '../response/responses/home_responses.dart';
import '../response/responses/search_responses.dart' ;


extension AuthStatusMapper on AuthStatus?{
  AuthStatusModel toDomain(){
    return AuthStatusModel(
      this?.auth?? false
    );
  }
}

extension CheckAuthResponseMapper on CheckAuthResponse?{
  CheckAuthModel toDomain(){
    return CheckAuthModel(
        this?.authStatus.toDomain()??AuthStatusModel(false),
    );
  }
}

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id.orZero() ?? Constants.zero,
      this?.name.orEmpty() ?? Constants.empty,
      this?.email.orEmpty() ?? Constants.empty,
      isValidUrl(this?.avatar) ? this?.avatar?? Constants.empty: Constants.baseUrlImages+(this?.avatar?? Constants.empty),
      this?.role.orEmpty()??Constants.empty,
      this?.verify.orFalse()??Constants.constFalse,
      this?.approval.orEmpty()??Constants.empty,
      this?.token.orEmpty() ?? Constants.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
    );
  }
}

extension RegisterMapMapper on RegisterMap? {
  RegisterMessage toDomain() {
    return RegisterMessage(
      this?.msg.orEmpty()??Constants.empty,
    );
  }
}


extension RegisterResponseMapper on RegisterResponse? {
  Register toDomain() {
    return Register(
      this?.map.toDomain(),
    );
  }
}

extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  String toDomain() {
    return this?.support.orEmpty() ?? Constants.empty;
  }
}

extension CategoryResponseMapper on CategoryResponse? {
  Category toDomain() {
    return Category(
      this?.id.orZero() ?? Constants.zero,
      this?.name.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
    );
  }
}

extension CategoryApiResponseMapper on CategoryApiResponse? {
  CategoryResponseModel toDomain() {
    return CategoryResponseModel(
        (this?.map?.categories?.map((category) => category.toDomain()) ??
            const Iterable.empty())
            .cast<Category>()
            .toList(),
    );
  }
}

extension FamousPlaceResponseMapper on FamousPlaceResponse? {
  FamousPlace toDomain() {
    return FamousPlace(
      this?.id.orZero() ?? Constants.zero,
      this?.title.orEmpty() ?? Constants.empty,
      this?.description.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
      this?.categoryId.orZero() ?? Constants.zero,
      this?.location.orEmpty() ?? Constants.empty,
      this?.ratingId.orZero() ?? Constants.zero,
      this?.open.orEmpty()?? Constants.empty,
      this?.close.orEmpty()??Constants.empty,
      this?.discount.orZero()??Constants.zero,
      this?.price.orEmpty() ??Constants.empty,
      this?.latitude.orEmpty()??Constants.empty,
      this?.longitude.orEmpty()??Constants.empty,
      this?.ratingsSumTotal.orEmpty()??Constants.empty,
      this?.category.toDomain(),
    );
  }
}

extension FamousPlaceApiResponseMapper on FamousPlaceApiResponse? {
  FamousPlaceResponseModel toDomain() {
    return FamousPlaceResponseModel(
      this?.map?.map?.currentPage.orZero() ?? Constants.zero,
        (this?.map?.map?.data.map((famous) => famous.toDomain()) ??
            const Iterable.empty())
            .cast<FamousPlace>()
            .toList(),
      this?.map?.map?.firstPageUrl.orEmpty() ?? Constants.empty,
      this?.map?.map?.from.orZero() ?? Constants.zero,
      this?.map?.map?.lastPage.orZero() ?? Constants.zero,
      this?.map?.map?.lastPageUrl.orEmpty() ?? Constants.empty,
      (this?.map?.map?.links.map((link)=>link.toDomain())??const Iterable.empty()).cast<Link>().toList(),
      this?.map?.map?.nextPageUrl.orEmpty() ?? Constants.empty,
      this?.map?.map?.path.orEmpty()?? Constants.empty,
      this?.map?.map?.perPage.orZero()??Constants.zero,
      this?.map?.map?.prevPageUrl .orEmpty()??Constants.empty,
      this?.map?.map?.to.orZero()??Constants.zero,
      this?.map?.map?.total.orZero()??Constants.zero,
    );
  }
}


extension ReviewsResponseMapper on ReviewsResponse? {
  Reviews toDomain() {
    return Reviews(
      this?.id.orZero() ?? Constants.zero,
      this?.total.orEmpty()??Constants.empty,
      this?.one.orZero() ?? Constants.zero,
      this?.two.orZero() ?? Constants.zero,
      this?.three.orZero() ?? Constants.zero,
      this?.four.orZero() ?? Constants.zero,
      this?.five.orZero() ?? Constants.zero,
      this?.placeId.orZero() ?? Constants.zero,
      this?.tripId.orZero() ??Constants.zero,
      this?.ratesCount.orZero() ?? Constants.zero,
    );
  }
}

extension NearbyPlaceMapper on NearbyPlaceApi?{
  NearByPlace toDomain(){
    return NearByPlace(
        this?.id.orZero() ?? Constants.zero,
        this?.title.orEmpty() ?? Constants.empty,
        this?.description.orEmpty() ?? Constants.empty,
        this?.image.orEmpty() ?? Constants.empty,
        this?.categoryId.orZero() ?? Constants.zero,
        this?.location.orEmpty() ?? Constants.empty,
        this?.ratingId.orZero() ?? Constants.zero,
        this?.open.orEmpty() ?? Constants.empty,
        this?.close.orEmpty() ?? Constants.empty,
        this?.discount.orZero() ?? Constants.zero,
        this?.price.orEmpty() ?? Constants.empty,
        this?.latitude.orEmpty() ?? Constants.empty,
        this?.longitude.orEmpty() ?? Constants.empty,
        this?.distance.orZero() ?? Constants.zero,
        this?.isFavorite.orFalse() ?? Constants.constFalse,
        this?.ratingsSumTotal.orEmpty() ?? Constants.empty,
        this?.category.toDomain(),
        this?.reviews.toDomain()
        );
  }
}

extension NearByPlacesApiMapper on NearByPlacesApi?{
  NearByPlaces toDomain()
  {
    List<NearByPlace> nearByPlaceList = (this
        ?.nearByPlace
        ?.map((nearByPlaces) => nearByPlaces.toDomain()) ??
        const Iterable.empty())
        .cast<NearByPlace>()
        .toList();

    return NearByPlaces(nearByPlaceList);
  }
}

extension NearbyPlaceApiResponseMapper on NearbyPlaceApiResponse?{
  NearBy toDomain()
  {
    return NearBy(this?.nearBy.toDomain());
  }
}

extension RecommendedPlaceResponseMapper on RecommendedPlaceResponse? {
  RecommendedPlace toDomain() {
    return RecommendedPlace(
      this?.id.orZero() ?? Constants.zero,
      this?.title.orEmpty() ?? Constants.empty,
      this?.description.orEmpty() ?? Constants.empty,
      this?.image.orEmpty() ?? Constants.empty,
      this?.categoryId.orZero() ?? Constants.zero,
      this?.location.orEmpty() ?? Constants.empty,
      this?.ratingId.orZero() ?? Constants.zero,
      this?.ratingsSumTotal.orEmpty() ?? Constants.empty,
    );
  }
}

extension HomeResponseMapper on HomeDataResponse? {
  HomeObject toDomain() {
    var data = HomeData(
        (this?.categories?.map?.categories?.map((categories)=>categories.toDomain())??const Iterable.empty()).cast<Category>().toList(),
        (this?.famousPlaces?.map?.map?.data.map((famous)=>famous.toDomain())??const Iterable.empty()).cast<FamousPlace>().toList(),
      (this?.recommendedPlaces?.map?.map?.data.map((recommend)=>recommend.toDomain())??const Iterable.empty()).cast<FamousPlace>().toList() );
    return HomeObject(data);
  }
}

extension BookResponseMapper on BookResponse? {
  BookModel toDomain() {
    return BookModel(
      this?.id ?? Constants.zero,
      this?.guests ?? Constants.zero,
      this?.gender ?? Constants.empty,
      this?.time ?? Constants.empty,
      this?.date ?? Constants.empty,
      this?.bookId ?? Constants.empty,
      this?.userId ?? Constants.zero,
      this?.placeId ?? Constants.zero,
      this?.createdAt ?? Constants.empty,
      this?.updatedAt ?? Constants.empty,
    );
  }
}

extension BookingListResponseMapper on BookingListResponse? {
  BookingListModel toDomain() {
    return BookingListModel(
        (this?.books.map((book) => book.toDomain()) ??
          const Iterable.empty())
        .cast<BookModel>()
        .toList()
    );
  }
}

extension BookingApiResponseMapper on BookingApiResponse? {
  BookingResponse toDomain() {
    return BookingResponse(
      this?.data.toDomain() ?? BookingListModel([]),
    );
  }
}


extension SearchResultItemResponseMapper on SearchResultItemResponse? {
  SearchResultItem toDomain() {
    return SearchResultItem(
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
    );
  }
}

extension SearchResultsResponseMapper on SearchResultsResponse? {
  SearchResults toDomain() {
    return SearchResults(
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

extension LinkResponseMapper on LinkResponse? {
  Link toDomain() {
    return Link(
      this?.url,
      this?.label ?? Constants.empty,
      this?.active ?? false,
    );
  }
}

extension SearchResponseMapper on SearchResponse? {
  Search toDomain() {
    return Search(
      this?.data.toDomain(),
    );
  }
}
