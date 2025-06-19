
import 'package:applocation/domain/state_management/cubit/favorite_foods_cubit.dart';
import 'package:applocation/domain/state_management/cubit/location_cubit.dart';
import 'package:applocation/domain/state_management/cubit/place_profile_cubit.dart';
import 'package:applocation/domain/state_management/cubit/search_cubit.dart';
import 'package:applocation/presentation/resources/langauge_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'app/app.dart';
import 'app/constants/observers.dart';
import 'app/di.dart';
import 'domain/state_management/bloc/home_bloc.dart';
import 'domain/state_management/bloc/login_bloc.dart';
import 'domain/state_management/bloc_observer.dart';
import 'domain/state_management/cubit/user_cubit.dart';
import 'domain/state_management/events/home_event.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Lock to portrait mode
    // DeviceOrientation.landscapeLeft, // Uncomment to lock landscape
    // DeviceOrientation.landscapeRight, // Uncomment to allow reversed landscape
  ]);
  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LoginBloc>(
      create: (context) => instance<LoginBloc>(),
    ),
    BlocProvider<SearchCubit>(
    create: (context) => instance<SearchCubit>(),
    ),
    BlocProvider<PlaceProfileCubit>(
    create: (context) => instance<PlaceProfileCubit>(),
    ),
    BlocProvider<UserCubit>(
      create: (context) => instance<UserCubit>()..fetchUserData(),
    ),
    BlocProvider<LocationCubit>(
      create: (context) => instance<LocationCubit>(),
    ),
    BlocProvider<FavoriteFoodsCubit>(
      create: (context) => instance<FavoriteFoodsCubit>(),
    ),
    BlocProvider<HomeBloc>(
      create: (context) => instance<HomeBloc>()..add(HomeSelectDestination()),
    ),
  ], child: EasyLocalization(
      supportedLocales: const [ARABIC_LOCAL, ENGLISH_LOCAL],
      path: ASSET_PATH_LOCALISATIONS,
      child: Phoenix(child: MyApp()))));

}
