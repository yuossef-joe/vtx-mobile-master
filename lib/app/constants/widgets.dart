import 'dart:ui';

import 'package:applocation/presentation/resources/color_manager.dart';
import 'package:applocation/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../../presentation/resources/values_manager.dart';

AppBar profileAppBar(TextTheme themes)=>AppBar(
  elevation: 0,
  forceMaterialTransparency: true,
  actions: [
    Stack(
      alignment: Alignment.topRight,
      children: [
        Icon(
          IconlyLight.notification,
          color: ColorManager.primary,
          size: 30,
        ),
        CircleAvatar(
          backgroundColor: ColorManager.error,
          radius: 5,
        ),
      ],
    ),
    SizedBox(
      width: 10,
    ),
    Icon(
      IconlyLight.heart,
      color: Color.fromRGBO(52, 65, 84, 1),
      size: 30,
    ),
  ],
  leading: defaultContainer(
    height: 50,
    width: 50,
    child: circular_image(
        width: 50,
        height: 50,
        image:
        'https://s3-alpha-sig.figma.com/img/982f/9e0b/f80e3ae18322398246e58ea81716d534?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=GAC1UZTXgPVtpmF-ve8uyEZZFRpxJWDBxoTobSNn1FWoOkOmTLS2ktxWm4h6uFJZ69vLXSh9aV1oM39Y2DafGZsRu9B6jyB4xKMuELTH0CNNCQx3SZN7yIcykuPtx-CDBKUBz30pEBWy2A2mptdsa4dmrs5iG8dsRHkCahoL0JQ~9ocwjNsaO55BMlrwQXxwsUxHyKJpy2QHt8GGidnoUk2qFk2NzjCHrtZ0i5OPHo~i~fsspIRV4zZSDsULAEZYVyyTilaS2kY5eNDYTioK-zHm3E9r0Y1Qo5zBEwu~RzaqsO8EbkRqLNP71eLLi7K9XeSsFcondBQsnrx1T~pT0A__',
        circle: 25),
  ),
  title: defaultText(
      text: 'Welcome Back,\nNada Al-Hashimi',
      style: themes.headlineSmall!),
  centerTitle: false,
);
Container daysBuilder(Size size,TextTheme themes,int year,int month,int day,int selected,[bool? transparent]) {
  final date=DateTime(year,month,day);
  String weekdayName = DateFormat('EE').format(date);
  return  circularBorderContainer(
          size: size,
          width: 0.12,
          circle: transparent ==null?size.width*0.1:size.width*0.03,
          color: day==selected?ColorManager.primary: transparent ==null ?Color.fromRGBO(240, 243, 246, 1):Colors.transparent,
          margin: EdgeInsets.all(AppMargin.m8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              defaultText(text: weekdayName,style: TextStyle(color: day==selected?ColorManager.white:Colors.black)),
              SizedBox(height: AppSize.s4,),
              defaultText(text: '${date.day}',style: day==selected?themes.bodyMedium:themes.headlineSmall),
            ],
          )
  );
}
int getDaysInMonth(int year, int month) {

  DateTime lastDayOfMonth = DateTime(year, month + 1, 0);
  return lastDayOfMonth.day;
}


Widget subscriptionTittle(String text,BuildContext context)=> defaultContainer(
  margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.26),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      IconButton(onPressed: (){
        Navigator.pop(context );
      }, icon: Icon(Icons.arrow_back_ios_new)),
      defaultText(
        text:  text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    ],
  ),
);



AppBar backAppBar(String title,[Icon? action])=>AppBar(
  leading: BackButton(
    color: ColorManager.black,
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.transparent)),
  ),
  title: Text(title,style: TextStyle(color: ColorManager.black,fontSize: AppSize.s20,fontFamily: 'Inter',fontWeight: FontWeight.w700),),
  forceMaterialTransparency: true,
  actions: [
    action??Icon(Icons.favorite_border,color: ColorManager.black,),
  ],
);
AppBar backAppBar2(String title, )=>AppBar(
  leading: BackButton(
    color: ColorManager.black,
    style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.transparent)),
  ),
  title: Text(title,style: TextStyle(color: ColorManager.black,fontSize: AppSize.s20,fontFamily: 'Inter',fontWeight: FontWeight.w700),),
  forceMaterialTransparency: true,
);

