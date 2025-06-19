
import 'package:applocation/presentation/food/favorite_food/view/favorite_food.dart';
import 'package:applocation/presentation/main/pages/home/view/home_page.dart';
import 'package:applocation/presentation/main/pages/settings/settings_page.dart';
import 'package:applocation/presentation/wallet/week/view/week_wallet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  MainViewState createState() => MainViewState();
}
GlobalKey<ScaffoldState> mainScaffoldKey= GlobalKey<ScaffoldState>();
class MainViewState extends State<MainView> {
  List<Widget> pages = [
    HomePage(),
    WeekWallet(),
    FavoriteFood(),
    SettingsPage()
  ];
  List<String> titles = [
    AppStrings.home.tr(),
    AppStrings.search.tr(),
    AppStrings.notifications.tr(),
    AppStrings.settings.tr(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: mainScaffoldKey,
      backgroundColor:Color.fromRGBO(244, 244, 250, 1),
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Color.fromRGBO(198, 198, 200, 1), spreadRadius: AppSize.s1)
        ]),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.lightGrey,
          currentIndex: _currentIndex,
          onTap: onTap,
          items:   [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined), label: AppStrings.home.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.wallet), label: AppStrings.search.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.food_bank_outlined),
                label: AppStrings.restaurants.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person_2_outlined), label:
            AppStrings.profile.tr()
              // AppStrings.profile.tr()
            ),
          ],
        ),
      ),
    );

    // return WillPopScope(
    //   onWillPop: () async {
    //     // Show a confirmation dialog
    //     bool shouldExit = await showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //         title: Text('Confirm Exit'),
    //         content: Text('Do you really want to exit the app?'),
    //         actions: [
    //           TextButton(
    //             onPressed: () => Navigator.of(context).pop(false),
    //             child: Text('Cancel'),
    //           ),
    //           TextButton(
    //             onPressed: () => Navigator.of(context).pop(true),
    //             child: Text('Exit'),
    //           ),
    //         ],
    //       ),
    //     ) ??
    //         false; // Default to false if the dialog is dismissed without selection
    //     return shouldExit;
    //   },
    //   child:
    // );

  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
      //_title = titles[index];
    });
  }
}
