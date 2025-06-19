import 'package:applocation/app/constants/widgets.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:applocation/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../app/constants.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';

class TripHistory extends StatefulWidget {
  const TripHistory({super.key});

  @override
  State<TripHistory> createState() => _TripHistoryState();
}

class _TripHistoryState extends State<TripHistory> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: Constants.zero.toDouble(),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
        title: Text(
          AppStrings.tripHistory.tr(),
          style: theme.titleLarge,
        ),
        leading: BackButton(onPressed: () => Navigator.pop(context),),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _flights(size, theme),
          _ticket(size),
          defaultContainer(
              child: defaultText(
                  text: AppStrings.handpicked.tr(), style: TitleTripHistory()),
              margin: EdgeInsets.all(AppMargin.m12)),
          _handPicked(size, theme),
          SizedBox(
            height: size.height * 0.03,
          ),
          // defaultContainer(
          //   child: spacedRow(
          //     defaultText(
          //         text: AppStrings.popularDestination.tr(), style: TitleTripHistory()),
          //     defaultGestureDetector(
          //         child: defaultText(text: AppStrings.SEEALL.tr(), style: theme.labelSmall!),
          //         onTap: () {}),
          //   ),
          //   margin: EdgeInsets.only(
          //       left: size.width * 0.044, right: size.width * 0.12),
          // ),
          // Column(
          //   children: [
          //
          //   ],
          // ),
          circularBorderContainer(size: size)
        ],
      ),
    );
  }
}

Widget _handPicked(Size size, TextTheme themes) {
  return defaultContainer(
      height: size.height * 0.381,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => circularBorderContainer(
              size: size,
              width: 0.68,
              child: hotelCard(0.676,0.258,size,
                  themes,'https://s3-alpha-sig.figma.com/img/2308/5247/250a61fe291f8cc69051af3067c96ff6?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=TiTv6zTeAk3ZCxcy1eb8Tx8nw55VVMyjPNiSsbGOcV4Fqh3AAEY1U6yLdDPsOoXTUFGgVThR1duDAlhwAjbygxHB6I3fwndzfw0KSeM-7QD3MSUsP25jCCz7bv66HxbyzWXY1CVUbA8HWe4xknMDmQmdaSJiWnlnzFbkCTxTPoumnWlWvK0~7aFU8QeFksTNUUCPaxV6-SybndhkCiEH1IGmpCU2gF-bBuIbCKztOzNN0dVHPpzmltwZj35LjX4WZnaax5RzUVH0RgPwBlRSPVCStzGKnnRvxLINmMvHoR9QJ30J1jw9yAph2w0wfD-XlJLcqD6cHT2nbaw2M9kSOA__'),
              color: ColorManager.white,
              margin: EdgeInsets.only(left: AppMargin.m18)),
          separatorBuilder: (context, index) => SizedBox(
                width: AppSize.s14,
              ),
          itemCount: 6));
}



Container _flights(Size size, TextTheme theme) {
  return defaultContainer(
      height: size.height * 0.03,
      child: _titleSpacedRow(theme),
      margin: EdgeInsets.only(bottom: AppMargin.m12),
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p12));
}

Row _titleSpacedRow(TextTheme theme) => spacedRow(
      defaultText(
        text: AppStrings.upcomingFlights.tr(),
        style: boldTitleTripHistory(),
      ),
      defaultGestureDetector(
        child: Text(
          AppStrings.viewAll.tr(),
          style: smallTitleTripHistory(),
        ),
        onTap: () {},
      ),
    );
SizedBox _ticket(Size size) => SizedBox(
    height: size.height * 0.18,
    child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Stack(
              alignment: Alignment.center,
              children: [
                _clippedTicket(size),
                _dashedLine(size),
              ],
            ),
        separatorBuilder: (context, index) => SizedBox(
              width: 10,
            ),
        itemCount: 5));

ClipPath _dashedLine(Size size) => ClipPath(
      clipper: DashedClipper(10),
      child: Container(
        height: 2,
        width: size.width * 0.72 - (size.height + size.width) * 0.019,
        color: ColorManager.grey1,
      ),
    );