GestureDetector defaultGestureDetector({Widget? child, VoidCallback? onTap}) =>
    GestureDetector(
      onTap: onTap,
      child: child,
    );

Container outLinedCardContainer(double wid,double hei)=>defaultContainer(
  width: double.infinity,
  height: double.infinity,
  child:
ClipPath(
clipper: outlineContainer(width: wid,height: hei),//hei 0.72 and wid 0.7
child: defaultContainer(color: Color.fromRGBO(195, 192, 184, 0.2),width: double.infinity,height: 100),
),);
//
// ClipPath(
// clipper: outlineContainer(width: 0.77,height: 0.53),//hei 0.53 and wid 0.77
// child: defaultContainer(color: Color.fromRGBO(195, 192, 184, 0.2),width: double.infinity,height: 100),
// ),
//
// ClipPath(
// clipper: outlineContainer(width: 0.83,height: 0.64),//hei 0.64 and wid 0.83
// child: defaultContainer(color: Color.fromRGBO(195, 192, 184, 0.2),width: double.infinity,height: 100),
// )
//   ],
// );

class outlineContainer extends CustomClipper<Path> {

  double width,height;
  outlineContainer({required this.width,required this.height});
  @override
  Path getClip(Size size) {
    Path path = Path();
    double wid=size.width*width;
    double hei=size.height*height;
    path.moveTo(wid, size.height);
    path.lineTo(wid+size.width*0.02, hei);
    print('this is wid $wid & this is hei $hei & this is wid times 1.02 ${wid*1.02}');
    path.quadraticBezierTo(wid+size.width*0.04, hei- size.height*0.15, wid+size.width*0.1, hei-size.height*0.11);
    path.lineTo(size.width, hei-size.height*0.07);
    // //path.lineTo(size.width, size.height*0.45);
     path.lineTo(size.width, hei-size.height*0.07+2);
    path.lineTo(wid+size.width*0.1, hei-size.height*0.11+2);
    path.quadraticBezierTo(wid+size.width*0.04+2,hei- size.height*0.15+2,wid+size.width*0.02+2, hei);
    path.lineTo(wid+2, size.height);



    // path.lineTo(size.width, size.height*0.45+2);
    // path.lineTo(size.width*0.9, size.height*0.45+2);
    // path.quadraticBezierTo(size.width*0.85, size.height*0.45,size.width*0.82, size.height/2);
    // path.lineTo(size.width*0.82+2, size.height/2);
    // path.lineTo(size.width*0.8, size.height);
    // path.lineTo(size.width, size.height*0.5);
    // path.lineTo(size.width, size.height);
    // // // The depth of the inward curve
    //
    // // Start from top-left corner
    // path.moveTo(0, size.height*0.6);
    // path.quadraticBezierTo(size.width/2, size.height*1.3, size.width, size.height*0.6);
    // path.lineTo(size.width, 0);
    // // path.lineTo(curveDepth, size.height);
    // //
    // // // Bottom-left inward curve
    // // path.quadraticBezierTo(0, size.height, 0, size.height - curveDepth);
    // // path.lineTo(0, curveDepth);
    //
    // // Top-left inward curve
    // //path.quadraticBezierTo(0, 0, curveDepth, 0);
    //
    path.close();
    return path;

  }

  @override
  bool shouldReclip(oldClipper) => true;
}
ButtonStyle transparentButtonStyle()=> ButtonStyle(
  backgroundColor: WidgetStatePropertyAll(Colors.transparent),
);
ElevatedButton defaultElevatedButton(
        {Size? size,
        String? text,
        VoidCallback? onPressed,
        double height = 0.0665,
        double width = 1,Widget? child,Color? color}) =>
    ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
          fixedSize: size == null
              ? null
              : WidgetStatePropertyAll(
                  Size(size.width * width, size.height * height)),
        ),
        onPressed: onPressed,
        child: child ?? Text(
          text ?? '',
          style: TextStyle(color: ColorManager.white, fontWeight: FontWeight.bold),
        ));

