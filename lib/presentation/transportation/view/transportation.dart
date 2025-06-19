import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/model/transportation_models.dart';
import 'package:applocation/domain/state_management/cubit/location_cubit.dart';
import 'package:applocation/domain/state_management/cubit/transportation_cubit.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:applocation/app/constants/widgets.dart';
import 'package:applocation/presentation/resources/values_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/constants.dart';
import '../../../domain/state_management/states/transportation_states.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';

class TransportationScreen extends StatefulWidget {
  const TransportationScreen({super.key});

  @override
  State<TransportationScreen> createState() => _TransportationScreenState();
}

TextStyle hourStyle(bool flag)=>TextStyle(
  fontFamily: 'Ciutadella',
  color: Color.fromRGBO(244, 57, 57, 1),
  fontSize: flag? 13.5:22.51,
  fontWeight: FontWeight.w400,
  height: flag? 16.21 / 13.5: 27/22.51, // Calculate line height ratio
  textBaseline: TextBaseline.alphabetic,
  decoration: TextDecoration.none,
);

class _TransportationScreenState extends State<TransportationScreen> {
  
  @override
  void initState() {
    super.initState();
    final position = context.read<LocationCubit>().position;
    context.read<TransportationCubit>().fetchTransportation(NearByTransportationParameters(position!.latitude,position.longitude , 100000000000000.5));
  }
  
  CategoryResponseModel? category;
  NearByTransportationModel? trans;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themes = Theme.of(context).textTheme;

    return BlocConsumer<TransportationCubit,TransportationState>(builder: (context, state) {
      if (state is TransportationLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      else if(category!=null && trans!=null)
      {
        return _getContent(size, themes,trans!,category!);
      }
      else if(state is TransportationError)
        {
          return Scaffold(
            body: Center(child: Text(state.message,style: themes.titleLarge,)),
          );
        }
      else {
        return Center(child: Text(AppStrings.noDataAvailable.tr()));
      }
    }, listener: (context, state) {
      if(state is TransportationLoaded)
      {
      category = state.category;
      trans = state.data;
      }
      if(state is TransportationError)
      {
        trans = null;
        category = null;
      }
      if(state is TransportationFilterLoaded) {
        Navigator.pushNamed(context, Routes.categoryTransportation,arguments: [context.read<LocationCubit>().position,state.data.transportations]);
        context.read<TransportationCubit>().stateEmit(TransportationLoaded(trans!,category!));
      }
    },);
  }
  }


  Widget _getContent(Size size,TextTheme themes,NearByTransportationModel data,CategoryResponseModel category)=> Scaffold(
    appBar: profileAppBar(themes),
    bottomNavigationBar: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Color.fromRGBO(198, 198, 200, 1), spreadRadius: AppSize.s1)
      ]),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: ColorManager.lightGrey,
        currentIndex: _currentIndex,
        onTap: onTap,
        items:   [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined), label: AppStrings.home.tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.wallet), label: AppStrings.search.tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.food_bank_outlined),
              label: AppStrings.restaurants.tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person_2_outlined), label:
          AppStrings.profile.tr()
            // AppStrings.profile.tr()
          ),
        ],
      ),
    ),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.056),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height*0.037,),
            _buildSearchBar(size),
            SizedBox(height: size.height*0.034,),
            _buildCategorySection(size, themes,category.list!),
            SizedBox(height: size.height*0.033,),
            buildNearestTransportationSection(size, themes,data.transportations),
          ],
        ),
      ),
    ),
  );
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: AppStrings.location.tr()
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.home.tr()
        ),
      ],
    );
  }

  Widget _buildSearchBar(Size size) {
    return defaultGestureDetector(
      child: searchBar(size: size),
      onTap: () => print('search pressed'),
    );
  }
  onTap(int index) {
    setState(() {
      _currentIndex = index;
      //_title = titles[index];
    });
  }

  Widget _buildCategorySection(Size size, TextTheme themes,List<Category> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        defaultText(text: AppStrings.categories.tr(), style: themes.titleLarge!),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(child: defaultGestureDetector( onTap: (){Navigator.pushNamed(context, Routes.categoryTransportation,arguments: [context.read<LocationCubit>().position,data],);},child: _VehicleItem(size: size, themes: themes, title: data[0].name, imageUrl: data[0].image))),
            SizedBox(width: AppSize.s8),
            Expanded(child: _VehicleItem(size: size, themes: themes, title: data[1].name, imageUrl: data[1].image)),
            SizedBox(width: AppSize.s8),
            Expanded(child: _VehicleItem(size: size, themes: themes, title: data[2].name, imageUrl:data[2].image)),
          ],
        ),
      ],
    );
  }


}

