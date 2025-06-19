import 'package:applocation/app/app_preferences.dart';
import 'package:applocation/data/data_source/remote_data_source.dart';
import 'package:applocation/data/network/app_api.dart';
import 'package:applocation/data/network/dio_factory.dart';
import 'package:applocation/data/network/network_info.dart';
import 'package:applocation/data/repository_impl/repository_impl.dart';
import 'package:applocation/domain/repository/repository.dart';
import 'package:applocation/domain/state_management/bloc/home_bloc.dart';
import 'package:applocation/domain/state_management/bloc/register_bloc.dart';
import 'package:applocation/domain/state_management/cubit/booking_cubit.dart';
import 'package:applocation/domain/state_management/cubit/location_cubit.dart';
import 'package:applocation/domain/state_management/cubit/place_profile_cubit.dart';
import 'package:applocation/domain/state_management/cubit/places_filter.dart';
import 'package:applocation/domain/state_management/cubit/search_cubit.dart';
import 'package:applocation/domain/state_management/cubit/user_cubit.dart';
import 'package:applocation/domain/usecase/FavoriteFoodsUseCase.dart';
import 'package:applocation/domain/usecase/booking_usecase.dart';
import 'package:applocation/domain/usecase/login_usecase/login_usecase.dart';
import 'package:applocation/domain/usecase/place_filter_usecase.dart';
import 'package:applocation/domain/usecase/place_profile_usecase.dart';
import 'package:applocation/domain/usecase/search_usecase.dart';
import 'package:applocation/domain/usecase/user_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/local_data_source.dart';
import '../domain/state_management/bloc/login_bloc.dart';
import '../domain/state_management/cubit/favorite_foods_cubit.dart';
import '../domain/state_management/cubit/plan_cubit.dart';
import '../domain/state_management/cubit/transportation_cubit.dart';
import '../domain/usecase/home_usecase.dart';
import '../domain/usecase/plan_usecase.dart';
import '../domain/usecase/register_usecase.dart';
import '../domain/usecase/transportation_usecase.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance
      .registerLazySingleton<AppServicesClient>(() => AppServicesClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServicesClient>()));

  // local data source
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // repository

  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance(), instance(), instance()));

    instance.registerFactory<LocationCubit>(() => LocationCubit());



}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginBloc>(() => LoginBloc(instance()));
  }
}

// initLoginModule() {
//   if (!GetIt.I.isRegistered<LoginUseCase>()) {
//     instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
//     instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
//   }
// }

// initForgotPasswordModule() {
//   if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
//     instance.registerFactory<ForgotPasswordUseCase>(
//         () => ForgotPasswordUseCase(instance()));
//     instance.registerFactory<ForgotPasswordViewModel>(
//         () => ForgotPasswordViewModel(instance()));
//   }
// }

// initRegisterModule() {
//   if (!GetIt.I.isRegistered<RegisterUseCase>()) {
//     instance
//         .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
//     instance.registerFactory<RegisterViewModel>(
//         () => RegisterViewModel(instance()));
//     instance.registerFactory<ImagePicker>(() => ImagePicker());
//   }
// }

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    instance.registerFactory<RegisterBloc>(() => RegisterBloc(instance()));
    instance.registerFactory<ImagePicker>(() => ImagePicker());
  }
}

// initHomeModule() {
//   if (!GetIt.I.isRegistered<HomeUseCase>()) {
//     instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
//     instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
//   }
// }

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomeBloc>(() => HomeBloc(instance()));
  }
  if (!GetIt.I.isRegistered<UserUseCase>()) {
    instance.registerFactory<UserUseCase>(() => UserUseCase(instance()));
    instance.registerFactory<UserCubit>(() => UserCubit(instance()));
  }
  if (!GetIt.I.isRegistered<FavoriteFoodsUseCase>()) {
    instance.registerFactory<FavoriteFoodsUseCase>(() => FavoriteFoodsUseCase(instance()));
    instance.registerFactory<FavoriteFoodsCubit>(() => FavoriteFoodsCubit(instance()));
  }
}

initSortAndFilterModule(){
  if (!GetIt.I.isRegistered<PlaceFilterUseCase>()) {
    instance.registerFactory<PlaceFilterUseCase>(() => PlaceFilterUseCase(instance()));
    instance.registerFactory<PlaceFilterCubit>(() => PlaceFilterCubit(instance()));
  }
}


initTransportationModule() {
  if (!GetIt.I.isRegistered<TransportationUseCase>()) {
    instance.registerFactory<TransportationUseCase>(() => TransportationUseCase(instance()));
    instance.registerFactory<TransportationCubit>(() => TransportationCubit(instance()));
  }
}

initPlanModule() {
  if (!GetIt.I.isRegistered<PlanUseCase>()) {
    instance.registerFactory<PlanUseCase>(() => PlanUseCase(instance()));
    instance.registerFactory<PlansCubit>(() => PlansCubit(instance()));
  }
}


initSearchModule() {
  if (!GetIt.I.isRegistered<SearchUseCase>()) {
    instance.registerFactory<SearchUseCase>(() => SearchUseCase(instance()));
    instance.registerFactory<SearchCubit>(() => SearchCubit(instance()));
  }
}

initUserModule() {
  if (!GetIt.I.isRegistered<UserUseCase>()) {
    instance.registerFactory<UserUseCase>(() => UserUseCase(instance()));
    instance.registerFactory<UserCubit>(() => UserCubit(instance()));
  }
}

initPlaceProfileModule() {
  if (!GetIt.I.isRegistered<PlaceProfileUseCase>()) {
    instance.registerFactory<PlaceProfileUseCase>(() => PlaceProfileUseCase(instance()));
    instance.registerFactory<PlaceProfileCubit>(() => PlaceProfileCubit(instance()));
  }
}

initBookingModule() {
  if (!GetIt.I.isRegistered<BookingUseCase>()) {
    // Register BookingUseCase
    instance.registerFactory<BookingUseCase>(() => BookingUseCase(instance()));

    // Register BookingCubit
    instance.registerFactory<BookingCubit>(() => BookingCubit(instance()));
  }
}

// initStoreDetailsModule() {
//   if (!GetIt.I.isRegistered<StoreDetailsUseCase>()) {
//     instance.registerFactory<StoreDetailsUseCase>(
//         () => StoreDetailsUseCase(instance()));
//     instance.registerFactory<StoreDetailsViewModel>(
//         () => StoreDetailsViewModel(instance()));
//   }
// }
