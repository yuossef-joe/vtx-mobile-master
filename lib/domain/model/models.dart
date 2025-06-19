// OnBoarding Models
import 'package:applocation/domain/model/countries_models.dart';
import 'package:applocation/domain/model/place_profile_models.dart';

class SliderObject {
  String title;
  String title2;
  String subtitle;

  SliderObject(this.title, this.title2, this.subtitle);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentPageIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentPageIndex);
}

class Customer {
  int id;
  String name;
  String email;
  String? avatar;
  String role;
  bool verify;
  String approval;
  String token;
  Customer(this.id, this.name, this.email,this.avatar,this.role,this.verify,this.approval, this.token);
}

class Authentication {
  Customer? customer;
  Authentication(this.customer);
}

class RegisterMessage {
  String msg;
  RegisterMessage(this.msg);
}

class Register {
  RegisterMessage? map;
  Register(this.map);
}

class Category {
  int id;
  String name;
  String image;

  Category(this.id, this.name, this.image);
}

class SubCategoryModel {
  final int id;
  final String name;
  final int categoryId;

  SubCategoryModel(
    this.id,
    this.name,
    this.categoryId,
  );
}

class CategorySubCategoryModel {
  final int id;
  final String name;
  final String image;
  final List<SubCategoryModel> subCategories;
  CategorySubCategoryModel(
      this.id, this.name, this.image, this.subCategories);
}
class PlaceProfileModel {
  final PlaceProfileDataModel? data;

  PlaceProfileModel( this.data);
}

class OnePlaceModel {
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
  final String ratingsSumTotal;
  final CategorySubCategoryModel? category;

  OnePlaceModel(
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
    this.ratingsSumTotal,
    this.category,
  );
}

class OnePlaceNestModel {
  final OnePlaceModel? nest;
  OnePlaceNestModel(this.nest);
}

class OnePlaceResponseModel {
  final OnePlaceNestModel? data;
  OnePlaceResponseModel(this.data);
}

class CategoryResponseModel {
  List<Category>? list;
  CategoryResponseModel(this.list);
}

class AbstractPlace{
}

class FamousPlace extends AbstractPlace{
  final int id;
  final String title;
  final String description;
  final String image;
  final int categoryId;
  final String location;
  final int ratingId;
  final String open;
  final String close;
  final int discount;
  final String price;
  final String latitude;
  final String longitude;
  final String ratingsSumTotal;
  final Category? category;
  FamousPlace(
      this.id,
      this.title,
      this.description,
      this.image,
      this.categoryId,
      this.location,
      this.ratingId,
      this.open,
      this.close,
      this.discount,
      this.price,
      this.latitude,
      this.longitude,
      this.ratingsSumTotal,
      this.category);
}

class FamousPlaceResponseModel {
  final int currentPage;
  final List<FamousPlace> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  FamousPlaceResponseModel(
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  );
}

class RecommendedPlace {
  int id;
  String title;
  String description;
  String image;
  int categoryId;
  String location;
  int ratingId;
  String ratingsSumTotal;

  RecommendedPlace(this.id, this.title, this.description, this.image,
      this.categoryId, this.location, this.ratingId, this.ratingsSumTotal);
}

class HomeData {
  List<Category> categories;
  List<FamousPlace> famousPlaces;
  List<FamousPlace> recommendedPlaces;

  HomeData(this.categories, this.famousPlaces, this.recommendedPlaces);
}

class HomeDestinationData{
  List<Category>? categories;
  CountriesModel? destinations;
  HomeDestinationData(this.categories,this.destinations);
}

class HomeObject {
  HomeData data;
  HomeObject(this.data);
}

class NearByParameters {
  double lat;
  double lon;
  double radius;
  String type;
  NearByParameters(this.lat, this.lon, this.radius, this.type);
}

class FilterPlacesParameters {
  String location;
  String date;
  int rate;
  String type;
  FilterPlacesParameters(this.location, this.date, this.rate, this.type);
}


class NearByTransportationParameters {
  double lat;
  double lon;
  double radius;
  NearByTransportationParameters(this.lat, this.lon, this.radius);
}

class NearByCategoricalTransportationParameters extends NearByTransportationParameters{
  String category;
  NearByCategoricalTransportationParameters(this.category,super.lat,super.lon,super.radius);
}

class Reviews {
  int id;
  String total;
  int one;
  int two;
  int three;
  int four;
  int five;
  int placeId;
  int? tripId;
  int ratesCount;

  Reviews(this.id, this.total, this.one, this.two, this.three, this.four,
      this.five, this.placeId, this.tripId, this.ratesCount);
}

