import 'package:applocation/domain/state_management/bloc/login_bloc.dart';
import 'package:applocation/domain/state_management/cubit/user_cubit.dart';
import 'package:applocation/domain/state_management/events/login_events.dart';
import 'package:applocation/domain/state_management/states/user_states.dart';
import 'package:applocation/presentation/login/view/login_view.dart';
import 'package:applocation/presentation/resources/color_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_it/get_it.dart';
import 'dart:math' as math;
import '../../../../app/app_preferences.dart';
import '../../../../app/constants/profile_widgets.dart';
import '../../../../app/constants/widgets.dart';
import '../../../../app/di.dart';
import '../../../../data/data_source/local_data_source.dart';
import '../../../resources/langauge_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final LocalDataSource _localDataSource = instance<LocalDataSource>();

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<UserCubit,UserState>(
      listener: (context,state){

      }, builder:
        (context,state) {
       if(state is UserLoading)
         {
           return Center(child: CircularProgressIndicator(),);
         }
       else if(state is UserSuccess)
         {
           return Center(
             child: ListView(
               padding: const EdgeInsets.only(top: AppPadding.p34, left: AppPadding.p8),
               children: [
                 ListTile(
                   title: Text(
                       AppStrings.profile.tr(),
                       //AppStrings.myProfile.tr(),
                       style: settingTextStyle()),
                   trailing: Transform(
                     alignment: Alignment.center,
                     transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
                   ),
                 ),
                 ListTile(
                   leading: defaultContainer(
                     height: 50,
                     width: 50,
                     child: circular_image(
                         width: 50,
                         height: 50,
                         image:
                         state.userResponse.user?.user?.avatar??"",
                         circle: 25),
                   ),
                   title: Text(
                       state.userResponse.user?.user?.name??'',
                       //AppStrings.name.tr(),
                       style: settingTextStyle()),
                   subtitle:Text(
                      AppStrings.joinedSince.tr(args:[state.userResponse.user?.user?.emailVerifiedAt??'']),
                     //AppStrings.joinDate.tr(),
                   ),
                   trailing: buildEditButton(context),
                   subtitleTextStyle:subTitleTextStyle(),
                 ),

                 Padding(
                   padding: EdgeInsets.only(top: AppPadding.p28, left: AppPadding.p50),
                   child: const SectionHeading(title:AppStrings.settings, showActionButton: false,),
                 ),
                 SizedBox(height: AppSize.s20,),
                 profileMenu(icon:Icon(Icons.language,color: ColorManager.primary,),title: AppStrings.language.tr(),onPressed: _changeLanguage),
                 SizedBox(height: AppSize.s20,),
                 profileMenu(icon:Icon(Icons.location_on_outlined,color: ColorManager.primary,),title:AppStrings.location.tr(),onPressed: _location,),
                 SizedBox(height: AppSize.s20,),
                 const Divider(height: 10,indent: 10,endIndent: 10,),

                 Padding(
                   padding: EdgeInsets.only(top: AppPadding.p28, left: AppPadding.p50),
                   child: const SectionHeading(title:AppStrings.notification, showActionButton: false,),
                 ),
                 SizedBox(height: AppSize.s20,),
                 NotificationIcons(icon:Icon(Icons.notifications_none,color: ColorManager.primary,),title: AppStrings.pop_up_Notification.tr(),onPressed: () {}, isSwitched: false,),
                 SizedBox(height: AppSize.s20,),
                 const Divider(height: 10,indent: 10,endIndent: 10,),

                 Padding(
                   padding: EdgeInsets.only(top: AppPadding.p28, left: AppPadding.p50),
                   child: const SectionHeading(title:AppStrings.other, showActionButton: false,),
                 ),
                 SizedBox(height: AppSize.s20,),
                 profileMenu(icon:Icon(Icons.history_edu_rounded,color: ColorManager.primary,),title: AppStrings.tripHistory.tr(),onPressed: _tripHistory,),
                 SizedBox(height: AppSize.s20,),
                 profileMenu(icon:Icon(Icons.headphones_outlined,color: ColorManager.primary,),title: AppStrings.pop_up_Notification.tr(),onPressed: () {},),
                 SizedBox(height: AppSize.s20,),
                 profileMenu(icon:Icon(Icons.warning_amber_rounded ,color: ColorManager.primary,),title: AppStrings.about.tr(),onPressed: () {},),
                 SizedBox(height: AppSize.s20,),
                 profileMenu(icon:Icon(Icons.logout ,color: ColorManager.button,),title: AppStrings.logout.tr(),onPressed: _logout, ),
                 SizedBox(height: AppSize.s20,),

               ],
             ),
           );
         }
       else
         return Center(child: Text(AppStrings.noAvailableData.tr()),);
      }
    );

  }

  bool isRtl() {
    return context.locale == ARABIC_LOCAL;
  }

  _changeLanguage() {
    // i will implement it later
    _appPreferences.changeAppLanguage();
    Phoenix.rebirth(context);
  }



  _inviteFriends() {
    // its a task for you to share app name to friends
  }
  _tripHistory(){
    //Navigator.pushReplacementNamed(context, Routes.tripHistory);

  }
  _location(){
    //Navigator.pushReplacementNamed(context, Routes.upgradeToProRoute);

  }
  _logout() async {
    // app prefs make that user logged out
    GetIt.I.reset();
    await _appPreferences.clear().then((_){
      if(context.mounted)
        {
          context.read<LoginBloc>().add(LogoutEvent());
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginView()),
                (route) => false, // Remove all previous routes
          );
        }
    });
    // clear cache of logged out user

    // navigate to login screen

  }
}


