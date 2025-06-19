// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../../app/constants/widgets.dart';
// import '../../../../../../domain/model/models.dart';
//
//
// class FamousPlacesSection extends StatelessWidget {
//   final List<FamousPlace> famousPlaces;
//
//   FamousPlacesSection({required this.famousPlaces});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Famous Places', style: Theme.of(context).textTheme.titleLarge),
//             GestureDetector(
//               onTap: () {},
//               child: Text('See All', style: Theme.of(context).textTheme.labelLarge),
//             ),
//           ],
//         ),
//         SizedBox(height: 10.h),
//         Container(
//           height: 200.h,
//           child: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) => famous_builder(
//               '',
//               '',
//               '',
//               200.h,
//               150.w,
//               30.h,
//             ),
//             separatorBuilder: (context, index) => SizedBox(width: 10.w),
//             itemCount: famousPlaces.length,
//           ),
//         ),
//       ],
//     );
//   }
// }