import 'package:applocation/app/app_preferences.dart';
import 'package:applocation/app/constants.dart';
import 'package:applocation/data/data_source/remote_data_source.dart';
import 'package:applocation/data/mapper/booking_mapper.dart';
import 'package:applocation/data/mapper/countries_mapper.dart';
import 'package:applocation/data/mapper/mapper.dart';
import 'package:applocation/data/mapper/one_place_mapper.dart';
import 'package:applocation/data/mapper/place_profile_mapper.dart';
import 'package:applocation/data/mapper/plan_mapper.dart';
import 'package:applocation/data/mapper/popular_place_mapper.dart';
import 'package:applocation/data/mapper/top_places_mapper.dart';
import 'package:applocation/data/mapper/transportation_mapper.dart';
import 'package:applocation/data/mapper/user_mapper.dart';
import 'package:applocation/data/network/error_handler.dart';
import 'package:applocation/data/network/failure.dart';
import 'package:applocation/data/network/network_info.dart';
import 'package:applocation/data/network/requestes.dart';
import 'package:applocation/domain/model/booking_models.dart';
import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/model/transportation_models.dart';
import 'package:applocation/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

import '../data_source/local_data_source.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  final LocalDataSource _localDataSource;
  final AppPreferences _appPreferences;
  RepositoryImpl(this._remoteDataSource, this._networkInfo,
      this._localDataSource, this._appPreferences);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest, bool token) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          if (response.customer != null) {
            if (response.customer!.token != null) {
              token
                  ? await _appPreferences.saveToken(response.customer!.token!)
                  : Constants.token = response.customer!.token!;
            }
          }
          return Right(response.toDomain());
        } else {
          return left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Register>> forgotPassword(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call API
        final response = await _remoteDataSource.forgotPassword(email);

        if (response.status == ApiInternalStatus.SUCCESS) {
          // success
          // return right
          return Right(response.toDomain());
        } else {
          // failure
          // return left
          return left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return network connection error
      // return left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Register>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _remoteDataSource.register(registerRequest);

        if (response.status == 'create') {
          // success
          // return either right
          // return data
          return Right(response.toDomain());
        } else {
          // failure --return business error
          // return either left
          return left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, NearBy>> getNearByPlaces(
      NearByParameters nearByParameters) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getNearByPlaces(nearByParameters);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, CheckAuthModel>> getCheckAuth() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getCheckAuth();
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Register>> cancelBooking(String bookId) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.cancelBooking(bookId);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, PlaceBookingModel>> confirmBooking(
      BookingInput input) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.confirmBooking(input);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, BookingResponse>> getUserBooking(String type) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getUserBooking(type);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Register>> updateBooking(BookingInput input) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.updateBooking(input);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, CategoryResponseModel>> getCategory() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getCategories();
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  // @override
  // Future<Either<Failure, FamousPlaceResponseModel>> getFamousPlaces() async {
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       final response = await _remoteDataSource.getFamousPlaces();
  //       if (response.status == ApiInternalStatus.SUCCESS) {
  //         return Right(response.toDomain());
  //       } else {
  //         return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
  //       }
  //     } catch (error) {
  //       return Left(ErrorHandler.handle(error).failure);
  //     }
  //   } else {
  //     return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, FamousPlaceResponseModel>> getRecommended() async {
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       final response = await _remoteDataSource.getRecommendedPlaces();
  //       if (response.status == ApiInternalStatus.SUCCESS) {
  //         return Right(response.toDomain());
  //       } else {
  //         return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
  //       }
  //     } catch (error) {
  //       return Left(ErrorHandler.handle(error).failure);
  //     }
  //   } else {
  //     return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  //   }
  // }

  @override
  Future<Either<Failure, HomeObject>> getHomeData(String destination) async {
    // try {
    //   // get response from cache
    //   final response = await _localDataSource.getHomeData();
    //   return Right(response.toDomain());
    // } catch (cacheError) {
    //   // cache is not existing or cache is not valid

    // its the time to get from API side
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getHomeData(destination);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, OnePlaceResponseModel>> getOnePlace(int id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getOnePlace(id);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, FamousPlaceResponseModel>> getSearchResults(
      String input) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getSearchResults(input);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, PlaceProfileModel>> getPlaceProfile(int id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getPlaceProfile(id);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, NearByTransportationModel>> getNearByTransportation(
      NearByTransportationParameters nearByParameters) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getNearByTransportation(nearByParameters);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }


  @override
  Future<Either<Failure, NearByTransportationModel>> getNearByTransportationFiltered(
      NearByCategoricalTransportationParameters nearByParameters) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
        await _remoteDataSource.getNearByTransportationFiltered(nearByParameters);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }


  @override
  Future<Either<Failure, CategoryResponseModel>> getTransportationCategories() async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
        await _remoteDataSource.getTransportationCategories();
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, UserApi>> getUserProfile() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getUserProfile();
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, PlanApi>> getPlans() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getPlans();
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, HomeDestinationData>> getCountries() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getCountries();
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Register>> pickPlan(int planId) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.pickPlans(planId);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, PopularPlacesApiModel>> getPopularPlaces(
      int page, String country) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getPopularPlaces(page, country);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, PopularPlacesApiModel>> getFilterPlaces(FilterPlacesParameters query) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
        await _remoteDataSource.getFilterPlaces(query);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, TopPlacesApiModel>> getTopRatedFoods(
      String type, String country) async {
    if (await _networkInfo.isConnected) {
      try {

        final response =
            await _remoteDataSource.getTopRatedFoods(type, country);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
