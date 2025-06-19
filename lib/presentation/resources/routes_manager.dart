import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/model/transportation_models.dart';
import 'package:applocation/domain/state_management/cubit/booking_cubit.dart';
import 'package:applocation/domain/state_management/cubit/transportation_cubit.dart';
import 'package:applocation/presentation/add_card/add_card.dart';
import 'package:applocation/presentation/appointments/view/upcoming_appointments.dart';
import 'package:applocation/presentation/booking/view/booking_view.dart';
import 'package:applocation/presentation/famous_places.dart';
import 'package:applocation/presentation/filters/view/filtering.dart';
import 'package:applocation/presentation/food/favorite_food/view/favorite_food.dart';
import 'package:applocation/presentation/main/pages/home/view/home_page.dart';
import 'package:applocation/presentation/place_profile/view/place_profile.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:applocation/presentation/transportation/view/transportation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../app/di.dart';
import '../../domain/state_management/cubit/places_filter.dart';
import '../filters/view/filter_sheet.dart';
import '../Payment/view/payment_screen.dart';
import '../food/favorite_food/view/most_popular.dart';
import '../forgot_password/forgot_password_view.dart';
import '../login/view/login_view.dart';
import '../main/main_view.dart';
import '../onboarding/view/onboarding_view.dart';
import '../plans/upgrade-to-pro/upgrade_to_pro.dart';
import '../register/register_view.dart';
import '../reservationdetail/reservationdetail-view/reservationDetail.dart';
import '../search/view/search_screen.dart';
import '../splash/splash_view.dart';
import '../tour_guide/tour_guide_profile/view/tour_guide_profile_view.dart';
import '../transportation/view/category_transportation_view.dart';
import '../trips/trips_history/view/trip_history.dart';
import '../verification/verification-view/verification-view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String homeRoute = "/Home";
  static const String tripHistory = "/TripHistory";
  static const String upgradeToProRoute = "/upgradeToPro";
  static const String tourGuideProfileView = "/TourGuideProfileView";
  static const String favoriteFoodRoute = "/favoriteFood";
  static const String verificationRoute = "/Verification";
  static const String bookingRoute = "/booking_view.dart";
  static const String mostPopular = "/most_popular.dart";
  static const String ReservationDetailRoute = "reservationDetail.dart";
  static const String famousPlacesRoute = "/famous_places.dart";
  static const String searchScreenRoute = "/search_screen.dart";
  static const String placeProfile = "/place_profile.dart";
  static const String addCard = "/add_card.dart";
  static const String upcomingAppointments = "/upcoming_appointments.dart";
  static const String filterSheet = "/FilteringScreen.dart";
  static const String transportation = "/transportation.dart";
  static const String payment = "/payment";
  static const String sortAndFilter = "/filter_sheet.dart";
  static const String categoryTransportation = "/categoryTransportation.dart";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.homeRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.placeProfile:
        initPlaceProfileModule();
        final placeId = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => PlaceProfileView(placeId:placeId));
      case Routes.tripHistory:
        return MaterialPageRoute(builder: (_) => const TripHistory());
      case Routes.upgradeToProRoute:
        initPlanModule();
        return MaterialPageRoute(builder: (_) => const upgradeToPro());
      case Routes.tourGuideProfileView:
        return MaterialPageRoute(builder: (_) => const TourGuideProfileView());
      case Routes.favoriteFoodRoute:
        return MaterialPageRoute(builder: (_) => const FavoriteFood());
      case Routes.mostPopular:
        return MaterialPageRoute(builder: (_) => const mostPopular());
      case Routes.verificationRoute:
        return MaterialPageRoute(builder: (_) => const VerificationView());
        case Routes.ReservationDetailRoute:
        return MaterialPageRoute(builder: (_) => const ReservationDetail());
      case Routes.addCard:
        return MaterialPageRoute(builder: (_) => const AddCardScreen());
      case Routes.upcomingAppointments:
        return MaterialPageRoute(builder: (_) => const UpcomingAppointments());
      case Routes.filterSheet:
        return MaterialPageRoute(builder: (_) =>  FilteringScreen());

      case Routes.payment:
        final plan = settings.arguments as Plan;
        return MaterialPageRoute(builder: (_) =>  PaymentScreen(plan:plan ));
      case Routes.transportation:
        initTransportationModule();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
            instance<TransportationCubit>(),
            child: const TransportationScreen(),
          ),
        );
      case Routes.searchScreenRoute:
        initSearchModule();
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case Routes.sortAndFilter:
        initSortAndFilterModule();
        return MaterialPageRoute(builder: (_) => BlocProvider<PlaceFilterCubit>(
          create: (context)=>instance<PlaceFilterCubit>(),
          child: const FilterSheet(),
        ),);
      case Routes.famousPlacesRoute:
        final arg = settings.arguments as List<dynamic>;
        return MaterialPageRoute(
            builder: (_) => FamousPlacesScreen(
                  famousPlaces: arg[0] as List<AbstractPlace>,
                  type: arg[1] as placeView,
                ));
      case Routes.categoryTransportation:
        final arg = settings.arguments as List<dynamic>;
        return MaterialPageRoute(builder: (_) => CategoryNearbyTransportationScreen(arg[0] as Position, arg[1] as List<Transportation>));
      case Routes.bookingRoute:
        initBookingModule();
        final placeId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                instance<BookingCubit>()..fetchBookingData(placeId),
            child: BookingView(placeId: placeId),
          ),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title:  Text(AppStrings.noRouteFound.tr()),
              ),
              body:  Center(child: Text(AppStrings.noRouteFound.tr())),
            ));
  }
}
