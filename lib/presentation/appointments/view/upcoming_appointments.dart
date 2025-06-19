import 'package:applocation/app/constants/widgets.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:applocation/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class UpcomingAppointments extends StatefulWidget {
  const UpcomingAppointments({super.key});

  @override
  State<UpcomingAppointments> createState() => _UpcomingAppointmentsState();
}

class _UpcomingAppointmentsState extends State<UpcomingAppointments> {
  @override
  Widget build(BuildContext context) {
    final themes = Theme.of(context).textTheme;
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: profileAppBar(themes),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width*0.0527522935779817),
        child: SingleChildScrollView(
          child: Column(
            children: [
              searchBar(size: size),
              SizedBox(height: 30,),
              defaultContainer(
                  margin: EdgeInsets.all(AppMargin.m8),child: spacedRow(defaultText(text: AppStrings.UpcomingAppointment.tr(),
                  style: themes.headlineSmall),
                  defaultText(text: AppStrings.SEEALL.tr(),style: themes.labelMedium))),
              _tourCard(size,themes),
              defaultContainer(width: double.infinity,margin: EdgeInsets.all(AppMargin.m8),child: defaultText(text: AppStrings.InterestedRestaurant.tr(),style: themes.headlineSmall,align: TextAlign.start)),

              SizedBox(
                height: size.height*0.083,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => _interestedRestaurants(),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: 10,
                ),
              ),

              SizedBox(height: AppSize.s16,),
              Row(
                children: [
                  Icon(Icons.stars_rounded,color: Color.fromRGBO(245, 102, 6, 1),size: 20,),
                  SizedBox(width: AppSize.s8,),
                  defaultText(text: AppStrings.TodaySpecial.tr(),style: themes.headlineSmall),
                  Spacer(),
                  defaultText(text: AppStrings.SEEALL.tr(),style: TextStyle(decoration: TextDecoration.underline,color: Color.fromRGBO(0, 0, 0, 0.65),fontSize: 12,fontWeight: FontWeight.normal)),
                ],
              ),

              _special(size, themes),

            ],
          ),
        ),
      ),
    );
  }

  Widget _special(Size size, TextTheme themes) {
    return defaultContainer(
        height: size.height * 0.2243386243386243,
        margin: EdgeInsets.only(top: AppMargin.m18),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => circularBorderContainer(
                size: size,
                width: null,
                child: hotelCard(0.444197247706422, 0.1150582010582011, size, themes, 'https://s3-alpha-sig.figma.com/img/b0a8/3d3c/07373087fc7c99279a8f2d8b47b6a4d4?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Xtncz5Oq7LAAzI4Rij7xbwYt4Z6tIJArGlK8ECpsJRiScc5osRXgXPxlI2dwwOFVQtJd8BfMVvcbdhLZeFNtC8Ap6t0BZqckS4hcPlN-GKV-vw9wDddZKGBQ65F14ka1MX8e8XMzjIN3dw-e~B9CaZ6Mm8W8pHxC-8BNIkBMIrYYgPmeyVMfZN1PXvR~rnkOZiflW7lK-UUiag2su4N-Uc4eRgqGc0kyEUBxr~3eKqp-VyT6lnYmS~L6B7F8ET7~haGrtrJGkViFuaVp7m~3MW8yzwOb7x49i~7JJJAUrn~pRSauUqV9FBZYjYDLlJrypongj7sy94aLiUZGTs2ing__',Icon(Icons.favorite_border_sharp,size:size.height * 0.02),_specialColumn(size,themes)),
                color: ColorManager.white,
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: AppSize.s14,
            ),
            itemCount: 6));
  }
