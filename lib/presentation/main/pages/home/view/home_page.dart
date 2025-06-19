import 'package:applocation/app/constants/functions.dart';
import 'package:applocation/app/constants/widgets.dart';
import 'package:applocation/domain/model/countries_models.dart';
import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/state_management/cubit/location_cubit.dart';
import 'package:applocation/domain/state_management/states/location_states.dart';
import 'package:applocation/presentation/famous_places.dart';
import 'package:applocation/presentation/resources/routes_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../app/constants.dart';
import '../../../../../domain/state_management/bloc/home_bloc.dart';
import '../../../../../domain/state_management/events/home_event.dart';
import '../../../../../domain/state_management/states/home_states.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../../main_view.dart';

HomeData? data;
String _selectedCountry = '';
HomeDestinationData? destinationData;


class LocationContent extends StatelessWidget
{
  final Widget? child;
  final String? error;
  const LocationContent({
    this.child,
    this.error,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: child == null ? null : 40,
      height: child == null ? null : 100,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: child == null ? ColorManager.white : Colors.transparent,
        borderRadius: BorderRadius.circular(32),
        boxShadow: child == null
            ? [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ]
            : [],
      ),
      child: child ??
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FontAwesomeIcons.locationCrosshairs,
                  size: 50,
                  color: Colors.blue,
                ),
                Text(
                  AppStrings.enableLocation.tr(),
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  error ?? AppStrings.useYourLocation.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                defaultElevatedButton(
                  onPressed: () async {
                    context.read<LocationCubit>().getLocation();
                  },
                  text: error == null
                      ? AppStrings.enableMyLocation.tr()
                      : AppStrings.tryAgain.tr(),
                ),
              ],
            ),
          ),
    );
  }

}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  DateTime? _lastPressedAt;
  bool _canPop = false; //_canPopLoc=false;



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textThemes = Theme.of(context).textTheme;

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (context.read<HomeBloc>().state is HomeLoadedDestinationState) {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt!) >
                  Duration(seconds: 2)) {
            _lastPressedAt = DateTime.now();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppStrings.pressBack.tr()),
                duration: Duration(seconds: 2),
              ),
            );
            _canPop = false;
          }
          else{
            _canPop = true;
          }
        }
      },
      canPop: _canPop,
      child: Padding(
        padding:
            EdgeInsets.only(top: size.height * 0.059, left: size.width * 0.042),
        child: SingleChildScrollView(
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) async {
              if (state is HomeLoadedState) {
                data = state.homeData;
              }
              if (state is NearByLoadedState) {
                _showNearbyBottomSheet(state.near, context, size, textThemes);
              } else if (state is HomeLoadedDestinationState) {
                data = null;
                print(AppStrings.firstCountry.tr(args: [
                  state.destinationData.destinations?.data?.countries?[0]
                          .name ??
                      ''
                ]));
                destinationData = state.destinationData;
              }
            },
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeErrorState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.errorMassage.tr(args: [state.error]),
                          style: TextStyle(color: Colors.black)),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => _selectedCountry.isNotEmpty
                            ? context
                                .read<HomeBloc>()
                                .add(LoadHomeDataEvent(_selectedCountry))
                            : context
                                .read<HomeBloc>()
                                .add(HomeSelectDestination()),
                        child: Text(AppStrings.retry.tr()),
                      ),
                    ],
                  ),
                );
              } else {
                if (data != null) {
                  return _getContentWidget(size, textThemes, data!);
                } else if (destinationData != null) {
                  return _getContentDestination(
                      size, textThemes, destinationData!);
                } else {
                  return Center(
                    child: defaultText(
                        text: AppStrings.unexpectedError.tr(),
                        style: textThemes.titleLarge),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _getContentDestination(
      Size size, TextTheme textThemes, HomeDestinationData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleSection(size, textThemes),
        SizedBox(height: size.height * 0.01),
        _description(size, textThemes),
        SizedBox(height: size.height * 0.01),
        _categoriesBanner(size, textThemes),
        SizedBox(height: size.height * 0.01),
        _categoriesSection(size, textThemes, data.categories),
        SizedBox(height: size.height * 0.01),
        Center(
            child: defaultText(
                text: AppStrings.chooseYourDestination.tr(),
                style: textThemes.titleLarge)),
        SizedBox(height: size.height * 0.04),
        defaultContainer(
            height: size.height * 0.277,
            width: size.width,
            child: _grid(data.destinations?.data?.countries, textThemes)),
      ],
    );
  }

  Widget _grid(List<Country>? destinations, TextTheme themes) => LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              // First DestinationItem
              Flexible(
                flex: 2,
                child: destinationItem(
                  destinations![0],
                  constraints,
                  themes.bodyLarge!,
                ),
              ),
              SizedBox(width: constraints.maxWidth * 0.03),
              // Grid for Remaining Destinations
              Flexible(
                flex: 4,
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: constraints.maxWidth * 0.02,
                    mainAxisSpacing: constraints.maxHeight * 0.07,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return destinationColumn(
                      destinations[index + 1],
                      constraints,
                      themes.bodyLarge!,
                    );
                  },
                  itemCount: destinations.length - 1,
                ),
              ),
            ],
          );
        },
      );

  Widget destinationColumn(
      Country destination, BoxConstraints size, TextStyle style) {
    return GridTile(
      child: defaultGestureDetector(
        onTap: () {
          data = null;
          context.read<HomeBloc>().add(LoadHomeDataEvent(destination.name));
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            circular_image(
              image: '${Constants.baseUrlImages}${destination.image}',
              width: size.maxWidth * 0.3,
              height: size.maxHeight * 0.47,
            ),
            defaultText(text: destination.name, style: style),
          ],
        ),
      ),
    );
  }

  Widget destinationItem(
      Country destination, BoxConstraints size, TextStyle style) {
    return defaultGestureDetector(
      onTap: () {
        _selectedCountry = destination.name;
        context.read<HomeBloc>().add(LoadHomeDataEvent(_selectedCountry));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          circular_image(
            image: '${Constants.baseUrlImages}${destination.image}',
            height: size.maxHeight,
            width: size.maxWidth * 0.3,
          ),
          defaultText(text: destination.name, style: style),
        ],
      ),
    );
  }

  Widget _getContentWidget(Size size, TextTheme textThemes, HomeData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleSection(size, textThemes),
        SizedBox(height: size.height * 0.01),
        _description(size, textThemes),
        SizedBox(height: size.height * 0.01),
        _categoriesBanner(size, textThemes),
        SizedBox(height: size.height * 0.01),
        _categoriesSection(size, textThemes, data.categories),
        SizedBox(height: size.height * 0.01),
        _famousBanner(size, textThemes, data.famousPlaces),
        SizedBox(height: size.height * 0.01),
        _famousSection(size, textThemes, data.famousPlaces),
        SizedBox(height: size.height * 0.01),
        _recommendedBanner(size, textThemes, data.recommendedPlaces),
        SizedBox(height: size.height * 0.01),
        _recommendedSection(size, textThemes, data.recommendedPlaces),
      ],
    );
  }

  void _showNearbyBottomSheet(
      NearBy near, BuildContext context, Size size, themes) {
    if (mainScaffoldKey.currentState != null) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return circularBorderContainer(
            size: size,
            width: 1,
            height: 0.92,
            child: _bottomSheetColumn(near, size, themes),
            color: ColorManager.white,
            circle: null,
            topRight: AppSize.s30,
            topLeft: AppSize.s30,
            padding: EdgeInsets.all(AppPadding.p14),
          );
        },
      ).then((_) async {
        if (context.mounted) {
          context.read<HomeBloc>().add(HomeContentEvent());
        }
      });
    }
  }

  Padding _titleSection(Size size, TextTheme textThemes) => Padding(
        padding: EdgeInsets.only(right: size.width * 0.042),
        child: spacedRow(
          defaultContainer(
            height: size.height * 0.026,
            width: size.width * 0.43,
            child: defaultText(
                text: AppStrings.welcomeMassage.tr(),
                style: textThemes.headlineLarge!),
          ),
          defaultGestureDetector(
            onTap: () {
              // Navigator.pushReplacementNamed(context, Routes.searchScreenRoute);
              Navigator.pushNamed(context, Routes.searchScreenRoute);
            },
            child: Icon(Icons.search_rounded),
          ),
        ),
      );

  Padding _description(Size size, TextTheme textThemes) => Padding(
        padding: EdgeInsets.only(right: size.width * 0.042),
        child: defaultContainer(
          height: size.height * 0.0445,
          width: size.width * 0.84,
          child: defaultText(
              text: AppStrings.offerMassage.tr(),
              style: textThemes.headlineMedium!,
              flow: TextOverflow.visible),
        ),
      );

  Padding _categoriesBanner(Size size, TextTheme textThemes) => Padding(
        padding: EdgeInsets.only(right: size.width * 0.042),
        child: defaultContainer(
          height: size.height * 0.031,
          width: size.width * 0.27,
          child: defaultText(
              text: AppStrings.categories.tr(), style: textThemes.titleLarge!),
        ),
      );

  Padding _categoriesSection(
          Size size, TextTheme textThemes, List<Category>? data) =>
      Padding(
        padding: EdgeInsets.only(right: size.width * 0.042),
        child: defaultContainer(
          height: size.height * 0.124,
          width: null,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => defaultGestureDetector(
              child: category_builder(
                  size.width * 0.087,
                  size.height * 0.03,
                  size.height * 0.025,
                  size.width * 0.225,
                  '${Constants.baseUrlImages}${data?[index].image}',
                  '${data?[index].name}'),
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return PopScope(
                      canPop: false,
                      child: Dialog(
                        child: LocationContent(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    );
                  },
                );
                if (await context
                    .read<LocationCubit>()
                    .isLocationServiceEnabled) {
                  if (context.mounted) {
                    await context.read<LocationCubit>().getLocation();
                  }
                  if (data?[index].name == AppStrings.transportation.tr()) {
                    if (context.mounted) {
                      Navigator.pushNamed(
                        context,
                        Routes.transportation,
                      );
                    }
                  } else {
                    if (context.mounted) {
                      final position = context.read<LocationCubit>().position;
                      dismissDialog(context);
                      context.read<HomeBloc>().add(LoadNearByDataEvent(
                          position!.latitude,
                          position.longitude,
                          10.00,
                          '${data?[index].name}'));
                    }
                  }
                } else {
                  if (context.mounted) {
                    return _locDialog(context, '${data?[index].name}');
                  }
                }
              },
            ),
            separatorBuilder: (context, index) => SizedBox(width: 1),
            itemCount: data?.length ?? 0,
          ),
        ),
      );

  dynamic _locDialog(BuildContext parentContext, String type) => showDialog(
        context: parentContext,
        builder: (parentContext) {
          return Dialog(
            child: BlocConsumer<LocationCubit, LocationState>(
              listener: (context, state) {
                // Handle state changes
              },
              builder: (context, state) {
                if (state is LocationInitial) {
                  return LocationContent();
                } else if (state is LocationLoading) {
                  return LocationContent(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is LocationError) {
                  return LocationContent(
                    error:state.error,
                  );
                } else if (state is LocationLoaded) {
                  if (type == AppStrings.transportation.tr()) {
                    Navigator.pushNamed(
                      context,
                      Routes.transportation,
                    );
                  } else {
                    context.read<HomeBloc>().add(
                        LoadNearByDataEvent(
                        state.position.latitude,
                        state.position.longitude,
                        10.00,
                        type));
                    Navigator.of(context).pop();
                  }
                }
                return Center(child: Text(AppStrings.defaultContent.tr()));
              },
            ),

            // PopScope(
            //   onPopInvokedWithResult: (didPop, result) {
            //     if(parentContext.read<LocationCubit>().state is LocationLoading)
            //     {
            //       context.read<LocationCubit>().errorEmitter('Failed to Get Location');
            //     }
            //   },
            //   child: ,
            // ),
          );
        },
      );

  LayoutBuilder _bottomSheetColumn(NearBy data, Size size, TextTheme themes) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: circularBorderContainer(
                  size: size,
                  color: Color.fromRGBO(209, 213, 219, 1),
                  height: 0.005,
                  width: 0.2),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            defaultText(
                text:'${AppStrings.nearBy.tr()} ${data.nearBy?.nearByPlaces[0].category?.name ?? ''}',
                style: themes.titleLarge),
            SizedBox(height: size.height*0.04,),
            // defaultContainer(
            //   width: double.infinity,
            //   height: constraints.maxHeight * 0.215,
            //   child: Container(),
            // ),
            defaultContainer(
                height: constraints.maxHeight * 0.92,
                width: double.infinity,
                child: ListView.separated(
                    itemBuilder: (context, index) => defaultGestureDetector(
                        child: _nearByContainer(constraints,
                            data.nearBy!.nearByPlaces[index], themes),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.bookingRoute,
                            arguments: data.nearBy!.nearByPlaces[index].id,
                          );
                        }),
                    separatorBuilder: (context, index) => SizedBox(
                          height: AppSize.s4,
                        ),
                    itemCount: data.nearBy?.nearByPlaces.length ?? 0)),
          ],
        ),
      );
    });
  }

  Container _nearByContainer(
          BoxConstraints constraints, NearByPlace near, TextTheme themes) =>
      circularBorderContainer(
          padding: EdgeInsets.only(right: AppPadding.p8),
          shadow: true,
          size: Size(constraints.maxWidth, constraints.maxHeight),
          width: 1,
          height: 0.16,
          color: ColorManager.white,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    circular_image(
                        topLeft: AppSize.s8,
                        bottomLeft: AppSize.s8,
                        circle: null,
                        height: double.infinity,
                        image: '${Constants.baseUrlImages}${near.image}'),
                    imageColumn(
                        CircleAvatar(
                          child: Icon(
                            !near.isFavorite
                                ? Icons.favorite_border
                                : Icons.favorite,
                            color: Color.fromRGBO(237, 76, 92, 1),
                          ),
                        ),
                        circularBorderContainer(
                          size:
                              Size(constraints.maxWidth, constraints.maxHeight),
                          height: 0.037,
                          padding: EdgeInsets.all(constraints.maxWidth * 0.005),
                          circle: null,
                          topRight: AppSize.s14,
                          bottomRight: AppSize.s14,
                          color: ColorManager.openButton,
                          child: defaultText(
                              text: '${near.distance.round()}km   ',
                              style: TextStyle(
                                  fontSize: AppSize.s12,
                                  color: Color.fromRGBO(249, 134, 0, 1))),
                        ),
                        EdgeInsets.symmetric(vertical: 6),
                        MainAxisAlignment.spaceBetween),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: defaultContainer(
                    padding: EdgeInsets.all(AppPadding.p8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defaultText(
                          text: near.description,
                          maxLines: 1,
                          flow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Color.fromRGBO(21, 103, 120, 1),
                              fontSize: AppSize.s12),
                        ),
                        defaultText(
                            text: near.title,
                            style: themes.titleLarge),
                        defaultText(
                            text: near.location,
                            style: themes.headlineMedium),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: constraints.maxWidth * 0.06,
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.02,
                            ),
                            defaultText(
                                style: themes.headlineSmall,
                                text:
                                    '${near.reviews?.total} (${near.reviews?.ratesCount})'),
                            SizedBox(
                              width: constraints.maxWidth * 0.06,
                            ),
                            Icon(
                              FontAwesomeIcons.tag,
                              color: Color.fromRGBO(21, 103, 120, 1),
                              size: constraints.maxWidth * 0.045,
                            ),
                            defaultText(
                                text: ' ${near.discount}%',
                                style: TextStyle(
                                    color: Color.fromRGBO(21, 103, 120, 1))),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ));

  Widget _recommendBuilder(Size size, TextTheme textThemes,
      FamousPlace? recommend, VoidCallback onPressed) {
    String image = "${Constants.baseUrlImages}${recommend?.image}";

    return recommendedBuilder(size, textThemes, image, recommend?.title ?? ' ',
        recommend?.description ?? ' ', onPressed);
  }

  Padding _famousBanner(
          Size size, TextTheme textThemes, List<FamousPlace> data) =>
      Padding(
        padding: EdgeInsets.only(right: size.width * 0.042),
        child: spacedRow(
          defaultContainer(
            height: size.height * 0.028,
            width: size.width * 0.6,
            child: defaultText(
                text: AppStrings.famousPlaces.tr(),
                style: textThemes.titleLarge!),
          ),
          defaultGestureDetector(
              child: defaultText(
                  text: AppStrings.SEEALL.tr(), style: textThemes.titleMedium),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.famousPlacesRoute,
                  arguments: [data, placeView.famousPlace],
                );
              }),
        ),
      );

  Container _famousSection(
          Size size, TextTheme textThemes, List<FamousPlace>? famousPlaces) =>
      defaultContainer(
        height: size.height * 0.21,
        width: null,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => defaultGestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.placeProfile,
                arguments: famousPlaces?[index].id,
              );
            },
            child: famous_builder(
              '${Constants.baseUrlImages}${famousPlaces?[index].image}',
              '${famousPlaces?[index].title}',
              '${famousPlaces?[index].description}',
              size.height * 0.21,
              size.width * 0.85,
              size.height * 0.03,
              textThemes.bodyLarge!,
              textThemes.titleSmall!,
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(width: 10),
          itemCount: famousPlaces?.length ?? 0,
        ),
      );

  Padding _recommendedBanner(
          Size size, TextTheme textThemes, List<FamousPlace> data) =>
      Padding(
        padding: EdgeInsets.only(right: size.width * 0.042),
        child: spacedRow(
          defaultContainer(
            height: size.height * 0.028,
            width: size.width * 0.6,
            child: defaultText(
                text: AppStrings.recommendedPlaces.tr(),
                style: textThemes.titleLarge!),
          ),
          defaultGestureDetector(
              child: defaultText(
                  text: AppStrings.SEEALL.tr(), style: textThemes.titleMedium),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.famousPlacesRoute,
                  arguments: [
                    data,
                    placeView.famousPlace
                  ], // Replace with the actual placeId
                );
              }),
        ),
      );

  Container _recommendedSection(Size size, TextTheme textThemes,
          List<FamousPlace>? recommendedPlaces) =>
      defaultContainer(
        height: size.height * 0.3,
        width: null,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => circularBorderContainer(
              size: size,
              width: 0.447,
              child: _recommendBuilder(
                  size, textThemes, recommendedPlaces?[index], () {
                Navigator.pushNamed(
                  context,
                  Routes.placeProfile,
                  arguments: recommendedPlaces?[index].id,
                );
              }),
              color: ColorManager.white,
              padding: EdgeInsets.all(size.height * 0.01),
              margin: EdgeInsets.all(size.height *
                  0.005)), //famous_builder('${Constants.baseUrlImages}${snapshot.data?.famousPlaces[index].image}','${snapshot.data?.famousPlaces[index].title}','${snapshot.data?.famousPlaces[index].description}',size.height*0.21,size.width*0.76,size.height*0.03),
          separatorBuilder: (context, index) => SizedBox(width: 10),
          itemCount: recommendedPlaces?.length ?? 0,
        ),
      );

  @override
  void dispose() {
    super.dispose();
  }
}
