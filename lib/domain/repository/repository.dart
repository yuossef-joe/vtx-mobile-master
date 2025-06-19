import 'package:applocation/data/network/requestes.dart';
import 'package:applocation/domain/model/models.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../model/booking_models.dart';
import '../model/transportation_models.dart';

abstract class Repository{

  Future<Either<Failure,UserApi>> getUserProfile();

  Future <Either <Failure,Authentication>> login(LoginRequest loginRequest,bool token);

  Future<Either<Failure, Register>> forgotPassword(String email);

  Future<Either<Failure, Register>> register(
      RegisterRequest registerRequest);

  Future<Either<Failure, Register>> pickPlan(
      int planId);

  Future<Either<Failure,CategoryResponseModel>> getCategory();

  // Future<Either<Failure,FamousPlaceResponseModel>> getFamousPlaces();
  //
  // Future<Either<Failure,FamousPlaceResponseModel>> getRecommended();

  Future<Either<Failure,HomeDestinationData>> getCountries();

   Future<Either<Failure, HomeObject>> getHomeData(String destination);

  Future<Either<Failure,PlanApi>> getPlans();

  Future<Either<Failure,FamousPlaceResponseModel>> getSearchResults(String input);

    Future<Either<Failure, OnePlaceResponseModel>> getOnePlace(int id);

  Future<Either<Failure, PlaceProfileModel>> getPlaceProfile(int id);

  Future<Either<Failure, NearBy>> getNearByPlaces(NearByParameters nearByParameters);

  Future<Either<Failure, NearByTransportationModel>> getNearByTransportation(NearByTransportationParameters nearByParameters);

  Future<Either<Failure,CheckAuthModel>> getCheckAuth();

  Future<Either<Failure,PlaceBookingModel>> confirmBooking(BookingInput input);


  Future<Either<Failure,Register>> updateBooking(BookingInput input);

  Future<Either<Failure,Register>> cancelBooking(String bookId);

  Future<Either<Failure, BookingResponse>> getUserBooking(String type);

  Future<Either<Failure, TopPlacesApiModel>> getTopRatedFoods(String type,String country);

  Future<Either<Failure, PopularPlacesApiModel>> getPopularPlaces(int page,String country);

  Future<Either<Failure, PopularPlacesApiModel>> getFilterPlaces(FilterPlacesParameters query);

  Future<Either<Failure, NearByTransportationModel>> getNearByTransportationFiltered(
      NearByCategoricalTransportationParameters nearByParameters);

  Future<Either<Failure, CategoryResponseModel>> getTransportationCategories();
}