Container _specialColumn(Size size,TextTheme themes)=>defaultContainer(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      defaultText(text: AppStrings.BoseHeadphones.tr(),style:themes.headlineSmall),
      defaultContainer(
        margin: EdgeInsets.symmetric(horizontal: AppMargin.m8),
        width: size.width*0.4,
        child: Row(
          children: [
            defaultText(text: '\$265.99',style: TextStyle(color: Color.fromRGBO(255, 114, 72, 1))),
            defaultText(text: '\$279.99',style: TextStyle(color: Color.fromRGBO(203, 203, 212, 1),decoration: TextDecoration.lineThrough)),
            Spacer(),
            circularBorderContainer(size: size,width: null,height: null,color: Color.fromRGBO(234, 248, 236, 1),child: defaultText(text: '20% OFF',style: TextStyle(color: Color.fromRGBO(81, 185, 96, 1),))),
          ],
        ),
      ),
      defaultContainer(width: size.width*0.4,child: defaultText(text: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.',style: themes.headlineMedium)),
    ],
  ),
  
);

  Container _tourCard(Size size,TextTheme themes)=>circularBorderContainer(
   size: size,
   height: 0.17,
   width: 0.894,
   color: Color.fromRGBO(51, 51, 51, 1),
   child: Stack(
     alignment: Alignment.topCenter,
     children: [
       outLinedCardContainer(0.7, 0.72),
       outLinedCardContainer(0.77, 0.53),
       outLinedCardContainer(0.83, 0.64),

       defaultContainer(
         padding: EdgeInsets.only(top: size.height*0.023,left:size.width*0.0527522935779817,right:size.width*0.0527522935779817,),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           mainAxisSize: MainAxisSize.min,
           children: [
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 CircleAvatar(
                   backgroundImage: NetworkImage(
                     'https://s3-alpha-sig.figma.com/img/31f6/a5ae/18f2df306eeebdeece71dfcad5ab6883?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=BtIi5Qz7-V0xBThZdVKp0fpQhUFTI6IdfPshPusTjVDYAEVvbRpYcqFyjQzz2mp9KqNY3prS9JDgU~i55jCbMys7dbMikyMjqrUdzQCSa93apNzTeUpZ3lZbC8XBKtfeR2yyP~61CoXbjE4FWIoPQUV7dTOgTPFUK0JVA05dtG0d-fCNyjq5Cl-j8HApDPlOO55jB5f9F5EGsgPpBQe~zX6jU92ACtbVlmClZEqJvw-232UI-js0eD1wRbWUoVwbM7wRGkYDEuBzoBXvFHeFxOZbTe7KzaIvETHNbly~-Oxh-O8Oo4M82vW-qNWHtPWDDMIRZMCct1i9qD38saP29g__',
                   ),
                   radius: size.width*0.0634920634920635, // Optional: Adjust the radius as needed
                 ),
                 SizedBox(width: AppSize.s12,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     defaultText(text: AppStrings.NouraAlSalem.tr(),style: themes.bodyMedium),
                     defaultText(text: AppStrings.TourGuide.tr(),style: themes.bodyMedium),
                   ],
                 ),
                 Spacer(),
                 Icon(Icons.more_vert_outlined,color: Colors.white,),

               ],
             ),
             SizedBox(height: AppSize.s12,),
             Row(
               children: [
                 defaultTextButton(onPressed: (){},child: Row(children: [Text('data')],),size: size,height: 0.0465608465608466,width:0.2775229357798165,color: Color.fromRGBO(255, 255, 255, 0.09),circular: 8),
                 SizedBox(width: AppSize.s12,),
                 defaultTextButton(onPressed: (){},child: Row(children: [Text('data')],),size: size,height: 0.0465608465608466,width:0.2775229357798165,color: Color.fromRGBO(255, 255, 255, 0.09),circular: 8),
               ],
             ),
           ],
         ),
       ),
     ],
   ),
 );

  Widget _interestedRestaurants() => Stack(
    alignment: Alignment.center,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(65),
          gradient: RadialGradient(colors: [
            Color.fromRGBO(21, 103, 120, 1),
            Color.fromRGBO(3, 186, 225, 1),
          ]),
        ),
        width: 65,
        height: 65,
      ),
      CircleAvatar(
        backgroundImage: NetworkImage(
          'https://s3-alpha-sig.figma.com/img/9a2c/9f74/330e499651f27f232390fb78082605cb?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mVdj8uQ-LpBXL3nyOCrEgvReP~H6W3iO2uUk-7Y4wKOERtZnUrqF9PUOcnWe5fsYqWbDSNQiXU-6lyZJiDp5Y1TlFf9YP0MOLR4G1iEnvcI-xWRu7I1HzVpDnskYFGTJkvvZryPcNsDal4ZhKvxHejsROCaCyWAbhuTufmROsIiXkxyh9gVnYdXUtt-zjX26wKGJ~Jn6wFqA0zm9RwQNferTuqRKOf~mT-tM3Sv2OGNOEVHEtS017F2fljjYmQSRuB6EcDaTSOb31p1GkCp0oVZfzzRnH7CxmblP7rYt9cWHRGooNLVTDYkxMbuBaBDNW56VPixUkpvxTqtRCeTNcA__',
        ),
        radius: 30,
        backgroundColor: Colors.white,
      ),
    ],
  );

}