Align defaultAlignedLabel(
        {required TextStyle style,
        String label = 'See all',
        double pad = AppPadding.p12,
        Alignment align = Alignment.centerLeft}) =>
    Align(
        alignment: align,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: pad),
          child: Text(
            label,
            style: style,
          ),
        ));

ImageFiltered backGradient({required Size size}) =>
     ImageFiltered(imageFilter: ImageFilter.blur(sigmaX:116,sigmaY:116),
       child: ClipOval(
       clipper: backGrad(),
       child: Container(
         width: size.width*0.755,
         height: size.height*0.35,

         decoration: BoxDecoration(
           color: Color.fromRGBO(248, 221, 150, 0.35),
           // boxShadow: [
           //   BoxShadow(
           //     color:Colors.white,
           //     offset: const Offset(2, -2),
           //     blurRadius: 15,
           //     spreadRadius: 12,
           //
           //   )
           // ]
         ),
       ),
     ),);
     //Container(
//       height: 230,
//       width: 280,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           //backgroundBlendMode: BlendMode.,
//           border: Border.all(color: Colors.transparent),
//           gradient: RadialGradient(
//               stops: [0.1, 1.0],
//               colors: [ColorManager.backGri, ColorManager.white])),
//     );

class halfCircle extends CustomClipper<Rect> {

  halfCircle();
  @override
  Rect getClip(Size size) {
    // Path path = Path();
    // // The depth of the inward curve
    //
    // // Start from top-left corner
    // path.moveTo(0, size.height*0.6);
    // path.quadraticBezierTo(size.width/2, size.height*1.3, size.width, size.height*0.6);
    // path.lineTo(size.width, 0);
    // // path.lineTo(curveDepth, size.height);
    // //
    // // // Bottom-left inward curve
    // // path.quadraticBezierTo(0, size.height, 0, size.height - curveDepth);
    // // path.lineTo(0, curveDepth);
    //
    // // Top-left inward curve
    // //path.quadraticBezierTo(0, 0, curveDepth, 0);
    //
    // path.close();
    // return path;
    return Rect.fromLTWH(0, 0, size.width, size.height/2);
  }

  @override
  bool shouldReclip( oldClipper) => false;
}

class backGrad extends CustomClipper<Rect> {

  backGrad();
  @override
  Rect getClip(Size size) {
    // Path path = Path();
    // // The depth of the inward curve
    //
    // // Start from top-left corner
    // path.moveTo(0, size.height*0.6);
    // path.quadraticBezierTo(size.width/2, size.height*1.3, size.width, size.height*0.6);
    // path.lineTo(size.width, 0);
    // // path.lineTo(curveDepth, size.height);
    // //
    // // // Bottom-left inward curve
    // // path.quadraticBezierTo(0, size.height, 0, size.height - curveDepth);
    // // path.lineTo(0, curveDepth);
    //
    // // Top-left inward curve
    // //path.quadraticBezierTo(0, 0, curveDepth, 0);
    //
    // path.close();
    // return path;
    return Rect.fromLTWH(size.width*-0.11, size.height*-0.458, size.width, size.height);
  }

  @override
  bool shouldReclip( oldClipper) => false;
}
Widget defaultTextFormField({
  TextStyle? hintstyle,
  required TextEditingController controller,
  required String title,
  String? Function(String?)? validator,
  required TextStyle style,
  TextInputType keyboardType = TextInputType.text,
  TextInputAction inputAction = TextInputAction.done,
  String? hintText,
  bool isObscure = false,
  Function(String)? onSubmitted,
  Function(String)? onChanged,
  VoidCallback? onTap,
  IconData? suffixIcon,
  IconData? prefixIcon,
  VoidCallback? suffixPressed,
  String? errorText,
  TextFormField? textformfield ,
  BorderRadius borderRadius = const BorderRadius.all(Radius.circular(20.0)), InputDecoration? decoration,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isObscure,
    validator: validator,
    keyboardType: keyboardType,
    textInputAction: inputAction,
    onFieldSubmitted: onSubmitted,
    onChanged: onChanged,
    onTap: onTap,
    style: style,



    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.lightGrey)),
      contentPadding: EdgeInsets.symmetric(vertical: AppSize.s12,horizontal: AppSize.s8),
      hintStyle : hintstyle,
      labelText: title,
      hintText: hintText,
      errorText: errorText,
      border: OutlineInputBorder(
        borderRadius: borderRadius,
      ),
      prefixIcon: prefixIcon != null ? Icon(prefixIcon,color: Color.fromRGBO(174, 174, 178, 1),) : null,
      suffixIcon: suffixIcon != null
          ? defaultGestureDetector(child: Icon(suffixIcon),onTap: suffixPressed, )
          : null,
    ),
  );
}

