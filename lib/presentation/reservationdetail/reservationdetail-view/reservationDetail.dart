import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:applocation/presentation/resources/styles_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../app/constants/widgets.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';

class ReservationDetail extends StatefulWidget {
  const ReservationDetail({super.key});

  @override
  State<ReservationDetail> createState() => _ReservationDetailState();
}

class _ReservationDetailState extends State<ReservationDetail> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<String> request = <String>['Indoor', 'Table 1029', '4', 'INCOMPLETE',  'Projector'];
    final List<String> labels = <String>['Facilities Type', 'Facilities No', 'PAX', 'Status', 'Equipment'];

    return Scaffold(
      appBar: backAppBar2("27 April 2024, 16:50-18:50"),
      body: Stack(
        children: [
          SizedBox(
            height: size.height*1,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.053, vertical: size.width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _header(),
                  SizedBox(),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.05),
                      child: Text(AppStrings.BadmintonCourt.tr(), style: BookingID(fontSize: 22)),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: request.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _lsit(labels[index], request[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                  ),
                  SizedBox(height: size.height * 0.1), // Extra space to avoid overlap with buttons
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: ColorManager.white,  // Ensure background color is white for the bottom area
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.053, vertical: size.height * 0.02),
              child: Column(
                children: [
                  _buildEditButton(AppStrings.EditReservation.tr(),ColorManager.primary),
                  SizedBox(height: size.height * 0.02), // Space between buttons
                  _buildEditButton(AppStrings.CancelReservation.tr(),ColorManager.button), // Second button
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Row displaying each label and request item
  Widget _lsit(String label, String requestItem) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: list()),
          Text(requestItem, style: list()),
        ],
      ),
    );
  }

  // Header displaying Booking ID
  Widget _header() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppStrings.BookingID.tr(), style: BookingID()),
          Text("#: 000102340908", style: idNumber()),
        ],
      ),
    );
  }

  Widget _buildEditButton(String title , color) {
    final Size size = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, Routes.mainRoute);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(AppSize.s18),
                left: Radius.circular(AppSize.s18))),
        minimumSize: Size(size.width * 0.9, size.height * 0.072),
      ),
      child: Text(title, style: TextStyle(color: ColorManager.white, fontWeight: FontWeight.w600)),
    );
  }
}
