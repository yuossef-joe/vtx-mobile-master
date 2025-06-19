import 'package:applocation/app/app_preferences.dart';
import 'package:applocation/app/constants/widgets.dart';
import 'package:applocation/domain/model/models.dart';
import 'package:applocation/domain/state_management/cubit/plan_cubit.dart';
import 'package:applocation/domain/state_management/states/plan_states.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';

class upgradeToPro extends StatefulWidget {
  const upgradeToPro({super.key});

  @override
  State<upgradeToPro> createState() => _upgradeToProState();
}

class _upgradeToProState extends State<upgradeToPro> {
  final PageController _pageController = PageController(viewportFraction: 0.75);
  double _currentPageValue = 0.0; // Track page value manually
  int _currentPage =0;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void initState() {
    super.initState();
    // Listen to the PageController's changes
    _pageController.addListener(() {
      setState(() {
        _currentPageValue =
        _pageController.hasClients ? _pageController.page ?? 0.0 : 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size =MediaQuery.of(context).size;
    final TextTheme theme = Theme.of(context).textTheme;
    return BlocProvider<PlansCubit>(create: (context) =>instance<PlansCubit>()..fetchPlans(),
      child: BlocConsumer<PlansCubit,PlanState>(builder: (context, state) {
        if (state is PlanLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PlanLoaded) {
          return _getContent(
              size, theme, state.plans);
        } else if (state is PlanError) {
          return Center(child: Text(state.message));
        } else {
          return Container();
        }
      }, listener: (context, state) {

      },),
    );
  }

  Widget _getContent(Size size, TextTheme theme,PlanApi plan)
  {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      // appBar: AppBar(
      //   title:
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            subscriptionTittle(AppStrings.subscriptionPlan.tr(),context),
            defaultContainer(
              width: size.width/2,
              child: defaultText( text:
              AppStrings.facilities.tr(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            defaultContainer(
              height: size.height*0.457,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page; // Update the current page
                  });
                },
                itemCount: plan.plans?.length??0,
                itemBuilder: (context, index) {
                  final scale = _getScale(index);
                  final offsetY = _getOffsetY(index);
                  return Transform.translate(
                    offset: Offset(0, offsetY),
                    child: Transform.scale(
                      scale: scale,
                      child: _buildPlanCard(plan.plans![index],size,theme),
                    ),
                  );
                },
              ),
            ),
            defaultElevatedButton(
              onPressed: () async {
                final bool? check = await _appPreferences.getCard();
                check ==null? Navigator.pushNamed(context, Routes.addCard):Navigator.pushNamed(context, Routes.payment, arguments: plan.plans![_currentPage]);
              },
              text: AppStrings.chooseAPlan.tr(),
              width: 0.87,
              size: size,
            ),
          ],
        ),
      ),
    );
  }

  double _getScale(int index) {
    final diff = (_currentPageValue - index).abs();
    return (diff < 1) ? 1 - (0.1 * diff) : 0.9;
  }

  double _getOffsetY(int index) {
    final diff = (_currentPageValue - index).abs();
    return (diff < 1) ? diff * 30 : 30;
  }

  Widget _buildPlanCard(Plan plan,Size size,TextTheme theme) {
    return circularBorderContainer(
      size: size,
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            plan.planName,
            style: theme.titleLarge,
          ),
          SizedBox(height: 10),
          ...plan.features.map(
                (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  Icon(Icons.check, color: Colors.blue, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      feature.featureName,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class SubscriptionPlan {
  final String title;
  final List<String> features;

  SubscriptionPlan({required this.title, required this.features});
}

// Sample Data