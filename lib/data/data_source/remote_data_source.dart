import 'package:applocation/data/network/app_api.dart';
import 'package:applocation/data/network/requestes.dart';
import 'package:applocation/data/response/responses.dart';
import 'package:applocation/data/response/responses/country_responses.dart';
import 'package:applocation/data/response/responses/famous_place_responses.dart';
import 'package:applocation/data/response/responses/place_profile_responses.dart';
import 'package:applocation/data/response/responses/plan_responses.dart';
import 'package:applocation/data/response/responses/popular_places_responses.dart';
import 'package:applocation/data/response/responses/top_places_responses.dart';
import 'package:applocation/domain/model/models.dart';

import '../response/responses/auth_responses.dart';
import '../response/responses/booking_response.dart';
import '../response/responses/home_responses.dart';
import '../response/responses/transportation_responses.dart';
import '../response/responses/user_responses.dart';

abstract class RemoteDataSource {
  Future<UserApiResponse> getUserProfile();

  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<RegisterResponse> register(RegisterRequest registerRequest);

  Future<RegisterResponse> forgotPassword(String email);

  Future<RegisterResponse> pickPlans(int planId);

  Future<CategoryApiResponse> getCategories();

  // Future<FamousPlaceApiResponse> getFamousPlaces();
  //
  // Future<FamousPlaceApiResponse> getRecommendedPlaces();

  Future<PlanApiResponse> getPlans();

  Future<HomeDataResponse> getHomeData(String destination);

  Future<PlaceProfileApiResponse> getPlaceProfile(int id);

  Future<FamousPlaceApiResponse> getSearchResults(String input);

  Future<OnePlaceApiResponse> getOnePlace(int id);

  Future<HomeDestinationResponse> getCountries();

  Future<NearbyPlaceApiResponse> getNearByPlaces(
      NearByParameters nearByParameters);

  Future<NearByTransportationApiResponse> getNearByTransportation(
      NearByTransportationParameters nearByParameters);
  Future<CheckAuthResponse> getCheckAuth();

  Future<RegisterResponse> updateBooking(BookingInput input);

  Future<RegisterResponse> cancelBooking(String bookId);

  Future<PlaceBookingApiResponse> confirmBooking(BookingInput input);

  Future<BookingApiResponse> getUserBooking(String type);

  Future<PopularPlacesApiResponse> getPopularPlaces(int page, String country);

  Future<PopularPlacesApiResponse> getFilterPlaces(FilterPlacesParameters query);

  Future<TopPlacesApiResponse> getTopRatedFoods(String type, String country);

  Future<TransportationCategoryApiResponse> getTransportationCategories();

  Future<NearByTransportationApiResponse> getNearByTransportationFiltered(NearByCategoricalTransportationParameters nearByParameters);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServicesClient _appServicesClient;
  RemoteDataSourceImpl(this._appServicesClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    print('awaiting login');
    return await _appServicesClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<RegisterResponse> forgotPassword(String email) async {
    return await _appServicesClient.forgotPassword(email);
  }

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    return await _appServicesClient.register(
        registerRequest.userName,
        registerRequest.countryMobileCode,
        registerRequest.mobileNumber,
        registerRequest.email,
        registerRequest.password);
  }

  @override
  Future<CategoryApiResponse> getCategories() async {
    return await _appServicesClient.categories();
  }

  // @override
  // Future<FamousPlaceApiResponse> getFamousPlaces() async {
  //   return await _appServicesClient.famous();
  // }
  //
  // @override
  // Future<FamousPlaceApiResponse> getRecommendedPlaces() async {
  //   return await _appServicesClient.recommended();
  // }

  @override
  Future<HomeDataResponse> getHomeData(String destination) async {
    late final CategoryApiResponse category;
    late final FamousPlaceApiResponse recommended;
    late final FamousPlaceApiResponse famous;
    try {
      category = await _appServicesClient.categories();
    } catch (e) {
      print('Error fetching categories: $e');
    }
    try {
      recommended = await _appServicesClient.recommended(destination);
    } catch (e) {
      print('Error fetching categories: $e');
    }

    try {
      famous = await _appServicesClient.famous(destination);
    } catch (e) {
      print('Error fetching categories: $e');
    }

    HomeDataResponse res = HomeDataResponse(category, famous, recommended);
    res.status = "success";
    return res;
    //return HomeResponse(data);
  }

