import 'package:applocation/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color, String fontFamily) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12,  Color? color, required fontFamily }) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color!, fontFamily);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color, required fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color, fontFamily);
}

// light style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color, required fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color, fontFamily);
}

// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color, required fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, fontFamily);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color, required fontFamily}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color, fontFamily);
}

TextStyle inputTextStyle(
    {double fontSize = FontSize.s12, }) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold,ColorManager.black, FontConstants.fontFamilyNunito);
}
TextStyle buttonTextStyle(
    {double fontSize = FontSize.s17, required Color color }) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color, FontConstants.fontFamilyInter);
}
TextStyle headLineTextStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, FontConstants.fontFamilyInter);
}
TextStyle headLineTextStyle2(
    {double fontSize = FontSize.s20, }) {
  return _getTextStyle(fontSize, FontWeightManager.bold, ColorManager.black, FontConstants.fontFamilyInter);
}

TextStyle settingTextStyle(
    {double fontSize = FontSize.s20}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, ColorManager.black, FontConstants.fontFamilySourceSansPro);
}

TextStyle subTitleTextStyle(
    {double fontSize = FontSize.s14}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, ColorManager.grey, FontConstants.fontFamilySourceSansPro);
}
TextStyle listTitleTextStyle(
    {double fontSize = FontSize.s12}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, ColorManager.grey, FontConstants.fontFamilyPoppins);
}

TextStyle SectionHeadingTextStyle(
    {double fontSize = FontSize.s12,required fontWeight ,required Color color, required fontFamily , height}) {
  return _getTextStyle(fontSize, fontWeight, color, fontFamily  );
}

// Trip History Page

TextStyle boldTitleTripHistory(
    {double fontSize = FontSize.s16}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, ColorManager.black, FontConstants.fontFamilyWork_Sans);
}
TextStyle smallTitleTripHistory(
    {double fontSize = FontSize.s12}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, ColorManager.black, FontConstants.fontFamilyWork_Sans);
}
TextStyle TitleTripHistory(
    {double fontSize = FontSize.s16}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, ColorManager.black, FontConstants.fontFamilyPoppins);
}


// Verify page

TextStyle subtitleText(
    {double fontSize = FontSize.s14}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, ColorManager.grey, FontConstants.fontFamilyRoboto);
}

//Booking
TextStyle BookingID(
    {double fontSize = FontSize.s18}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, ColorManager.black, FontConstants.fontFamilyPoppins);
}

TextStyle idNumber(
    {double fontSize = FontSize.s12}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, ColorManager.black, FontConstants.fontFamilyInter);
}
TextStyle list(
    {double fontSize = FontSize.s16}) {
  return _getTextStyle(fontSize, FontWeightManager.light, ColorManager.black, FontConstants.fontFamilyPoppins);
}


//Filter
TextStyle filterTitles(
    {double fontSize = FontSize.s16}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, ColorManager.black, FontConstants.fontFamilyManrope);
}

// Most Popular

TextStyle locationText(
    {double fontSize = FontSize.s10, required color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold,color, FontConstants.fontFamilyRoboto);
}

TextStyle headLineTextHighest(
    {double fontSize = FontSize.s16, required Color color }) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color, FontConstants.fontFamilyInter);
}