Column _clippedTicket(Size size) => Column(
      children: [
        ClipPath(
          clipper: InwardCurveClipper(
              curveDepth: (size.height + size.width) * 0.008,
              bottomLeft: true,
              bottomRight: true), // Custom clipper
          child: Container(
            width: size.width * 0.72,
            height: size.height * 0.09,
            color: ColorManager.white,
            padding: EdgeInsets.all(AppPadding.p12),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: defaultText(
                            text: 'IST',
                            style: TextStyle(
                                fontSize: 15, color: ColorManager.black),
                            align: TextAlign.center)),
                    Expanded(
                        child: Icon(
                      Icons.airplanemode_on_rounded,
                      size: 15,
                    )),
                    Expanded(
                        child: defaultText(
                            text: 'CIA',
                            style: TextStyle(
                                fontSize: 15, color: ColorManager.black),
                            align: TextAlign.center)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: defaultText(
                            text: AppStrings.turkey.tr(),
                            style: TextStyle(
                                fontSize: 15, color: ColorManager.black),
                            align: TextAlign.center)),
                    Expanded(
                        child: defaultText(
                            text: '9H 30M',
                            style: TextStyle(
                                fontSize: 15, color: ColorManager.black),
                            align: TextAlign.center)),
                    Expanded(
                        child: defaultText(
                            text: AppStrings.egypt.tr(),
                            style: TextStyle(
                                fontSize: 15, color: ColorManager.black),
                            align: TextAlign.center)),
                  ],
                ),
              ],
            ),
          ),
        ),
        ClipPath(
          clipper: InwardCurveClipper(
              curveDepth: (size.height + size.width) * 0.008,
              topLeft: true,
              topRight: true), // Custom clipper
          child: Container(
            width: size.width * 0.72,
            height: size.height * 0.09,
            color: ColorManager.white,
          ),
        ),
      ],
    );

class InwardCurveClipper extends CustomClipper<Path> {
  double curveDepth;
  bool topRight, topLeft, bottomLeft, bottomRight;
  InwardCurveClipper(
      {required this.curveDepth,
      this.topLeft = false,
      this.topRight = false,
      this.bottomLeft = false,
      this.bottomRight = false});
  @override
  Path getClip(Size size) {
    Path path = Path();
    // The depth of the inward curve
    // Start from top-left corner
    path.moveTo(curveDepth, 0);
    path.quadraticBezierTo(topLeft ? curveDepth : 0, topLeft ? curveDepth : 0,
        0, curveDepth); //cut top left
    path.lineTo(0, size.height - curveDepth);
    path.quadraticBezierTo(
        bottomLeft ? curveDepth : 0,
        bottomLeft ? size.height - curveDepth : size.height,
        curveDepth,
        size.height); //cut bottom left
    path.lineTo(size.width - curveDepth, size.height);
    path.quadraticBezierTo(
        bottomRight ? size.width - curveDepth : size.width,
        bottomRight ? size.height - curveDepth : size.height,
        size.width,
        size.height - curveDepth); //cut bottom right
    path.lineTo(size.width, curveDepth);
    path.quadraticBezierTo(topRight ? size.width - curveDepth : size.width,
        topRight ? curveDepth : 0, size.width - curveDepth, 0); //cut top right

    // path.lineTo(curveDepth, size.height);
    //
    // // Bottom-left inward curve
    // path.quadraticBezierTo(0, size.height, 0, size.height - curveDepth);
    // path.lineTo(0, curveDepth);

    // Top-left inward curve
    //path.quadraticBezierTo(0, 0, curveDepth, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class DashedClipper extends CustomClipper<Path> {
  double gap;
  DashedClipper(this.gap);
  @override
  Path getClip(Size size) {
    Path path = Path();

    for (double i = 0; i < size.width; i += gap) {
      path.moveTo(i, 0);
      path.lineTo(i, 2);
      path.lineTo(i + gap / 2, 2);
      path.lineTo(i + gap / 2, 0);
      path.lineTo(i, 0);
      print('this is i: $i and this is i plus half the gap: ${i + gap / 2}');
    }
    // path.lineTo(curveDepth, size.height);
    //
    // // Bottom-left inward curve
    // path.quadraticBezierTo(0, size.height, 0, size.height - curveDepth);
    // path.lineTo(0, curveDepth);

    // Top-left inward curve
    //path.quadraticBezierTo(0, 0, curveDepth, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
