import 'package:applocation/app/constants/widgets.dart';
import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/state_management/cubit/places_filter.dart';
import 'package:applocation/domain/state_management/states/filter_place_states.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/constants.dart';
import '../../famous_places.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
DateTime _selectedDate = DateTime.now();
// final List<String> locations = [
//   'Cairo',
//   'Alexandria',
//   'Giza',
//   'Luxor',
//   'Aswan',
//   'Hurghada',
//   'Sharm El Sheikh',
//   'Marsa Matrouh'
// ];
final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});
  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  int daysInMonth=30,selected=0,stars=3;
  String country='',type='',date='';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme themes = Theme.of(context).textTheme;
    daysInMonth = getDaysInMonth(_selectedDate.year, _selectedDate.month);
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<PlaceFilterCubit,PlaceFilterState>(
          builder: (context, state) {
            return _getContent(size,themes);
          },
          listener: (context, state) {
            if(state is PlaceFilterError)
              {
              }
            else if(state is PlaceFilterLoaded)
              {
                Navigator.pushReplacementNamed(context, Routes.famousPlacesRoute,arguments: [state.filtered,placeView.popularPlace]);
              }
          },),
      ),
    );
  }

  Widget _getContent(Size size,TextTheme themes)=>Padding(
    padding: EdgeInsets.all(AppPadding.p16),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _barRow(themes),
        defaultText(text: AppStrings.availableOn.tr(),style: filterTitles()),
        _dateRow(),
        _weekDaysBuilder(size,themes),
        defaultText(text: AppStrings.country.tr(),style: filterTitles()),
        _buildTypeSelection(themes),
        defaultText(text: AppStrings.rating.tr(),style: filterTitles()),
        _buildRatingSelection(themes),
        defaultText(text: AppStrings.serviceFor.tr(),style: filterTitles()),
        _buildServiceSelection(),
        _buildShowResultButton(size),
      ],
    ),
  );

  Widget _weekDaysBuilder(Size size,TextTheme themes)=> defaultContainer(
    height: size.height * 0.1,
    child: ListView.builder(
      itemBuilder: (context, index) {
        return defaultGestureDetector(
          child: daysBuilder(size, themes, _selectedDate.year,_selectedDate.month, index + 1, selected),
          onTap: () {
            setState(() {
              selected = index + 1;
              date = dateFormatter.format(DateTime(_selectedDate.year,_selectedDate.month,selected));
            });
          },
        );
      },
      itemCount: daysInMonth,
      scrollDirection: Axis.horizontal,
    ),
  );

  Widget _buildDatePicker() {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildDateItem(AppStrings.wed.tr(), '9'),
          _buildDateItem(AppStrings.thu.tr(), '10', isSelected: true),
          _buildDateItem(AppStrings.fri.tr(), '11'),
          _buildDateItem(AppStrings.sat.tr(), '12'),
          _buildDateItem(AppStrings.sun.tr(), '13'),
        ],
      ),
    );
  }

  Row _barRow(TextTheme themes){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        defaultGestureDetector(
          child: defaultText(text: AppStrings.cancel.tr(),style: themes.labelMedium),
            onTap: (){
              Navigator.pop(context);
            }
        ),
        defaultText(text: AppStrings.filter.tr(),style: themes.titleLarge),
        defaultGestureDetector(
          child: defaultText(text: AppStrings.reset.tr(),style: TextStyle(
            color: Color.fromRGBO(237, 76, 92, 1),
              fontSize:16.29,
             fontWeight: FontWeight.w600,
            fontFamily: "Manrope"
          )),
          onTap: (){
            setState(() {
               daysInMonth=30;selected=0;
              stars = 3;
              country='';
              type='';
              _selectedDate=DateTime.now();
            });
          }
        ),
      ],
    );
  }

  Widget _buildDateItem(String day, String date, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Text(day,
              style: TextStyle(color: isSelected ? Colors.blue : Colors.grey)),
          SizedBox(height: 4),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
            ),
            child: Text(
              date,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeSelection(TextTheme themes) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: Constants.countries.map((location) => _buildTypeButton(location,themes)).toList(),
    );
  }



  Widget _buildRatingSelection(TextTheme themes) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        defaultGestureDetector(
            onTap: () {
              setState(() {
                stars = 1;
              });
            },
            child: _buildStarIcon(isFilled: stars>0?true:false)),
        defaultGestureDetector(
            onTap: () {
              setState(() {
                stars = 2;
              });
            },
            child: _buildStarIcon(isFilled: stars>1?true:false)),
        defaultGestureDetector(
            onTap: () {
              setState(() {
                stars = 3;
              });
            },
            child: _buildStarIcon(isFilled: stars>2?true:false)),
        defaultGestureDetector(
            onTap: () {
              setState(() {
                stars = 4;
              });
            },
            child: _buildStarIcon(isFilled: stars>3?true:false)),
        defaultGestureDetector(
            onTap: () {
              setState(() {
                stars = 5;
              });
            },
            child: _buildStarIcon(isFilled: stars>4?true:false)),
        SizedBox(width: 10),
        Text('$stars Star', style: themes.headlineSmall),
      ],
    );
  }


  Row _dateRow(){
    final monthYear = DateFormat('MMMM, yyyy').format(_selectedDate);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left Arrow Button
        IconButton(
          style: IconButton.styleFrom(backgroundColor: ColorManager.white),
          icon: Icon(Icons.arrow_left, color: Colors.black),
          onPressed: _previousMonth,
        ),
        // Month and Year Text
        Text(
          monthYear,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF111111), // Adjust based on Figma design
          ),
        ),
        // Right Arrow Button
        IconButton(
          style: IconButton.styleFrom(backgroundColor: ColorManager.white),
          icon: Icon(Icons.arrow_right, color: Colors.black),
          onPressed: _nextMonth,
        ),
      ],
    );
  }

  void _previousMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1);
      daysInMonth = getDaysInMonth(_selectedDate.year, _selectedDate.month);
    });
  }

  // Method to switch to the next month
  void _nextMonth() {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1);
      daysInMonth = getDaysInMonth(_selectedDate.year, _selectedDate.month);
    });
  }

  Widget _buildStarIcon({bool isFilled = false}) {
    return Icon(
      isFilled ? Icons.star : Icons.star_border,
      color: Colors.orange,
    );
  }

  Widget _buildServiceSelection() {
    return Wrap(
      spacing: 8.0,
      children: [
        _buildServiceButton(AppStrings.restaurants.tr()),
        _buildServiceButton(AppStrings.lounge.tr()),
        _buildServiceButton(AppStrings.party.tr()),
      ],
    );
  }
  Widget _buildTypeButton(String text,TextTheme themes) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          country=text;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: country==text? Color.fromRGBO(225, 245, 250, 1): ColorManager.white,
        side: BorderSide(color:
        country==text? ColorManager.primary:Color.fromRGBO(173, 179, 188, 1)
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: defaultText(text: text,style:
      TextStyle(
        color:  country==text? ColorManager.primary: Color.fromRGBO(17, 17, 17, 1),
        fontSize: AppSize.s12,
        fontWeight: FontWeight.w600,
      ),
      ),
    );
  }

  Widget _buildServiceButton(String text) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          type=text;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: type==text? Color.fromRGBO(225, 245, 250, 1):ColorManager.white,
        side: BorderSide(color:
        type==text? ColorManager.primary:Color.fromRGBO(173, 179, 188, 1)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style:   TextStyle(
          color:  type==text? ColorManager.primary: Color.fromRGBO(17, 17, 17, 1),
          fontSize: AppSize.s12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }



  Widget _buildShowResultButton(Size size) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<PlaceFilterCubit>().getFilteredPlaces(
            FilterPlacesParameters(country, date, stars, type),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          minimumSize: Size(size.width * 0.8, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          AppStrings.showResult.tr(),
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}



