import 'package:applocation/app/constants/widgets.dart';
import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/state_management/cubit/booking_cubit.dart';
import 'package:applocation/domain/state_management/cubit/booking_states.dart';
import 'package:applocation/presentation/resources/color_manager.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:applocation/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/constants.dart';
OnePlaceModel? data;
class BookingView extends StatefulWidget {
  const BookingView({super.key, required this.placeId});
  final int placeId;
  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    selectedMonth = months[DateTime.now().month - 1];
    //context.read<BookingCubit>().fetchBookingData(widget.placeId);
  }
  int guests=1;
  String time='',gender='',date='';
  int daysInMonth=30,selected=1;
  final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final textThemes = Theme
        .of(context)
        .textTheme;
    daysInMonth = getDaysInMonth(DateTime.now().year, DateTime.now().month);
    return  Scaffold(
        key: _key,
        body:BlocConsumer<BookingCubit, BookingState>(
          listener: (context, state) {
            if (state is BookingError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is BookingSuccess) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.response.data!.msg)),
              );
            }
            else if (state is BookingLoaded) {
              data = state.data.data?.nest;
            }
          },
          builder: (context, state) {
            if (state is BookingLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (data!=null) {
              return _getContent(size,textThemes,data);
            } else {
              return  Center(child: Text(AppStrings.noDataAvailable.tr()));
            }
          },
        ),
    );
  }

  Widget _getContent(Size size,TextTheme textThemes,OnePlaceModel? data)=>Stack(
    alignment: Alignment.bottomCenter,
    children: [
      circular_image(
          height: size.height,
          width: size.width,
          image: '${Constants.baseUrlImages}${data
              ?.image}',
          circle: 0),
      Padding(
        padding: EdgeInsets.all(AppPadding.p18),
        child: _section(size, textThemes,data ?? OnePlaceModel(0, '', '', '', '', 0, 0,'', '', 0, '', '', '', '', '', null)),
      ),
    ],
  );

  Container _section(Size size, TextTheme textThemes,OnePlaceModel place) {
    String subs='';
    for(SubCategoryModel sub in place.category?.subCategories??[] ) {
      subs+= "${sub.name} . ";
    }

    return   circularBorderContainer(
      size: size,
      child: _contentColumn(
          size: size,
          themes: textThemes,
          category: subs,
          name: place.title,
          address: place.location,
          star: place.ratingsSumTotal,
          num: 'k',
          discount: '${place.discount}',
          pac: '6'),
      color: ColorManager.white,
    );
  }

  Padding _contentColumn({required Size size,
    required TextTheme themes,
    String category = '',
    String name = '',
    String address = '',
    String star = '',
    String num = '',
    String discount = '',
    String pac = '',}) =>
      Padding(
        padding: EdgeInsets.only(
          left: AppPadding.p14,
          top: AppPadding.p14,
          bottom: AppPadding.p14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _customSpacedRow(size, themes.labelMedium!, category),
            defaultText(text: name, style: themes.titleLarge!),
            SizedBox.fromSize(
              size: Size(10, 10),
            ),
            defaultText(text: address, style: themes.headlineMedium!),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 20,
                ),
                SizedBox.fromSize(
                  size: Size(10, 0),
                ),
                defaultText(
                    text: '$star ($num)', style: themes.headlineMedium!),
                SizedBox.fromSize(
                  size: Size(20, 0),
                ),
                Icon(
                  Icons.price_change_outlined,
                  size: 20,
                ),
                defaultText(
                  text: '$discount% ($pac pax available)',
                  style: TextStyle(color: Color.fromRGBO(21, 103, 120, 1)),
                ),
              ],
            ),
            SizedBox.fromSize(
              size: Size(10, 10),
            ),
            Center(
              child: defaultContainer(
                width: size.width * 0.8,
                child: defaultTextButton(
                    circular: size.height * 0.33,
                    size: size,
                    onPressed: () {
                      if (_key.currentState != null) {
                        _key.currentState!.showBottomSheet(
                              (context) =>
                              circularBorderContainer(
                                size: size,
                                width: 1,
                                height: 0.66,
                                child: _sheetContent(size, themes),
                                color: ColorManager.white,
                                circle: null,
                                topLeft: AppSize.s20,
                                padding: EdgeInsets.all(AppPadding.p14),
                              ),
                        );
                      }
                    }, text: AppStrings.bookNow.tr()),
              ),
            ),
          ],
        ),
      );


  OutlinedButton _outlinedButton(Size size,String hour)=>defaultOutlinedButton(
      size: size,
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
              time==hour?ColorManager.primary:ColorManager.white)),
      onPressed: () {
        setState(() {
          time = hour;
        });
      },
      child: defaultText(text:
      hour,
        style: TextStyle(
          fontSize: AppSize.s12,
          color: time == hour ?Colors.white:ColorManager.primary,
        ),
      ));


  Widget _timeSection(Size size,TextTheme textTheme)=>  StatefulBuilder(
    builder: (context, setState) {
      return circularBorderContainer(
        size: size,
        width: 1,
        height: 0.17,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(AppPadding.p8),
              child:
              defaultText(
                  text: AppStrings.selectTime.tr(), style: textTheme.headlineSmall!),
            ),
            defaultContainer(
              margin: EdgeInsets.symmetric(horizontal: AppMargin.m8),
              child: Row(
                children: [
                  Expanded(
                    child:GestureDetector(onTap: (){},child: _outlinedButton(size,'17:00')),
                  ),
                  SizedBox(
                    width: AppSize.s8,
                  ),
                  Expanded(
                    child: defaultOutlinedButton(
                        size: size,
                        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(time=='17:30'?ColorManager.primary:ColorManager.white)),
                        onPressed: () {
                          setState(() {

                          });
                          time = '17:30';
                        },
                        child: defaultText(text:
                        '17:30',
                          style: textTheme.labelMedium!,
                        )),
                  ),
                  SizedBox(
                    width: AppSize.s8,
                  ),
                  Expanded(
                    child: defaultOutlinedButton(
                        size: size,
                        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(time=='18:00'?ColorManager.primary:ColorManager.white)),
                        onPressed: () {
                          setState(() {

                          });
                          time = '18:00';
                        },
                        child: defaultText(text:
                        '18:00',
                          style: textTheme.labelMedium!,
                        )),
                  ),
                  SizedBox(
                    width: AppSize.s8,
                  ),
                  Expanded(
                    child: defaultOutlinedButton(
                        size: size,
                        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(time=='18:30'?ColorManager.primary:ColorManager.white)),
                        onPressed: () {
                          setState(() {

                          });
                          time = '18:30';
                        },
                        child: defaultText(text:
                        '18:30',
                          style: textTheme.labelMedium!,
                        )),
                  ),
                ],
              ),
            ),
            defaultContainer(
              margin: EdgeInsets.symmetric(horizontal: AppMargin.m8),
              child: Row(
                children: [
                  Expanded(
                    child: defaultOutlinedButton(
                        size: size,
                        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(time=='19:00'?ColorManager.primary:ColorManager.white)),
                        onPressed: () {
                          setState(() {

                          });
                          time = '19:00';
                        },
                        child: defaultText(text:
                        '19:00',
                          style: textTheme.labelMedium!,
                        )),
                  ),
                  SizedBox(
                    width: AppSize.s8,
                  ),
                  Expanded(
                    child: defaultOutlinedButton(
                        size: size,
                        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(time=='19:30'?ColorManager.primary:ColorManager.white)),
                        onPressed: () {
                          setState(() {

                          });
                          time = '19:30';
                        },
                        child: defaultText(text:
                        '19:30',
                          style: textTheme.labelMedium!,
                        )),
                  ),
                  SizedBox(
                    width: AppSize.s8,
                  ),
                  Expanded(
                    child: defaultOutlinedButton(
                        size: size,
                        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(time=='20:00'?ColorManager.primary:ColorManager.white)),
                        onPressed: () {
                          setState(() {

                          });
                          time = '20:00';
                        },
                        child: defaultText(text:
                        '20:00',
                          flow: TextOverflow.ellipsis,
                          style: textTheme.labelMedium!,
                        )),
                  ),
                  SizedBox(
                    width: AppSize.s8,
                  ),
                  Expanded(
                    child: defaultOutlinedButton(
                        size: size,
                        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(time=='20:30'?ColorManager.primary:ColorManager.white)),
                        onPressed: () {
                          setState(() {

                          });
                          time = '20:30';
                        },
                        child: defaultText(text:
                        '20:30',
                          style: textTheme.labelMedium!,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
        color: ColorManager.white,
        border: Border.all(color: Color.fromRGBO(217, 217, 217, 0.9)),
      );
    },
  );
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  String selectedMonth='';
  // Default month
  int selectedDay = 3; // Default selected day
  Widget _sheetContent(Size size, TextTheme textTheme) =>
      StatefulBuilder(
        builder: (context,setState) {
          return Column(mainAxisSize: MainAxisSize.max, children: [
            defaultText(
              text: AppStrings.bookATable.tr(),
              style: textTheme.headlineSmall!,
            ),
            SizedBox(
              height: size.height * 0.029,
            ),
            circularBorderContainer(
              size: size,
              width: 1,
              height: 0.069,
              child: _guestsRow(size, textTheme),
              border: Border.all(color: Color.fromRGBO(217, 217, 217, 0.9)),
            ),
            SizedBox(
              height: size.height * 0.029,
            ),
            _timeSection(size, textTheme),
            SizedBox(
              height: size.height * 0.029,
            ),
            circularBorderContainer(
              padding: EdgeInsets.all(AppPadding.p8),
              size: size,
              width: 1,
              child: Column(
                children: [
                    spacedRow(defaultText(text: 'Date',style: textTheme.titleLarge), DropdownButton<String>(
                      value: selectedMonth,
                      underline: SizedBox(), // Remove default underline
                      items: months.map((month) {
                        return DropdownMenuItem(
                          value: month,
                          child: Text(month,style: textTheme.headlineSmall,),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedMonth = value!;
                          daysInMonth = getDaysInMonth(DateTime.now().year, (months.indexOf(value)+1));
                        });
                      },
                    ),),

                  _weekDaysBuilder(size,textTheme, (months.indexOf(selectedMonth)+1)),
                ],
              ),
              color: ColorManager.white,
              border: Border.all(color: Color.fromRGBO(217, 217, 217, 0.9)),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                defaultElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      dispose();
                    },
                    color: Color.fromRGBO(250, 249, 255, 1),
                    child:
                    Row(
                      children: [
                        defaultText(
                          text: AppStrings.cancel.tr(),
                          style: textTheme.headlineSmall,
                        ),
                        SizedBox(
                          width: AppSize.s8,
                        ),
                        Icon(
                          Icons.clear,
                          color: ColorManager.black,
                          size: 16,
                        )
                      ],
                    )),
                Spacer(),
                defaultElevatedButton(
                    onPressed: () {
                      if(time.isNotEmpty&&date.isNotEmpty)
                      {
                         context.read<BookingCubit>().confirmBooking(BookingInput(gender, guests, time, date, widget.placeId));
                      }
                      else{
                        String error='';
                      if(time.isEmpty)
                        {
                          error = AppStrings.specifyTimeError.tr();
                        }
                      else if(date.isEmpty)
                        {
                          error = AppStrings.specifyDateError.tr();
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error)),
                        );
                      }
                    },
                    child:
                    Row(
                      children: [
                        defaultText(
                          text:AppStrings.confirm.tr(),
                          style: textTheme.headlineSmall,
                        ),
                        SizedBox(
                          width: AppSize.s8,
                        ),
                        Icon(
                          Icons.table_restaurant_outlined,
                          color: ColorManager.black,
                          size: 16,
                        )
                      ],
                    ))
              ],
            ),
          ]);
        }
      );

  Widget _weekDaysBuilder(Size size,TextTheme themes,int month)=>
      StatefulBuilder(
        builder: (context,setState) {
          return defaultContainer(
              height: size.height * 0.1,
              child: ListView.builder(
          itemBuilder: (context, index) {
            return defaultGestureDetector(
              child: daysBuilder(size, themes,DateTime.now().year, month, index + 1, selected,true),
              onTap: () {
                setState(() {
                  selected = index + 1;
                  final formattedDate = DateTime(DateTime.now().year,month,selected);
                  date =_dateFormatter.format(formattedDate);
                });
              },
            );
          },
          itemCount: daysInMonth,
          scrollDirection: Axis.horizontal,
              ),
            );
        }
      );

  Widget _guestsRow(Size size, TextTheme textThemes) =>
      StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.all(AppPadding.p8),
            child: Row(
              children: [
                defaultText(text: AppStrings.guests.tr(), style: textThemes.titleLarge!),
                Spacer(),
                circularBorderContainer(
                  size: size,
                  width: 0.32,
                  height: 0.048,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      defaultIconButton(
                        transparent: true,
                        color: ColorManager.white,
                        onPressed: () {
                          setState(() {
                            guests>0?guests--:guests+=0;
                          });
                        },
                        icon: Icons.remove_circle_outline,
                      ),
                      defaultText(
                        text:'$guests',
                        style: textThemes.bodyLarge!,
                      ),
                      defaultIconButton(
                        transparent: true,
                        color: ColorManager.white,
                        onPressed: () {
                          setState(() {
                            guests++;
                          });
                        },
                        icon: Icons.add_circle_outline,
                      )
                    ],
                  ),
                  color:
                  ColorManager.primary,),
              ],
            ),
          );
        },
      );

  Row _customSpacedRow(Size size, TextStyle style, String category) =>
      spacedRow(
          defaultText(text: category, style: style),
          circularBorderContainer(
            size: size,
            width: null,
            height: null,
            padding: EdgeInsets.only(right: size.width * 0.03,
                left: size.width * 0.04,
                top: size.width * 0.02,
                bottom: size.width * 0.02),
            child: defaultText(text: 'OPEN', style: TextStyle(
                color: Color.fromRGBO(249, 134, 0, 1),
                fontWeight: FontWeight.bold
            )),
            color: ColorManager.openButton,
            topLeft: 25,
            bottomLeft: 25,
            circle: null,
          ));

}