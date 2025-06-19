import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../app/constants.dart';
import '../../../../../../app/constants/widgets.dart';
import '../../../../../../domain/model/models.dart';


class CategorySection extends StatelessWidget {
  final List<Category> categories;

  const CategorySection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.categories.tr(), style: Theme.of(context).textTheme.titleLarge),
            GestureDetector(
              onTap: () {},
              child: Text(AppStrings.SEEALL.tr(), style: Theme.of(context).textTheme.titleLarge),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 120.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => category_builder(
              30.w,
              40.h,
              25.h,
              100.w,
              '${Constants.baseUrlImages}${categories[index].image}',
              categories[index].name,
            ),
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            itemCount: categories.length,
          ),
        ),
      ],
    );
  }
}