class NearByPlace {
  int id;
  String title;
  String description;
  String image;
  int categoryId;
  String location;
  int ratingId;
  String open;
  String close;
  int discount;
  String price;
  String latitude;
  String longitude;
  int distance;
  bool isFavorite;
  String ratingsSumTotal;
  Category? category;
  Reviews? reviews;
  NearByPlace(
      this.id,
      this.title,
      this.description,
      this.image,
      this.categoryId,
      this.location,
      this.ratingId,
      this.open,
      this.close,
      this.discount,
      this.price,
      this.latitude,
      this.longitude,
      this.distance,
      this.isFavorite,
      this.ratingsSumTotal,
      this.category,
      this.reviews);
}

class NearByPlaces {
  List<NearByPlace> nearByPlaces;
  NearByPlaces(this.nearByPlaces);
}

class NearBy {
  NearByPlaces? nearBy;
  NearBy(this.nearBy);
}

class AuthStatusModel {
  bool auth;
  AuthStatusModel(this.auth);
}

class CheckAuthModel {
  AuthStatusModel authStatus;
  CheckAuthModel(this.authStatus);
}

class BookingInput {
  final String gender;
  final int numberOfGuests;
  final String timeSlot;
  final String bookingDate;
  final int placeId;

  BookingInput(this.gender, this.numberOfGuests, this.timeSlot,
      this.bookingDate, this.placeId);
}

class BookModel {
  int id;
  int guests;
  String gender;
  String time;
  String date;
  String bookId;
  int userId;
  int placeId;
  String createdAt;
  String updatedAt;

  BookModel(
    this.id,
    this.guests,
    this.gender,
    this.time,
    this.date,
    this.bookId,
    this.userId,
    this.placeId,
    this.createdAt,
    this.updatedAt,
  );
}

class BookingListModel {
  List<BookModel> books;

  BookingListModel(this.books);
}

class BookingResponse {
  BookingListModel data;

  BookingResponse(this.data);
}

class SearchResultItem {
  final int id;
  final String title;
  final String description;
  final String image;
  final String location;
  final int categoryId;
  final String createdAt;
  final String updatedAt;
  final int ratingId;
  final String open;
  final String close;
  final int discount;
  final String price;
  final String latitude;
  final String longitude;

  SearchResultItem(
    this.id,
    this.title,
    this.description,
    this.image,
    this.location,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.ratingId,
    this.open,
    this.close,
    this.discount,
    this.price,
    this.latitude,
    this.longitude,
  );
}

class SearchResults {
  final int currentPage;
  final List<SearchResultItem> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  SearchResults(
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  );
}

class Link {
  final String? url;
  final String label;
  final bool active;

  Link(this.url, this.label, this.active);
}

class Search {
  final SearchResults? data;

  Search(this.data);
}

class PopularPlace extends AbstractPlace{
  final int id;
  final String title;
  final String description;
  final String image;
  final String location;
  final int categoryId;
  final String createdAt;
  final String updatedAt;
  final int ratingId;
  final String open;
  final String close;
  final int discount;
  final String price;
  final String latitude;
  final String longitude;
  final String ratingsSumTotal;

  PopularPlace(
    this.id,
    this.title,
    this.description,
    this.image,
    this.location,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.ratingId,
    this.open,
    this.close,
    this.discount,
    this.price,
    this.latitude,
    this.longitude,
    this.ratingsSumTotal,
  );
}

class PopularPlaces {
  final int currentPage;
  final List<PopularPlace> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  PopularPlaces(
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  );
}

class PopularPlacesApiNest {
  final PopularPlaces? nest;

  PopularPlacesApiNest(this.nest);
}

class PopularPlacesApiModel {
  final PopularPlacesApiNest? data;

  PopularPlacesApiModel(this.data);
}

class Feats {
  final int id;
  final int beds;
  final int bathrooms;
  final int cars;
  final int pets;
  final int placeId;
  final String createdAt;
  final String updatedAt;
  final String from;
  final String to;

  Feats(
    this.id,
    this.beds,
    this.bathrooms,
    this.cars,
    this.pets,
    this.placeId,
    this.createdAt,
    this.updatedAt,
    this.from,
    this.to,
  );
}

class TopPlace extends AbstractPlace{
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
  final String ratingsSumTotal;
  final Feats? feats;
  final Reviews reviewsCount;

  TopPlace(
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
    this.ratingsSumTotal,
    this.feats,
    this.reviewsCount
  );
}

class TopPlaces {
  final int currentPage;
  final List<TopPlace> data;
  final String firstPageUrl;
  final int? from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int? to;
  final int total;

  TopPlaces(
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  );
}

class TopPlacesApiNest {
  final TopPlaces? nest;

  TopPlacesApiNest(this.nest);
}

class TopPlacesApiModel {
  final TopPlacesApiNest? data;

  TopPlacesApiModel(this.data);
}

class Rate {
  final int id;
  final String type;
  final String content;
  final int userId;
  final int ratingId;
  final String createdAt;
  final String updatedAt;
  final int placeId;