Widget buildNearestTransportationSection(Size size, TextTheme themes,List<Transportation>data) {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        defaultText(text: AppStrings.nearestTransportation.tr(), style: themes.titleLarge!),
        SizedBox(height: size.height*0.02,),
        TransportationList( size,  themes,data),
      ],
    ),
  );
}

class _VehicleItem extends StatelessWidget {
  final Size size;
  final TextTheme themes;
  final String title;
  final String imageUrl;

  const _VehicleItem({
    required this.size,
    required this.themes,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return defaultGestureDetector(
      onTap: (){
        context.read<TransportationCubit>().getNearByTransportationFiltered(
          NearByCategoricalTransportationParameters(title, context.read<LocationCubit>().position!.latitude,
              context.read<LocationCubit>().position!.longitude, 1000000000000),
        );
      },
      child: circularBorderContainer(
        size: size,
        height: 0.11,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: circular_image(image:'${Constants.baseUrlImages}$imageUrl', fit: BoxFit.scaleDown),
            ),
            defaultText(text: title, style: themes.headlineSmall!),
          ],
        ),
        color: ColorManager.searchGrey,
      ),
    );
  }
}

class TransportationList extends StatelessWidget {
  final Size size;
  final TextTheme themes;
  final List<Transportation> data;
  const TransportationList(
      this.size,
      this.themes,
      this.data, {super.key}
      );

  @override
  Widget build(BuildContext context) {
    return defaultContainer(
      height: size.height * 0.43,
      width: size.width,
      child: ListView.separated(
        itemBuilder: (context, index) => _TransportationItem( size,  themes,data[index].image,data[index].name,data[index].location,data[index].price,data[index].distance),
        separatorBuilder: (context, index) => SizedBox(height:0),
        itemCount: data.length,
      ),
    );
  }
}

class _TransportationItem extends StatelessWidget {
  final Size size;
  final TextTheme themes;
  final String image,name,address,price;
  final int distance;
  const _TransportationItem(
      this.size,
      this.themes,
      this.image,
      this.name,
      this.address,
      this.price,
      this.distance,
  );

  @override
  Widget build(BuildContext context) {
    return defaultContainer(
      height: size.height * 0.175,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: circular_image(
              circle: 16,
              height:size.height * 0.144,
              image: '${Constants.baseUrlImages}$image',
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppMargin.m12,vertical: AppPadding.p12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultText(text: name, style: themes.headlineSmall!),
                  SizedBox(height: AppSize.s4,),
                  defaultText(text: address, style: themes.headlineMedium!),
                  SizedBox(height: size.height*0.027,),
                  RichText(
                    text: TextSpan(
                      text: '\$$price', // Main price part
                      style: hourStyle(false),
                      children: [
                        TextSpan(
                          text: '/hour', // Smaller font span
                          style: hourStyle(true),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),

          Expanded(
              flex: 1,
              child: circularBorderContainer(
                size: size,
                child: Text(
                  '${distance}km',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
                color: Color.fromRGBO(255, 243, 243, 1),
              )),
        ],
      ),

    );
  }
}

// Image URLs as constants for better maintainability