import 'package:applocation/app/constants.dart';
import 'package:applocation/app/constants/widgets.dart';
import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/model/place_profile_models.dart';
import 'package:applocation/presentation/resources/color_manager.dart';
import 'package:applocation/presentation/resources/font_manager.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:applocation/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:applocation/domain/state_management/cubit/place_profile_cubit.dart';
import 'package:applocation/domain/state_management/states/place_profile_states.dart';

class PlaceProfileView extends StatefulWidget {
  final int placeId;

  const PlaceProfileView({super.key, required this.placeId});

  @override
  State<PlaceProfileView> createState() => _PlaceProfileViewState();
}

class _PlaceProfileViewState extends State<PlaceProfileView> {
  @override
  void initState() {
    super.initState();
    context.read<PlaceProfileCubit>().fetchPlaceProfile(widget.placeId);
  }

  final int itemsPerPage = 3;
  PageController pageController = PageController();
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme themes = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: transparentButtonStyle(),
          icon: Icon(Icons.arrow_back_ios_new, color: ColorManager.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(AppStrings.placeProfile.tr(),
            style: TextStyle(color: Colors.black)),
        actions: [
          // TextButton(
          //   onPressed: () {},
          //   child: Text(AppStrings.clear.tr(),
          //       style: TextStyle(color: Colors.blue)),
          // ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocConsumer<PlaceProfileCubit, PlaceProfileState>(
        listener: (context, state) {
          if (state is PlaceProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is PlaceProfileLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PlaceProfileLoaded) {
            return _buildProfileContent(context, themes, state.profile,size);
          } else {
            return Center(child: Text(AppStrings.noDataAvailable));
          }
        },
      ),
    );
  }

  TextStyle _style() => TextStyle(
      color: Color.fromRGBO(99, 145, 244, 1),
      fontSize: AppSize.s18,
      fontWeight: FontWeight.w700,
      fontFamily: FontConstants.fontFamilyRoboto);

  Widget _buildProfileContent(
      BuildContext context, TextTheme themes, PlaceProfileModel profile,Size size) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          defaultContainer(
            height: size.height*0.78,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // About Us Section
                  Text(
                    AppStrings.aboutUsTheRestaurant.tr(),
                    style: _style(),
                  ),
                  SizedBox(height: 8),

                  Wrap(
                    alignment: WrapAlignment.end,
                    children: [
                      Text(
                        profile.data != null ? profile.data!.profile!.about : '',
                        style: themes.headlineMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to reviews page
                        },
                        child: Text(
                          AppStrings.seeAllReviews.tr(),
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),

                  // Pictures of the Restaurant
                  Text(AppStrings.picturesOfTheRestaurant.tr() , style: _style()),
                  SizedBox(height: 8),


                  _buildImageGallery(
                     profile.data != null ? profile.data!.profile!.images : [],size),

                  // Stack(
                  //   alignment: Alignment.center,
                  //   children: [
                  //     _buildImageGallery(
                  //         profile.data != null ? profile.data!.profile!.images : [],size),
                  //     _buttonsRow( (profile.data!.profile!.images.length / itemsPerPage).ceil())
                  //   ],
                  // ),

                  SizedBox(height: 16),

                  // Our Menu Section
                  Text(AppStrings.ourMenu.tr(), style: _style()),
                  SizedBox(height: 8),
                  Text(profile.data != null ? profile.data!.profile!.menu : '',
                      style: themes.headlineMedium),
                  SizedBox(height: 8),
                  _buildImageGalleryMenu(profile.data != null
                      ? profile.data!.profile!.menuImages
                      : [],size),
                  SizedBox(height: 16),


                  // QR Code Button
                  // Center(
                  //   child: ElevatedButton.icon(
                  //     onPressed: () {},
                  //     icon: Icon(Icons.qr_code_scanner),
                  //     label: Text("Scan QR Code For The Menu"),
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.blue,
                  //       minimumSize: Size(double.infinity, 50),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(height: size.height*0.005,),
          defaultContainer(
            height: size.height*0.06,
            child:   OutlinedButton.icon(
              onPressed: () {
                // Handle QR code scan
              },
              icon: Icon(Icons.qr_code_scanner, color: Colors.blue),
              label: Text(
                AppStrings.scanQRCode.tr(),
                style: TextStyle(color: Colors.blue),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGalleryMenu(List<PlaceProfileImageModel> images,Size size) {
    return defaultContainer(
      height: size.height*0.2,
      child: ListView.builder(
        itemCount: images.length,
        scrollDirection:Axis.horizontal,
        itemBuilder: (context, index) {
          return defaultContainer(
            margin: EdgeInsets.symmetric(horizontal: size.width*0.015),
            child: circular_image(
                image: '${Constants.baseUrlImages}${images[0].image}',
                circle: 0,
                width: size.width*0.22,
                height: size.height*0.2),
          );
        },),);
  }



  Widget _buildImageGallery(List<PlaceProfileImageModel> images,Size size) {
    return defaultContainer(
      height: size.height*0.2,
      child: ListView.builder(
      itemCount: images.length,
          scrollDirection:Axis.horizontal,
          itemBuilder: (context, index) {
          return defaultContainer(
          margin: EdgeInsets.symmetric(horizontal: size.width*0.015),
          child: circular_image(
          image: '${Constants.baseUrlImages}${images[0].image}',
          circle: 0,
          width: size.width*0.3,
          height: size.height*0.2),
          );
          },),);
  }

  // Widget _buildImageGallery(List<PlaceProfileImageModel> images,Size size) {
  //   int numberOfPages = (images.length / itemsPerPage).ceil();
  //   return defaultContainer(
  //     height: size.height*0.2,
  //     child: Padding(
  //       padding: const EdgeInsets.all(AppSize.s8),
  //       child: PageView.builder(
  //         controller: pageController,
  //         itemCount: numberOfPages,
  //         itemBuilder: (context, index) {
  //           return ListView.builder(
  //             itemCount: images.length+8,
  //             scrollDirection:Axis.horizontal,
  //             physics: NeverScrollableScrollPhysics(),
  //             itemBuilder: (context, index) {
  //            return defaultContainer(
  //               margin: EdgeInsets.symmetric(horizontal: size.width*0.02),
  //               child: circular_image(
  //                   image: '${Constants.baseUrlImages}${images[0].image}',
  //                   circle: 0,
  //                   width: size.width*0.3,
  //                   height: size.height*0.2),
  //             );
  //           },);
  //         },
  //         onPageChanged: (index) {
  //           setState(() {
  //             currentPageIndex = index;
  //           });
  //         },
  //       ),
  //     ),
  //   );
  // }

  // Row _buttonsRow(int numberOfPages)=> spacedRow( IconButton(onPressed: currentPageIndex > 0
  //     ? () {
  //   setState(() {
  //     currentPageIndex--;
  //     pageController.jumpToPage(currentPageIndex);
  //   });
  // }
  //     : null, icon: Icon(
  //   color: Colors.black.withOpacity(0.35),
  //   Icons.arrow_back_ios_new,
  // ), ),
  //     IconButton(
  //       onPressed:
  //       currentPageIndex < numberOfPages - 1
  //           ? () {
  //         setState(() {
  //           currentPageIndex++;
  //           pageController.jumpToPage(currentPageIndex);
  //         });
  //       }
  //           : null, icon: Icon(
  //       Icons.arrow_forward_ios,
  //     ), ) );

}