TextButton defaultTextButton(
        {required VoidCallback? onPressed,
        Size? size,
        String? text,
        Color? color,
        Color? textColor,
        WidgetStateProperty<OutlinedBorder>? shape,
        Widget? child,
        double circular = 8,
        double width = 1,
        double height = 0.066}) =>
    TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            WidgetStatePropertyAll(color ?? ColorManager.primary),
        fixedSize: size == null
            ? null
            : WidgetStatePropertyAll(
                Size(size.width * width, size.height * height)),
        shape: shape ??
            WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(circular)),
              ),
            ),
      ),
      child: child ??
          Text(
            text!,
            style: TextStyle(color: textColor ?? ColorManager.white),
          ),
    );

Widget circular_image( {
  required String image,
  double? height,
  double? width,
  BoxFit? fit = BoxFit.cover,
  double? circle = 8,
  double bottomLeft = 0,
  double bottomRight = 0,
  double topLeft = 0,
  double topRight = 0,
}) =>
    ClipRRect(
      borderRadius: circle != null
          ? BorderRadius.circular(circle)
          : BorderRadius.only(
              bottomRight: Radius.circular(bottomRight),
              bottomLeft: Radius.circular(bottomLeft),
              topLeft: Radius.circular(topLeft),
              topRight: Radius.circular(topRight)),
      child: Image(
        image: NetworkImage(
          image,
        ),
        height: height,
        width: width,
        fit: fit,
      ),
    );

Row _searchBarRow() => Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            IconlyLight.search,
            color: Color.fromRGBO(151, 151, 151, 1),
          ),
        ),
        Text(
          "Search",
          style: TextStyle(
            fontSize: 15,
            color: Color.fromRGBO(4, 11, 18, 1).withOpacity(0.4),
          ),
        ),
        Spacer(),
        defaultContainer(height: 15, width: 1, color: Colors.grey,margin: EdgeInsets.symmetric(horizontal: AppSize.s4)),
        defaultGestureDetector(
            child: Icon(IconlyLight.filter,color: ColorManager.primary,),
            onTap: () {
              print('icon pressed');
            }),
      ],
    );
Container searchBar({
  required Size size,
  double height = 0.06,
  double? width = 0.89,
  Widget? child,
  Color? color,
}) {
  return circularBorderContainer(
    size: size,
    height: height,
    width: width,
    child: child ?? _searchBarRow(),
    padding: EdgeInsets.only(right: AppPadding.p8),
    color: color ?? ColorManager.searchGrey,
  );


  // Container(
  //   decoration: BoxDecoration(
  //     color: ,
  //     borderRadius: BorderRadius.circular(8),
  //   ),
  //   width: size.width*0.71,
  //   height: size.height*0.06,
  //   child:
  // );
}

Container shortSearchBar(Size size,TextEditingController controller,String title,Function(String)? onChacnged)
{
  return searchBar(
      size: size,
      child: defaultTextFormField(
        controller: controller,
        title: title,
        style: TextStyle(fontSize: 19.78, fontFamily: "Nunito", fontWeight: FontWeight.w400, color: ColorManager.black,),
      onChanged: onChacnged,
      prefixIcon: Icons.search,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
      width: null);
}

Text defaultText(
        {required String text,
        TextStyle? style,
        TextAlign? align = TextAlign.start,
        int? maxLines,
        TextOverflow? flow}) =>
    Text(
      text,
      style: style,
      overflow: flow ?? TextOverflow.clip,
      textAlign: align,
      maxLines: maxLines,

    );

Container defaultContainer(
        {double? height,
        double? width,
        Widget? child,
        EdgeInsets? margin,
        EdgeInsets? padding,
        Color? color, 
        BoxBorder? border,}) =>
    Container(
      padding: padding,
      margin: margin,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border:border,
      ),
      width: width,
      child: child,
    );

