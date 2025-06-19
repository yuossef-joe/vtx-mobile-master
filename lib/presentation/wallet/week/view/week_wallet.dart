 import 'package:applocation/app/constants/widgets.dart';
import 'package:applocation/presentation/resources/color_manager.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:applocation/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../app/constants.dart';

class WeekWallet extends StatefulWidget {
  const WeekWallet({super.key});

  @override
  State<WeekWallet> createState() => _WeekWalletState();
}

class _WeekWalletState extends State<WeekWallet> {
  final List<bool> _selected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    final themes=Theme.of(context).textTheme;
    double width=size.width*0.9;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          elevation: Constants.zero.toDouble(),
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
          title: Text(
            AppStrings.wallet.tr(),
            style: themes.titleLarge,
          ),
          leading: BackButton(style: transparentButtonStyle()),
          actions: [IconButton(onPressed: () {},style: transparentButtonStyle(), icon: Icon(Icons.more_vert))],
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            circularBorderContainer(size: size,
              circle: 10,
              color: const Color.fromRGBO(174, 174, 178, 1),
              child: ToggleButtons(
              isSelected: _selected,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < _selected.length; i++) {
                    _selected[i] = i == index;
                  }
                });
              },
              borderWidth: 0, // No borders
              borderColor: Colors.transparent,
                borderRadius: BorderRadius.circular(10),

              fillColor: const Color.fromRGBO(131, 131, 131, 1), // Selected background color
             // Non-selected text color
              selectedColor: Colors.white,

              constraints: BoxConstraints(
                minHeight: 50, // Adjust height
                minWidth: width / 3, // Ensure equal width per button
              ),
              children: const <Widget>[
                Text('Week'),
                Text('Month'),
                Text('Year'),
              ],
                        ),
            ),
              defaultContainer(
                margin: EdgeInsets.symmetric(vertical: AppMargin.m12),
                child: Center(
                  child: defaultText(text: AppStrings.totalSpending.tr(), style: themes.headlineMedium),
                ),
              ),
             circularBorderContainer(
               circle: size.width*0.13,
               width: 0.83,
               height: 0.17,
               size: size,
               color: Color.fromRGBO(51, 51, 51, 1),
               child: Row(
                 children: [
                   Expanded(child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       defaultText(text: AppStrings.balance.tr(),style: TextStyle(
                         color: ColorManager.white,
                         fontFamily: AppStrings.quicksand.tr(),
                         fontSize: AppSize.s18,
                       )),

                       defaultText(text: '\$ 1.234',style: TextStyle(
                         color: ColorManager.white,
                         fontFamily: AppStrings.quicksand.tr(),
                         fontSize: AppSize.s18,
                       )),
                     ],
                   ),),

                   Expanded(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         defaultText(
                           text: AppStrings.card.tr(),
                           style: TextStyle(
                             color: ColorManager.white,
                             fontFamily:AppStrings.quicksand.tr(),
                             fontSize: AppSize.s18,
                           ),
                         ), // Adjust spacing between the two texts
                         defaultText(
                           text: AppStrings.midBank.tr(),
                           style: TextStyle(
                             color: ColorManager.white,
                             fontFamily: AppStrings.quicksand.tr(),
                             fontSize: AppSize.s18,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ),

            defaultContainer(
              margin: EdgeInsets.only(top:AppMargin.m12,right: size.width*0.1,left: size.width*0.1),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      circularBorderContainer(size: size,
                          child:
                          Icon(size: (size.width+size.height)*0.028,
                            IconsaxPlusLinear.convert,
                            color: Color.fromRGBO(47, 17, 85, 1),),
                          padding: EdgeInsets.all(size.height*0.01)),
                      defaultText(text: AppStrings.transfer.tr(), style: TextStyle(
                        color: ColorManager.primary,
                        fontFamily: AppStrings.quicksand.tr(),
                        fontSize: AppSize.s14,
                      ),)
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      circularBorderContainer(size: size,child: Icon(size: (size.width+size.height)*0.028,IconsaxPlusLinear.export,color: Color.fromRGBO(47, 17, 85, 1),),padding: EdgeInsets.all(size.height*0.01)),
                      defaultText(text: AppStrings.payment.tr(), style: TextStyle(
                        color: ColorManager.primary,
                        fontFamily: AppStrings.quicksand.tr(),
                        fontSize: AppSize.s14,
                      ),)
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      circularBorderContainer(size: size,child: Icon(size: (size.width+size.height)*0.028,IconsaxPlusLinear.money_send,color: Color.fromRGBO(47, 17, 85, 1),),padding: EdgeInsets.all(size.height*0.01)),
                      defaultText(text: AppStrings.payout.tr(), style: TextStyle(
                        color: ColorManager.primary,
                        fontFamily: AppStrings.quicksand.tr(),
                        fontSize: AppSize.s14,
                      ),)
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      circularBorderContainer(circle: size.width*0.05,color: ColorManager.white,shadow: true,size: size,child: Icon(size: (size.width+size.height)*0.028,IconsaxPlusLinear.add_circle,color: Color.fromRGBO(47, 17, 85, 1),),padding: EdgeInsets.all(size.height*0.01)),
                      defaultText(text: AppStrings.topUp.tr(), style: TextStyle(
                        color: ColorManager.primary,
                        fontFamily: AppStrings.quicksand.tr(),
                        fontSize: AppSize.s14,
                      ),)
                    ],
                  ),
                ],
              ),
            ),

              spacedRow(defaultText(text: AppStrings.lastTransaction.tr(),style: themes.titleLarge), defaultText(text: AppStrings.viewAll.tr(),style: themes.labelMedium)),
              defaultContainer(
                height: size.height*0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _cardRow(size,themes),
                    _cardRow(size,themes),
                    _cardRow(size,themes),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Row _cardRow(Size size,TextTheme themes)=>Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://s3-alpha-sig.figma.com/img/39ea/16d8/1005e00819fc916e19b07cb4ebdd018a?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Pkq8PvvcbSUUD6tWvWDAhjyDrGSugI07GMn~aLdQ3AQRPC9ZhIbvC74VoYQMd1PAZu5IlAqwW41oozXmeI~Upckcx13pniwlKAHMCGUxPceVp0Ynv13~4khHyFsV5uRpVUL~WJi~I-IPdnVEOvcj2t1bNbgzwyrZecbZllcb2r71EGM~m8UMzN0vG04hss9nl9W-nO9Y6mq8JWkOG9RwyDDqwtpAEptKzmpA9hlpXaLesRRTYTCV9UENB9ubZEEtW2LPtc3FWdL~W6nbWvvX6QsFjuLieT8eOCjBwmmIOIlLOKF2pcjdejiEVlWkGdOX9FvE8MmQ4NKIdjSZRhPCUw__',
          ),
          radius: size.width*0.065, // Optional: Adjust the radius as needed
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: AppMargin.m8),
        child:    Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            defaultText(text: AppStrings.regencyHotel.tr(),style: themes.titleLarge),
            defaultText(text: AppStrings.nights.tr(),style: themes.bodySmall),
          ],
        ),
      ),
      Spacer(),
     defaultText(text: '\$12',style: themes.titleLarge),
    ],
  );
}
