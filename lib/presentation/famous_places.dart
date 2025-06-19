import 'package:applocation/presentation/resources/color_manager.dart';
import 'package:applocation/presentation/resources/routes_manager.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:applocation/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../app/constants.dart';
import '../app/constants/widgets.dart';
import '../domain/model/models.dart';

enum placeView { famousPlace, topPlace, popularPlace }

final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

class FamousPlacesScreen extends StatefulWidget {
  final List<AbstractPlace>? famousPlaces;
  final placeView type;
  const FamousPlacesScreen({super.key, this.famousPlaces, required this.type});

  @override
  State<FamousPlacesScreen> createState() => _FamousPlacesScreenState();
}

class _FamousPlacesScreenState extends State<FamousPlacesScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      key: key,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        leading: IconButton(
          style: IconButton.styleFrom(backgroundColor: ColorManager.white),
          icon: Icon(Icons.arrow_back_ios, color: ColorManager.primary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppStrings.mostPopular.tr(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            style: IconButton.styleFrom(backgroundColor: ColorManager.white),
            icon: Icon(Icons.search, color: ColorManager.primary),
            onPressed: () {
              Navigator.pushNamed(context, Routes.searchScreenRoute);
            },
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _listType(size, theme, widget.famousPlaces, widget.type),
          sortAndFilter(context, Size(size.width * 0.282, size.height * 0.037)),
        ],
      ),
    );
  }
}

Widget _listType(
    Size size, TextTheme theme, List<AbstractPlace>? data, placeView type) {
  switch (type) {
    case placeView.famousPlace:
      return _famousSection(size, theme, data as List<FamousPlace>);
    case placeView.topPlace:
      return _topSection(size, theme, data as List<TopPlace>);
    case placeView.popularPlace:
      return _popularSection(size, theme, data as List<PopularPlace>);
  }
}

Container _topSection(
        Size size, TextTheme textThemes, List<TopPlace>? topPlaces) =>
    defaultContainer(
      height: size.height * 0.914,
      width: null,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => defaultGestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.placeProfile,
                arguments: topPlaces![index].id);
          },
          child: Center(
            child: famous_builder(
              '${Constants.baseUrlImages}${topPlaces?[index].image}',
              '${topPlaces?[index].title}',
              '${topPlaces?[index].description}',
              size.height * 0.21,
              size.width * 0.915,
              size.height * 0.03,
              textThemes.bodyLarge!,
              textThemes.titleSmall!,
            ),
          ),
        ),
        separatorBuilder: (context, index) =>
            SizedBox(height: size.height * 0.02),
        itemCount: topPlaces?.length ?? 0,
      ),
    );

Container _popularSection(
        Size size, TextTheme textThemes, List<PopularPlace>? popularPlaces) =>
    defaultContainer(
      height: size.height * 0.914,
      width: null,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.placeProfile,
                arguments: popularPlaces![index].id);
          },
          child: Center(
            child: famous_builder(
              '${Constants.baseUrlImages}${popularPlaces?[index].image}',
              '${popularPlaces?[index].title}',
              '${popularPlaces?[index].description}',
              size.height * 0.21,
              size.width * 0.915,
              size.height * 0.03,
              textThemes.bodyLarge!,
              textThemes.titleSmall!,
            ),
          ),
        ),
        separatorBuilder: (context, index) =>
            SizedBox(height: size.height * 0.02),
        itemCount: popularPlaces?.length ?? 0,
      ),
    );

Container _famousSection(
        Size size, TextTheme textThemes, List<FamousPlace>? famousPlaces) =>
    defaultContainer(
      height: size.height * 0.914,
      width: null,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => defaultGestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.placeProfile,
                arguments: famousPlaces![index].id);
          },
          child: Center(
            child: famous_builder(
              '${Constants.baseUrlImages}${famousPlaces?[index].image}',
              '${famousPlaces?[index].title}',
              '${famousPlaces?[index].description}',
              size.height * 0.21,
              size.width * 0.915,
              size.height * 0.03,
              textThemes.bodyLarge!,
              textThemes.titleSmall!,
            ),
          ),
        ),
        separatorBuilder: (context, index) =>
            SizedBox(height: size.height * 0.02),
        itemCount: famousPlaces?.length ?? 0,
      ),
    );

Container sortAndFilter(BuildContext context, Size size) => defaultContainer(
      margin: EdgeInsets.only(bottom: AppMargin.m8),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, Routes.sortAndFilter);
        },
        icon: const Icon(
          Icons.filter_list,
          color: Colors.black,
          size: 10,
        ),
        label: Text(
          AppStrings.sortFilter.tr(),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 7.82,
            fontFamily: 'Nunito',
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          fixedSize: size,
          //padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          shadowColor: Colors.black.withOpacity(0.1),
          elevation: 5,
        ),
      ),
    );