ListTile defaultListTile({
  Widget? title,
  Widget? trailing,
  Widget? subtitle,
  double horizontalTitleGap = 0,
}) =>
    ListTile(
      horizontalTitleGap: horizontalTitleGap,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
    );

Row spacedRow(Widget one, Widget two) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [one, two],
    );

Widget arrowButton(double height, double width,VoidCallback onPressed) => GestureDetector(
  onTap: onPressed,
  child: Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: ColorManager.secondary,
        borderRadius: BorderRadius.circular(AppSize.s8)),
    child: Icon(
      Icons.arrow_forward,
      color: Colors.white,
    ),
  ),
);

BoxDecoration _boxDecoration()=>BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),gradient: LinearGradient(colors: [Color.fromRGBO(146, 163, 253, 0.2),Color.fromRGBO(157, 206, 255, 0.2)]));
Container tourGuideCard(Size size,TextTheme themes,String? image,[Widget? child])=>circularBorderContainer(decoration: child==null?null:_boxDecoration(),padding: EdgeInsets.all(AppPadding.p8),color: child==null?Colors.white:null,shadow: child==null?true:false,size: size,width:0.9,height: 0.14,margin: EdgeInsets.symmetric(vertical: size.height*0.02),child: cardRow(size,themes,image,child));

Row cardRow(Size size,TextTheme themes,String? image,[Widget? child])=>Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Center(
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          image??'',
        ),
        radius: size.width*0.1, // Optional: Adjust the radius as needed
      ),
    ),
    child??Container(
      margin: EdgeInsets.symmetric(horizontal: AppMargin.m8),
      child:    Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          defaultText(text: ' Salama Gaber',style: themes.titleLarge),
          defaultText(text: 'Tour Guide | 5 Languages',style: themes.bodySmall),
          RatingBar(minRating: 0,maxRating: 5,
            itemSize: 25,
            ratingWidget: RatingWidget(
              half: Icon(Icons.star),
              full: Icon(Icons.star,color: Colors.amber,),
              empty: Icon(Icons.star,color: ColorManager.grey1,),
            ), onRatingUpdate: (rating) {

            },),
        ],
      ),
    ),
    Spacer(),
    child!=null?Container():defaultContainer(
      margin: EdgeInsets.all(AppMargin.m12),
      child: Icon(Icons.favorite,color: ColorManager.primary,),
    ),
  ],
);
Widget recommendedBuilder(Size size, TextTheme textThemes, String image,
        String title, String description,VoidCallback onPressed) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        circular_image(
            height: size.height * 0.11, width: size.width * 0.4, image: image),
        defaultContainer(
          child: defaultText(text: title, style: textThemes.titleLarge!),
          height: size.height * 0.027,
          width: size.width * 0.41,
        ),
        SizedBox(
          height: AppSize.s12,
        ),
        Expanded(
          child: defaultText(
              text: description, style: textThemes.headlineMedium!),
        ),

        spacedRow(
          defaultText(
              text: 'Explore',
              style: TextStyle(color: ColorManager.secondary, fontSize: 15)),
          arrowButton(size.height * 0.037, size.width * 0.08,onPressed),
        )
      ],
    );

OutlinedButton defaultOutlinedButton(
        {required VoidCallback? onPressed,
        required Size size,
        Widget? child,
        ButtonStyle? style,
        double width = 0.19,
        double height = 0.045,
          RoundedRectangleBorder? shape }) =>
    OutlinedButton(
        onPressed: onPressed,
        style: style ??
            ButtonStyle(
              shape: WidgetStatePropertyAll(shape),
                minimumSize: WidgetStatePropertyAll(
                    Size(size.width * width, size.height * height))),
        child: child);

IconButton defaultIconButton(
        {required VoidCallback? onPressed,
        required IconData icon,
        Color? color,
          double? size,
          bool transparent =false,
        }) =>
    IconButton(
      style: transparent?transparentButtonStyle():null,
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: size??AppSize.s20,
      ),
      color: color ?? Color.fromRGBO(137, 138, 141, 1).withOpacity(0.10),
    );
