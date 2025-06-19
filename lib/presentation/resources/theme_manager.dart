import 'package:applocation/presentation/resources/styles_manager.dart';
import 'package:applocation/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(

    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    scaffoldBackgroundColor: ColorManager.white,
    // ripple effect color

    // cardview theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),

    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white,fontFamily: FontConstants.fontFamilyInter)),

    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle:  getRegularStyle(
                color: ColorManager.white, fontSize: FontSize.s17,fontFamily: FontConstants.fontFamilyInter), backgroundColor: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side:BorderSide(color: ColorManager.primary),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8)),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: ColorManager.searchGrey,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
    ),


    textTheme: TextTheme(
      displayLarge: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s32,fontFamily: FontConstants.fontFamilyRoboto),

      headlineLarge: getBoldStyle(color: ColorManager.welcome, fontSize: FontSize.s22,fontFamily: FontConstants.fontFamilyInter),
      headlineMedium: getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s12,fontFamily: FontConstants.fontFamilyInter),
      headlineSmall:getRegularStyle(color: ColorManager.black, fontSize: FontSize.s14,fontFamily: FontConstants.fontFamilyInter) ,

      titleLarge: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s20,fontFamily: FontConstants.fontFamilyRoboto),
      titleMedium: getMediumStyle(color: ColorManager.secondary, fontSize: FontSize.s17,fontFamily: FontConstants.fontFamilyNunito),
      titleSmall: getRegularStyle(color: ColorManager.white,fontSize: AppSize.s14,fontFamily: FontConstants.fontFamilyNunito),

      bodyLarge: getBoldStyle(color: ColorManager.white, fontSize: FontSize.s20,fontFamily: FontConstants.fontFamilyNunito),
      bodyMedium: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s12,fontFamily: FontConstants.fontFamilyInter),
      bodySmall: getRegularStyle(color: ColorManager.white,fontSize: AppSize.s14,fontFamily: FontConstants.fontFamilyNunito),


      labelLarge: getBoldStyle(color: ColorManager.button, fontSize: FontSize.s16,fontFamily: FontConstants.fontFamilyInter),
      labelSmall: getBoldStyle(color: ColorManager.darkPrimary, fontSize: FontSize.s14,fontFamily: FontConstants.fontFamilyInter),
      labelMedium: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s12,fontFamily: FontConstants.fontFamilyInter),

    ),



    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
            getRegularStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14,fontFamily: FontConstants.fontFamilyInter),
        labelStyle:
            getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14,fontFamily: FontConstants.fontFamilyInter),
        errorStyle:
            getRegularStyle(color: ColorManager.error,fontFamily: FontConstants.fontFamilyInter),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.lightGrey, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.greenvalidation, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
    // label style
  );
}
