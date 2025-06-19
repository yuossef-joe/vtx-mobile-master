import 'package:applocation/app/constants/widgets.dart';
import 'package:applocation/domain/state_management/cubit/favorite_foods_cubit.dart';
import 'package:applocation/domain/state_management/states/favorite_foods_states.dart';
import 'package:applocation/presentation/resources/color_manager.dart';
import 'package:applocation/presentation/resources/routes_manager.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:iconly/iconly.dart';

import '../../../../app/constants.dart';
import '../../../../domain/model/models.dart';
import '../../../../domain/state_management/cubit/location_cubit.dart';
import '../../../../domain/state_management/states/location_states.dart';
import '../../../famous_places.dart';
import '../../../resources/styles_manager.dart';

class FavoriteFood extends StatefulWidget {
  const FavoriteFood({super.key});

  @override
  State<FavoriteFood> createState() => _FavoriteFoodState();
}

Stack stackImage(Widget image, Widget column) => Stack(
      alignment: Alignment.bottomLeft,
      children: [
        image,
        column,
      ],
    );

class _FavoriteFoodState extends State<FavoriteFood> {
  dynamic _locationContent([Widget? child, String? error]) => defaultContainer(
        child: child ??
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themes = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    if(context.read<LocationCubit>().state is LocationInitial)
      {
        context.read<LocationCubit>().initial();
      }
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) async {
        if(state is LocationInitial)
          {
            print('this is state $state');
            if(await context.read<LocationCubit>().isLocationServiceEnabled){
              await context.read<LocationCubit>().getLocation();
            }
          }
        if (state is LocationLoaded) {
          List<Placemark> placeMarks = await placemarkFromCoordinates(
              state.position.latitude, state.position.longitude);
          context
              .read<FavoriteFoodsCubit>()
              .fetchFavoriteFoods(0, 'Restaurant', placeMarks[0].country ?? '');
          setState(() {
          });
        }
      },
      builder: (context, state) {

        if (state is LocationInitial) {
           return _locationContent();
        } else if (state is LocationLoading) {
          return _locationContent(
            Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LocationError) {
          return _locationContent(
            null,
            state.error,
          );
        } else if (context.read<LocationCubit>().position!=null) {
          context
              .read<FavoriteFoodsCubit>()
              .fetchFavoriteFoods(0, 'Restaurant', context.read<LocationCubit>().country ?? '');
          return BlocConsumer<FavoriteFoodsCubit, FavoriteFoodsState>(
            builder: (context, state) {
              if (state is FavoriteFoodsLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FavoriteFoodsError) {
                return Center(
                  child: defaultText(text: state.error,style:  themes.titleLarge),
                );
              }
              else if (state is FavoriteFoodsLoaded)
              {
                return _getContent(size, themes,state.popularFoods,state.topRatedFoods);
              }
              else {
                return Container(
                );
              }
            },
            listener: (context, state) async {

            },
          );
        }
        return Center(child: Text(AppStrings.defaultContent.tr()
          ,style: TextStyle(color: Colors.red),));
      },
    );
  }

  dynamic _locDialog(BuildContext parentContext) => showDialog(
        context: parentContext,
        builder: (parentContext) {
          return Dialog(
            child: Container(),

            // PopScope(
            //   onPopInvokedWithResult: (didPop, result) {
            //     if(parentContext.read<LocationCubit>().state is LocationLoading)
            //     {
            //       context.read<LocationCubit>().errorEmitter('Failed to Get Location');
            //     }
            //   },
            //   child:
            // ),
          );
        },
      );

  Widget _getContent(Size size, TextTheme themes,List<PopularPlace> popularPlaces,List<TopPlace> topPlaces) => Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.074,
            right: size.width * 0.05,
            left: size.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _tittleSection(size, themes),
              SizedBox(
                height: size.height * 0.02,
              ),
              _searchSection(size),
              SizedBox(
                height: size.height * 0.02,
              ),
              _headlineImage(size, themes),
              SizedBox(
                height: size.height * 0.02,
              ),
              _mostPopularBanner(size, themes,popularPlaces),
              SizedBox(
                height: size.height * 0.02,
              ),
              _mostPopularSection(size,
                  themes,
                  popularPlaces.isNotEmpty?popularPlaces[0]:null,
                  popularPlaces.length>1?popularPlaces[1]:null,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              _highestRated(size, themes,topPlaces),
              _mostPopularSection(size, themes,null,null,
                topPlaces.isNotEmpty?topPlaces[0]:null,
              ),
            ],
          ),
        ),
      );

  Widget _tittleSection(Size size, TextTheme themes) => Row(
        children: [
          defaultContainer(
            height: size.height * 0.074,
            width: size.width * 0.68,
            child: defaultText(
                text: AppStrings.discoverFavoriteFood.tr(),
                style: themes.headlineLarge!),
          ),
          Spacer(),
          // Icon(
          //   IconlyBold.heart,
          //   color: Color.fromRGBO(121, 163, 211, 1),
          //   size:size.width * 0.07 ,
          // ),
          // SizedBox(
          //   width: size.width * 0.02,
          // ),
          // Icon(IconlyBold.notification,
          //     color: Color.fromRGBO(121, 163, 211, 1),
          //     size: size.width * 0.07),
        ],
      );

  Row _searchSection(Size size) => Row(
        children: [
          defaultGestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.searchScreenRoute);
            },
            child: searchBar(
                size: size,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        IconlyLight.search,
                        color: Color.fromRGBO(151, 151, 151, 1),
                      ),
                    ),
                    Text(
                      AppStrings.search.tr(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(4, 11, 18, 1).withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
                width: 0.71),
          ),
          SizedBox(
            width: size.width * 0.0345,
          ),
          // defaultIconButton(
          //     onPressed: () {},
          //     size: size.width * 0.08,
          //     icon: IconlyBold.filter,
          //     color: ColorManager.primary
          // ),
        ],
      );

  Stack _headlineImage(Size size, TextTheme themes) => stackImage(
        circular_image(
          width: size.width * 0.9,
          height: size.height * 0.185,
          image:
              'https://s3-alpha-sig.figma.com/img/5001/3514/b657864cf057dccc0706deee2f833303?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=j1fBJr0JJwP4yPA-gM8GAx8NCRAhXrwqdvaZU37V69ZeNTDwwaCvrVhbQtcTtWzXy3YiNOPmB8PiP~QPe-xUvQeVFDT~RErpsRB44IP8ZTU3RA4UDJo8VIE7nSlWN8YvAfwUWdi~Hl2UxWvj6slIkmQ-VkhKCVJGA9DPKLkAN-Oo3eaaAEoTyDQWfonfJ~tKS8Ie~5B13ltwIjm2kMVteIizHTeNWgxK6ddQSNeG72wY54z8AHSImYW8AWncsb6xKfou1L7icrXQZXPn9fXYXK7ytmOOSSIuUwbMeXQHvUlI6oU2h-bBkl-8IUsiAboZSR1VY5~ET6N9-Qh9XKOjlg__',
        ),
        imageColumn(
            defaultContainer(
              height: size.height * 0.072,
              width: size.width * 0.82,
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.046),
              child: defaultText(
                text: AppStrings.newRestaurant.tr(),
                style: buttonTextStyle(color: ColorManager.white, fontSize: 19),
              ),
            ),
            Container(
                // margin: EdgeInsets.only(left: size.width * 0.046, bottom: size.height * 0.027),
                // height: size.height * 0.041,
                // width: size.width * 0.24,
                // child: TextButton(
                //   style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(ColorManager.white),),
                //   onPressed: () {},
                //   child: Text(
                //     AppStrings.visitNow.tr(),
                //     maxLines: 1,
                //     style: TextStyle(
                //       fontSize: 14,
                //       color: ColorManager.lightBlue,
                //     ),
                //   ),
                // )
                )),
      );

  Row _mostPopularBanner(Size size, TextTheme themes,List<PopularPlace> data) => spacedRow(
      defaultContainer(
        height: size.height * 0.025,
        child: defaultText(
            text: AppStrings.mostPopular.tr(), style: themes.titleLarge!),
      ),
      defaultGestureDetector(
          child: defaultText(
            text: AppStrings.viewMore.tr(),
            style: headLineTextHighest(color: ColorManager.lightBlue),
          ),
          onTap: () {
            Navigator.pushNamed(context, Routes.famousPlacesRoute,arguments:[data ,placeView.popularPlace] );
          }));
  Container _highestRated(Size size, TextTheme themes,List<TopPlace> data) => defaultContainer(
        child: spacedRow(
            defaultContainer(
              height: size.height * 0.025,
              width: size.width * 0.6,
              child: defaultText(
                  text: AppStrings.highestRated.tr(),
                  style: themes.titleLarge!),
            ),
            defaultGestureDetector(
                child: defaultText(
                  text: AppStrings.viewMore.tr(),
                  style: headLineTextHighest(color: ColorManager.lightBlue),
                ),
                onTap: () {
                  Navigator.pushNamed(context, Routes.famousPlacesRoute,arguments:[data ,placeView.topPlace] );
                }
            )),
      );

  Container _highestRatedSection(Size size, TextTheme themes,TopPlace? data) =>
      circularBorderContainer(
          size: size,
          width: 0.86,
          height: 0.11,
          child: data!=null?Row(
            children: [
              circular_image(
                  height: size.height * 0.079,
                  width: size.width * 0.17,
                  image:
                      '${Constants.baseUrlImages}${data.image}'),
              SizedBox(
                width: size.width * 0.055,
              ),
              defaultContainer(
                height: size.height * 0.043,
                width: size.width * 0.3,
                child: defaultText(
                    text: AppStrings.sushiCollection.tr(),
                    style: headLineTextHighest(color: ColorManager.black)),
              ),
              defaultGestureDetector(
                  child: Icon(
                    Icons.location_on_outlined,
                    color: ColorManager.primary,
                  ),
                  onTap: () {}),
              defaultContainer(
                height: size.height * 0.032,
                width: size.width * 0.243,
                child: defaultText(
                    text: AppStrings.alexandria.tr(),
                    style: themes.headlineMedium!),
              )
            ],
          ):Container(),
          color: ColorManager.white,
          padding: EdgeInsets.only(
              top: size.height * 0.0137,
              bottom: size.height * 0.0137,
              left: size.width * 0.03),
          margin: EdgeInsets.only(
              top: size.height * 0.018, left: size.width * 0.018));

  GestureDetector _placeItemDetector(Size size,TextTheme themes,int id, String image,String tittle,String address)=>defaultGestureDetector(
    onTap: (){
      Navigator.pushNamed(context, Routes.placeProfile,arguments: id);
    },
    child: circularBorderContainer(
      size: size,
      height:  0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          circular_image(
              height: size.height * 0.079,
              width: size.width * 0.17,
              image:
              '${Constants.baseUrlImages}$image'),
          SizedBox(
            width: size.width * 0.055,
          ),
          defaultContainer(
            width: size.width * 0.3,
            child: defaultText(
                maxLines: 2,
                flow: TextOverflow.ellipsis,
                text: tittle,
                style:
                headLineTextHighest(color: ColorManager.black)),
          ),
          defaultGestureDetector(
              child: Icon(
                Icons.location_on_outlined,
                color: ColorManager.primary,
              ),
              onTap: () {}),
          defaultContainer(
            height: size.height * 0.032,
            width: size.width * 0.243,
            child: defaultText(
                text: address,
                style: themes.headlineMedium!),
          )
        ],
      ),
    ),
  );


  Container _mostPopularSection(Size size, TextTheme themes,[PopularPlace? one,PopularPlace? two,TopPlace? three]) =>
      defaultContainer(
        height: size.height * 0.23,
        child:  Column(
          children: [
            three!=null?_placeItemDetector(size,themes,three.id,three.image,three.title,three.location):Container(),
            one!=null?_placeItemDetector(size,themes,one.id,one.image,one.title,one.location):Container(),
            SizedBox(
              height: size.height * 0.02,
            ),
            two!=null?_placeItemDetector(size,themes,two.id,two.image,two.title,two.location):Container(),
          ],
        ),
        // circularBorderContainer(
        //     size: size,
        //     width: 0.86,
        //     height: 0.12,
        //     child:
        //     color: ColorManager.white,
        //     padding: EdgeInsets.only(
        //         top: size.height * 0.0137,
        //         bottom: size.height * 0.0137,
        //         left: size.width * 0.03),
        //     margin: EdgeInsets.only(
        //         top: size.height * 0.018, left: size.width * 0.018)),
      );
}