Container circularBorderContainer({
  required Size size,
  bool shadow = false,
  double? width ,
  double? height,
  Widget? child,
  Color? color=Colors.white,
  double? circle = 8,
  BoxDecoration? decoration,
  BoxBorder? border,
  EdgeInsets? padding,
  EdgeInsets? margin,
  double bottomLeft = 0,
  double bottomRight = 0,
  double topLeft = 0,
  double topRight = 0,
  GlobalKey? key
}) =>
    Container(
      key: key,
      width: width == null ? null : size.width * width,
      height: height == null ? null : size.height * height,
      margin: margin,
      padding: padding,
      decoration: decoration ??
          BoxDecoration(
            boxShadow: shadow?[
              BoxShadow(
                  color: Color.fromRGBO(29, 22, 23, 0.07),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
              ),

            ]:null,
              borderRadius: circle != null
                  ? BorderRadius.circular(circle)
                  : BorderRadius.only(
                      bottomRight: Radius.circular(bottomRight),
                      bottomLeft: Radius.circular(bottomLeft),
                      topLeft: Radius.circular(topLeft),
                      topRight: Radius.circular(topRight)),
              color: color,
              border: border),
      child: child,
    );

Widget imageColumn(Widget one, Widget two,[EdgeInsets? margin, MainAxisAlignment? align]) => defaultContainer(
    margin: margin ?? EdgeInsets.all(AppMargin.m8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: align==null?MainAxisSize.min:MainAxisSize.max,
      mainAxisAlignment: align ??MainAxisAlignment.spaceAround,
      children: [
        one,
        SizedBox(
          height: AppSize.s8,
        ),
        two
      ],
    )
);


Widget famous_builder(String image, String title, String description,
        double height, double width, double textHeight , TextStyle styletitle, TextStyle descriptionstyle) =>
    Container(
        child: Stack(
      alignment: Alignment.bottomLeft,
      children: [
        circular_image(height: height, width: width, image: image),
        defaultContainer(
            width: width * 0.9,
            child: imageColumn(
              defaultContainer(
                height: textHeight,
                child: defaultText(
                  text: title,
                  style: styletitle),
              ),
              defaultText(
                text: description,
                style: descriptionstyle,
              ),
            )),
      ],
    ));
Widget category_builder(double pad, double rad, double height, double textWidth,
        String? image, String text) =>
    Column(
      children: [
        defaultContainer(
          child: circular_image(
              height: rad * 2, width: rad * 2, image: image ?? '', circle: 25),
        ),
        SizedBox(
          height: 6,
        ),
        SizedBox(
          width: textWidth,
          height: height,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );

Column hotelCard(double imageWid,double imageHei,Size size, TextTheme themes,String image,[Icon? icon,Container? child]) {
  return Column(
    children: [
      Stack(
        alignment: Alignment.topRight,
        children: [
          circular_image(
              height: size.height * imageHei,
              width: size.width * imageWid,
              image:
              image,
              topLeft: 8,
              topRight: 8),
          Container(
            margin: icon==null?EdgeInsets.all(AppMargin.m18):null,
            child: CircleAvatar(
              radius: icon==null?(size.height + size.width) * 0.015:(size.height + size.width) * 0.01,
              backgroundColor: ColorManager.white,
              child: icon??Icon(Icons.favorite,
                  color: Color.fromRGBO(255, 114, 72, 1),
                  size: size.height * 0.03),
            ),
          ),
        ],
      ),
      child??defaultContainer(
          height: size.height * 0.123,
          width: size.width * 0.676,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      defaultText(
                          text: 'Regency Hotel', style: TitleTripHistory())
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: defaultText(
                      text: 'Pimple Gurav, Pune',
                      style: themes.headlineMedium!)),
              Expanded(
                  flex: 1,
                  child: defaultText(
                      text: '\$200,7 /night', style: themes.labelLarge!)),
            ],
          ),
          padding: EdgeInsets.all(AppPadding.p14)),
    ],
  );
}
