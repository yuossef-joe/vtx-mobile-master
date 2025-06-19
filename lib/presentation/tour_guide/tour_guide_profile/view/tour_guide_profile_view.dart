import 'package:applocation/app/constants/widgets.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:applocation/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../resources/styles_manager.dart';

class TourGuideProfileView extends StatefulWidget {
  const TourGuideProfileView({super.key});

  @override
  State<TourGuideProfileView> createState() => _TourGuideProfileViewState();
}

class _TourGuideProfileViewState extends State<TourGuideProfileView> {
  @override
  Widget build(BuildContext context) {
    final themes = Theme.of(context).textTheme;
    final size  = MediaQuery.of(context).size;
    return Scaffold(
      appBar: backAppBar(AppStrings.tourGuide.tr()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width*0.053,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              tourGuideCard(size, themes, 'https://s3-alpha-sig.figma.com/img/31f6/a5ae/18f2df306eeebdeece71dfcad5ab6883?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=gVoWu6HjeAMpI83HrV1qKMsfmurf1RWjgV6j-Qm9Q9nuldr6QQD3bi2ncnaP0lhLDgMZynMLfzzK8qHOwv-ILAjAShH4JZ53Mhby9eLFzIlMzqA5tXTElczjXyseppVkI9a9WU5Hq3W~xAgdg9f94Iu~QInQ568UGuPgsUkohhVFztEEAsH86bptWBjPn5T1dVJb7T9UM4qyBb0PxvTnki7DAV9Skmo8ImPJuea4xkP14ZBIGHnvgbXlIm0L2aRTZPYbe4koMto94zhmHY6igehcbwbLMMFuxM0Ra7mo0yBIAwzKIHpkK5QQR1-ZP~SWi5OWtJnrFLHMBbzj9AVVzw__',Container()),

              Row(
              children: [
                Expanded(child: circularBorderContainer(size: size,height: 0.07,shadow: true,child: _tripsColumn('180',themes),),),
                SizedBox(width: size.width*0.02,),
                Expanded(child: circularBorderContainer(size: size,height: 0.07,shadow: true,child: _experienceColumn('10Y+',themes),),),
                SizedBox(width: size.width*0.02,),
                Expanded(child: circularBorderContainer(size: size,height: 0.07,shadow: true,child: _ratingColumn('4.8',themes),),),
              ],
              ),
              SizedBox(height: size.height*0.029,),
              defaultText(text: AppStrings.aboutMe.tr(),style: TitleTripHistory()),
              SizedBox(height: size.height*0.025,),

              defaultContainer(
                width: double.infinity,
                child: defaultText(text:AppStrings.introduceText.tr() ,style: idNumber()),
              ),

              SizedBox(height: size.height*0.029,),
              defaultText(text: AppStrings.workingInformation.tr(),style: TitleTripHistory()),
              SizedBox(height: size.height*0.025,),

              //rgba(119, 130, 147, 1)

              Row(
                children: [
                  Icon(Icons.calendar_month_outlined,color: Color.fromRGBO(119, 130, 147, 1),),
                  SizedBox(width: size.width*0.02,),
                  defaultText(text: 'Monday - Friday, 08:00 AM - 21:00 PM',style: TextStyle(color: Color.fromRGBO(52, 65, 84, 1),fontFamily: 'Poppins',fontWeight: FontWeight.w400,fontSize: AppSize.s14)),
                ],
              ),
              SizedBox(height: size.height*0.02,),
              Row(
                children: [
                  Icon(Icons.watch_later_outlined,color: Color.fromRGBO(119, 130, 147, 1),),
                  SizedBox(width: size.width*0.02,),
                  defaultText(text: '10:00 AM - 11:30 AM (90 minutes)',style: TextStyle(color: Color.fromRGBO(52, 65, 84, 1),fontFamily: 'Poppins',fontWeight: FontWeight.w400,fontSize: AppSize.s14)),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
  Column _tripsColumn(String? trips,TextTheme themes)=>Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      defaultText(text: trips??'',style: themes.labelMedium),
      defaultText(text: AppStrings.trips.tr(),style: themes.headlineMedium),
    ],
  );
  Column _experienceColumn(String? experience,TextTheme themes)=>Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      defaultText(text: experience??'',style: themes.labelMedium),
      defaultText(text: AppStrings.experience.tr(),style: themes.headlineMedium),
    ],
  );
  Column _ratingColumn(String? rating,TextTheme themes)=>Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star,color: Color.fromRGBO(238, 184, 84, 1),),
          defaultText(text: rating??'',style: themes.labelMedium),

        ],
      ),
      defaultText(text: AppStrings.rating.tr(),style: themes.headlineMedium),

    ],
  );
}