  @override
  Future<NearbyPlaceApiResponse> getNearByPlaces(
      NearByParameters nearByParameters) async {
    return await _appServicesClient.getNearbyPlaces(nearByParameters.lat,
        nearByParameters.lon, nearByParameters.radius, nearByParameters.type);
  }

  @override
  Future<CheckAuthResponse> getCheckAuth() async {
    return await _appServicesClient.getCheckAuth();
  }

  @override
  Future<RegisterResponse> cancelBooking(String bookId) async {
    return await _appServicesClient.cancelBooking(bookId);
  }

  @override
  Future<PlaceBookingApiResponse> confirmBooking(BookingInput input) async {
    return await _appServicesClient.confirmBooking(
        input.numberOfGuests, input.timeSlot, input.bookingDate, input.placeId);
  }

  @override
  Future<BookingApiResponse> getUserBooking(String type) async {
    return await _appServicesClient.getUserBooking(type);
  }

  @override
  Future<RegisterResponse> updateBooking(BookingInput input) async {
    return await _appServicesClient.updateBooking(input.gender,
        input.numberOfGuests, input.timeSlot, input.bookingDate, input.placeId);
  }

  @override
  Future<OnePlaceApiResponse> getOnePlace(int id) async {
    return await _appServicesClient.getOnePlace(id);
  }

  @override
  Future<FamousPlaceApiResponse> getSearchResults(String input) async {
    return await _appServicesClient.getSearchPlaces(input);
  }

  @override
  Future<PlaceProfileApiResponse> getPlaceProfile(int id) async {
    try {
      print('Making API call with place ID: $id');
      final response = await _appServicesClient.getPlaceProfile(id);

      // Print the response status and data for debugging
      print('API Response Status: ${response.status}');
      print('API Response Data: ${response.data}');

      return response;
    } catch (e) {
      print('Error during API call: $e');
      throw Exception('Failed to fetch place profile');
    }
  }

  @override
  Future<NearByTransportationApiResponse> getNearByTransportation(
      NearByTransportationParameters nearByParameters) async {
    return await _appServicesClient.getNearByTransportation(
        nearByParameters.lat, nearByParameters.lon, nearByParameters.radius);
  }

  @override
  Future<NearByTransportationApiResponse> getNearByTransportationFiltered(
      NearByCategoricalTransportationParameters nearByParameters) async {
    late final NearByTransportationApiResponse res;
    try{
      res = await _appServicesClient.getNearByTransportationFiltered(nearByParameters.category,
          nearByParameters.lat, nearByParameters.lon, nearByParameters.radius);
    }catch(e){
      print('an api error >>>>>>>>>>>> $e');
    }
    return res;
  }

  @override
  Future<TransportationCategoryApiResponse> getTransportationCategories() async {
    late final TransportationCategoryApiResponse res;
    try {
      res = await _appServicesClient.getTransportationCategories();
    }catch(e)
    {
      print('$e');
    }
    return res;
  }

  @override
  Future<UserApiResponse> getUserProfile() async {
    return await _appServicesClient.userProfile();
  }

  @override
  Future<PlanApiResponse> getPlans() async {
    return await _appServicesClient.getPlans();
  }

  @override
  Future<HomeDestinationResponse> getCountries() async {
    final cat = await _appServicesClient.categories();
    final des = await _appServicesClient.getCountries();
    HomeDestinationResponse res = HomeDestinationResponse(cat, des);
    res.status = "success";
    return res;
  }

  @override
  Future<RegisterResponse> pickPlans(int planId) async {
    return await _appServicesClient.pickPlan(planId);
  }

  @override
  Future<PopularPlacesApiResponse> getPopularPlaces(
      int page, String country) async {
    return await _appServicesClient.getPopularPlaces(page, country);
  }

  @override
  Future<PopularPlacesApiResponse> getFilterPlaces(FilterPlacesParameters query) async {

    late final PopularPlacesApiResponse response;
    try {
      response = await _appServicesClient.getFilterPlaces(
          query.location,
          query.date,
          query.rate,
          query.type
      );
    } catch (error) {
      print('Error fetching categories: $error');
    }


    return response;
  }

  @override
  Future<TopPlacesApiResponse> getTopRatedFoods(
      String type, String country) async {
    late final TopPlacesApiResponse response;
    try {
      response = await _appServicesClient.getTopRated(type, country);
    } catch (error) {
      print('Error fetching categories: $error');
    }
    return response;
  }
}