  Rate(
    this.id,
    this.type,
    this.content,
    this.userId,
    this.ratingId,
    this.createdAt,
    this.updatedAt,
    this.placeId,
  );
}

class Rates {
  final int currentPage;
  final List<Rate> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  Rates(
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  );
}

class RatingApi {
  final Rates? data;

  RatingApi(this.data);
}

class RatingDetail {
  final int id;
  final String total;
  final int one;
  final int two;
  final int three;
  final int four;
  final int five;
  final String createdAt;
  final String updatedAt;
  final int? placeId;
  final int? tripId;

  RatingDetail(
    this.id,
    this.total,
    this.one,
    this.two,
    this.three,
    this.four,
    this.five,
    this.createdAt,
    this.updatedAt,
    this.placeId,
    this.tripId,
  );
}

class RateDetail {
  final int id;
  final String type;
  final String content;
  final int userId;
  final int ratingId;
  final String createdAt;
  final String updatedAt;
  final int? placeId;
  final int? tripId;
  final RatingDetail? rating;

  RateDetail(
    this.id,
    this.type,
    this.content,
    this.userId,
    this.ratingId,
    this.createdAt,
    this.updatedAt,
    this.placeId,
    this.tripId,
    this.rating,
  );
}

class RateApi {
  final RateDetail? data;

  RateApi(this.data);
}

class Place {
  final int id;
  final String location;

  Place(this.id, this.location);
}

class CollectionItem {
  final int id;
  final String title;
  final String image;
  final String createdAt;
  final String updatedAt;
  final int placeId;
  final Place? place;

  CollectionItem(
    this.id,
    this.title,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.placeId,
    this.place,
  );
}

class Collections {
  final int currentPage;
  final List<CollectionItem> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  Collections(
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  );
}

class CollectionsApi {
  final Collections? data;

  CollectionsApi(this.data);
}

class FoodItem {
  final int id;
  final String name;
  final String image;
  final String description;
  final String price;
  final int collectionId;
  final String createdAt;
  final String updatedAt;

  FoodItem(
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
    this.collectionId,
    this.createdAt,
    this.updatedAt,
  );
}

class Foods {
  final int currentPage;
  final List<FoodItem> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<Link> links;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  Foods(
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  );
}

class FoodsApiNestModel {
  final Foods? nest;

  FoodsApiNestModel(this.nest);
}

class FoodsApi {
  final FoodsApiNestModel? data;

  FoodsApi(this.data);
}

class TittledPlace {
  final int id;
  final String location;
  final String title;

  TittledPlace(this.id, this.location, this.title);
}

class Collection {
  final int id;
  final String title;
  final String image;
  final String createdAt;
  final String updatedAt;
  final int placeId;
  final List<FoodItem> foods;
  final TittledPlace? place;

  Collection(
    this.id,
    this.title,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.placeId,
    this.foods,
    this.place,
  );
}

// class CollectionList{
//   final List<Collection> collection;
//   CollectionList(this.collection);
// }

class CollectionApi {
  final List<Collection>? collection;
  CollectionApi(this.collection);
}

class Feature {
  final int id;
  final int planId;
  final String featureName;
  final String createdAt;
  final String updatedAt;

  Feature(
    this.id,
    this.planId,
    this.featureName,
    this.createdAt,
    this.updatedAt,
  );
}

class Plan {
  final int id;
  final String planName;
  final String billingMonthly;
  final String billingYearly;
  final String createdAt;
  final String updatedAt;
  final String description;
  final List<Feature> features;

  Plan(
    this.id,
    this.planName,
    this.billingMonthly,
    this.billingYearly,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.features,
  );
}

class PlanApi {
  final List<Plan>? plans;

  PlanApi(this.plans);
}

class User {
  final int id;
  final String name;
  final String email;
  final String prefix;
  final String phone;
  final String emailVerifiedAt;
  final List<String> roles;
  final String avatar;
  final int active;

  User(
    this.id,
    this.name,
    this.email,
    this.prefix,
    this.phone,
    this.emailVerifiedAt,
    this.roles,
    this.avatar,
    this.active,
  );
}

class UserNested {
  final User? user;
  UserNested(this.user);
}

class UserApi {
  final UserNested? user;

  UserApi(this.user);
}

class UserPlanCred {
  final int id;
  final String name;
  final String email;

  UserPlanCred(this.id, this.name, this.email);
}

class UserPlan {
  final int id;
  final int userId;
  final int planId;
  final String createdAt;
  final String updatedAt;
  final UserPlanCred? user;
  final Plan? plan;

  UserPlan(
    this.id,
    this.userId,
    this.planId,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.plan,
  );
}

class UserPlanApi {
  final UserPlan? userPlan;

  UserPlanApi(this.userPlan);
}

class City {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;

  City(
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  );
}

class CityApi {
  final List<City>? cities;

  CityApi(this.cities);
}
