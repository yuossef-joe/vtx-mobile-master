import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../app/constants/widgets.dart';
import '../../../resources/values_manager.dart';

class TopRatedTourGuide extends StatefulWidget {
  const TopRatedTourGuide({super.key});

  @override
  State<TopRatedTourGuide> createState() => _TopRatedTourGuideState();
}

class _TopRatedTourGuideState extends State<TopRatedTourGuide> {

  @override
  Widget build(BuildContext context) {
    final themes = Theme.of(context).textTheme;
    final size  = MediaQuery.of(context).size;
    return Scaffold(
      appBar: profileAppBar(themes),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width*0.0527522935779817),
        child: SingleChildScrollView(
          child: Column(
            children: [
              searchBar(size: size),
              SizedBox(height: 30,),
              defaultContainer(margin: EdgeInsets.all(AppMargin.m8),child: spacedRow(defaultText(text: AppStrings.topRated.tr(),style: themes.headlineSmall),
                  defaultText(text: AppStrings.SEEALL,style: themes.labelMedium))),
              defaultContainer(
                height: size.height*0.045,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => defaultOutlinedButton(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50),),
                      onPressed: (){},
                      size: size,
                      child: defaultText(text: AppStrings.all.tr(),style: themes.labelMedium)),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: 10,
                ),
              ),

              defaultContainer(
                height: size.height*0.7,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => tourGuideCard(size, themes, 'https://s3-alpha-sig.figma.com/img/0c10/3987/f5fcf29dc0c1fe453d84cbebe0a32693?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=f96KbYu~Mhgia9OQk1PIKmeWLJwFymD2pYJXwMDAr6u4e2z82aFCa4VfuiLMwoTXFA5vimY0zRSgJustjawFK7qf-QG1SAmMzVBz3ZdOrbWTTjnyLxVfHxFhGTjMcel3tn~TTX~P~nUOlgTkoZ0gVIR58DTLpWP0TbApgWQjBJ5IFgfbtZUpezrNjEWdFpqaMaqWgBi6aPzOGXQb4bFrLElOGxLiQG6iSQm4I6G3uOgWhZI00iycDHXSeiHVy04gNLH59M9jl7v2xBrEbWLcnaofOCScLV1okskptISLtBXIBkmjZUXapWuQ6Pa4MQsPU7nzLdueSbTbS6AdXASYFw__'),
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
