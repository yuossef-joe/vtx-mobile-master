import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedPlacesSection extends StatelessWidget {
  const RecommendedPlacesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.recommendedPlaces.tr(), style: Theme.of(context).textTheme.titleLarge),
            GestureDetector(
              onTap: () {},
              child: Text(AppStrings.SEEALL.tr(), style: Theme.of(context).textTheme.labelLarge),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            _buildRecommendedPlace(),
            SizedBox(width: 10.w),
            _buildRecommendedPlace(),
          ],
        ),
      ],
    );
  }

  Widget _buildRecommendedPlace() {
    return Container(
      width: 150.w,
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Container(),//recommendedBuilder(),
    );
  }
}
