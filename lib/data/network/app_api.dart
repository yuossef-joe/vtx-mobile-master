import 'package:applocation/data/response/responses.dart';
import 'package:applocation/data/response/responses/city_responses.dart';
import 'package:applocation/data/response/responses/famous_place_responses.dart';
import 'package:applocation/data/response/responses/place_profile_responses.dart';
import 'package:applocation/data/response/responses/popular_places_responses.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../../app/constants.dart';
import '../response/responses/auth_responses.dart';
import '../response/responses/booking_response.dart';
import '../response/responses/collection_responses.dart';
import '../response/responses/country_responses.dart';
import '../response/responses/home_responses.dart';
import '../response/responses/plan_responses.dart';
import '../response/responses/top_places_responses.dart';
import '../response/responses/transportation_responses.dart';
import '../response/responses/user_responses.dart';
part 'app_api.g.dart';
// TODO:: 24 response

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServicesClient {
  factory AppServicesClient(Dio dio, {String baseUrl}) = _AppServicesClient;
  @POST("/password/email")
  Future<RegisterResponse> forgotPassword(@Field("email") String email);

  @POST("/password/reset")
  Future<void> resetPassword(
      //TODO:requested body
      );

  @POST("/auth/register")
  Future<RegisterResponse> register(
      @Field("name") String userName,
      @Field("email") String email,
      @Field("password") String password,
      @Field("phone") String mobileNumber,
      @Field("prefix") String countryMobileCode);

  @POST("/auth/login")
  Future<AuthenticationResponse> login(
      @Field("email") String email, @Field("password") String password);
  @POST("/logout")
  Future<RegisterResponse> logout();

  @GET("/auth/check")
  Future<CheckAuthResponse> getCheckAuth();

  @GET("/users")
  Future<UserApiResponse> userProfile();

  @PATCH("/users")
  Future<RegisterResponse> updateProfile();

  @POST("/users")
  Future<RegisterResponse> updateAvatar(@Field("image") String image);

  @POST("/otp/verify")
  Future<RegisterResponse> verifyOtp(@Field("otp") int otp);

  @POST("/otp/resend")
  Future<RegisterResponse> resendOtp();

  @GET("/plans")
  Future<PlanApiResponse> getPlans();

  @GET("/plans/my-plan")
  Future<UserPlanApiResponse> getUserPlan();

  @POST("/plans")
  Future<RegisterResponse> pickPlan(@Field("plan_id") int planId);

  @GET("/categories")
  Future<CategoryApiResponse> categories();

  @GET("/categories/{catecoryId}")
  Future<SubCategoryApiResponse> getSubCategory(
    @Path("catecoryId") int categoryId,
  );

  @GET("/cities")
  Future<CityApiResponse> getCities();

  @GET("/places/profile/{place_id}")
  Future<PlaceProfileApiResponse> getPlaceProfile(
    @Path("place_id") int placeId,
  );

  @GET("/places/recommended")
  Future<FamousPlaceApiResponse> recommended(
      @Query("country") String country,
      );

  @GET("/places/search")
  Future<FamousPlaceApiResponse> getSearchPlaces(@Query("val") String search);

  @GET("/places/popular")
  Future<PopularPlacesApiResponse> getPopularPlaces(
    @Query("page") int page,
    @Query("country") String country,
  );

  @GET("/places/famous")
  Future<FamousPlaceApiResponse> famous(
      @Query("country") String country,
      );

  @GET("/places")
  Future<PopularPlacesApiResponse> getFilterPlaces(
    @Query("location") String location,
    @Query("date") String date,
    @Query("rated") int rate,
    @Query("type") String type,
  );

  @GET("/places/nearby")
  Future<NearbyPlaceApiResponse> getNearbyPlaces(
    @Query("lat") double lat,
    @Query("lon") double lon,
    @Query("radius") double radius,
    @Query("type") String type,
  );

  @GET("/places/view/{place_id}")
  Future<OnePlaceApiResponse> getOnePlace(
    @Path("place_id") int placeId,
  );

  @GET('/places/top/{type}')
  Future<TopPlacesApiResponse> getTopRated(
    @Path("type") String type,
    @Query("country") String country,
  );

  @GET("/places/getPlaces/{type}")
  Future<void> getPlaceRated(
    @Path("type") String type,
  );

  @POST("/book")
  Future<PlaceBookingApiResponse> confirmBooking(
      //@Field("gender") String gender,
      @Field("guests") int guests,
      @Field("time") String time,
      @Field("date") String date,
      @Field("place_id") int placeId);

  @PATCH("/book")
  Future<RegisterResponse> updateBooking(
      @Field("gender") String gender,
      @Field("guests") int guests,
      @Field("time") String time,
      @Field("date") String date,
      @Field("place_id") int placeId);

  @GET("/book/{type}")
  Future<BookingApiResponse> getUserBooking(
    @Path("type") String type,
  );

  @DELETE("/book")
  Future<RegisterResponse> cancelBooking(
    @Field("book_id") String bookId,
  );

  @POST("/rating/place")
  Future<RegisterResponse> addPlaceRating(
    @Field("place_id") int id,
    @Field("content") String content,
    @Field("type") String type,
  );

  @POST("/rating/trip")
  Future<RegisterResponse> addTripRating(
    @Field("trip_id") int id,
    @Field("content") String content,
    @Field("type") String type,
  );

  @GET("/rating")
  Future<void> getPlaceRating(
    @Query("place_id") int placeId,
  );

  @PUT("/rating")
  Future<void> updateUserRate(
    @Field("rate_id") int id,
    @Field("content") String content,
    @Field("type") String type,
  );

  @GET("/foode-collections/{collectionId}/foods")
  Future<void> getFoodsCollections(
    @Path("collectionId") int collectionId,
  );

  @GET("/foode-collections")
  Future<FoodsApiResponse> getFoodsCollection();

  @GET("/foode-collections/{collectionId}")
  Future<CollectionApiResponse> getSingleCollection(
    @Path("collectionId") int collectionId,
  );

  @POST("/fav")
  Future<RegisterResponse> toggelFavoriteItem(
    @Field("place_id") int id,
  );

  @POST("/fav/trips")
  Future<RegisterResponse> toggelFavoriteTrip(
    @Field("trip_id") int id,
  );

  @GET("/fav")
  Future<void> getUserFavorite();

  @GET("/fav/trips")
  Future<void> getUserFavoriteTrips();

  @GET("/notifications")
  Future<void> getUserNotification();

  @GET("/notifications/unRead")
  Future<void> getUserUnreadNotification();

  @GET("/trips-categories")
  Future<CategoryApiResponse> getTripsCategory();

  @POST("/trips/book")
  Future<void> bookTrip(
    @Field("trip_id") int tripId,
  );

  @GET("/trips/book/pendding")
  Future<void> getUserTrips();

  @GET("/trips")
  Future<void> getFilterTrips(
    @Query("where") String where,
    @Query("when") String when,
  );

  @GET("/trips-categories")
  Future<TransportationCategoryApiResponse> getTransportationCategories();


  @GET("/transportation")
  Future<NearByTransportationApiResponse> getNearByTransportation(
    @Query("lat") double lat,
    @Query("lon") double lon,
    @Query("radius") double radius,
  );

  @GET("/transportation/filter")
  Future<NearByTransportationApiResponse> getNearByTransportationFiltered(
      @Query("category") String category,
      @Query("lat") double lat,
      @Query("lon") double lon,
      @Query("radius") double radius,
      );


  @GET("/countries")
  Future<CountriesApiResponse> getCountries();
}
