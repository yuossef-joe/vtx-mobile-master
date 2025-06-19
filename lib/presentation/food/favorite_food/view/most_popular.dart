import 'package:applocation/app/constants/widgets.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';

class mostPopular extends StatefulWidget {
  const mostPopular({super.key});

  @override
  State<mostPopular> createState() => _mostPopularState();
}

class _mostPopularState extends State<mostPopular> {
  @override
  Widget build(BuildContext context) {
    final themes = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: backAppBar2(AppStrings.mostPopular.tr(),),
      body: ListView.builder(itemBuilder: (context, index) => circularBorderContainer(
          size: size,
          width: 0.86,
          height: 0.11,
          child: Row(
            children: [
              circular_image(
                  height: size.height * 0.079,
                  width: size.width * 0.17,
                  image:
                  'https://s3-alpha-sig.figma.com/img/9b1e/17f0/3c160ccb218f62eaaf9690726fe3dd4e?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=bUxrtnG5nfQyTF25Bt51AZPCmgXgMdFhQK1NqjTLp5nswq8EcBeOl5NRujmNHNwfH8wP6P~zwD-mthwsgjHeQotbM7k-rsY37oad4s6URQJnAxO0y2Lzj3qNM0ghMe9Q8~FBg3IgP0jeTpU-DD3KtoqA476EGSIJahsc0jV4g3jDvAb0l7JhhLmxnTyHPE2~LdxesAv40QHgHzfYwsxcnnOUd8P39guhxeHtZaS-NWepXXZK24xUsK1SKaDrGMNl6ET5GzEvwFllqXyS2kp3htuYYxw0g4mYktYAKaRlX3ZGxEO7BZ3STC9Yk2brv~kFEMzdiSJwNOg2rhAtu7PhMg__'),
              SizedBox(
                width: size.width * 0.055,
              ),
              defaultContainer(
                height: size.height * 0.048,
                width: size.width * 0.3,
                child: defaultText(
                    text: AppStrings.italianFoodCollection.tr(),
                    style: headLineTextHighest(color: ColorManager.black)),
              ),
              defaultGestureDetector(
                  child: Icon(
                    Icons.location_on_outlined,
                    color: ColorManager.primary,
                  ),
                  onTap: () {}),
              defaultContainer(
                height: size.height * 0.032,
                width: size.width * 0.243,
                child: defaultText(
                    text: AppStrings.alexandria.tr(),
                    style: themes.headlineMedium!),
              )
            ],
          ),
          color: ColorManager.white,
          padding: EdgeInsets.only(
              top: size.height * 0.0137,
              bottom: size.height * 0.0137,
              left: size.width * 0.03),
          margin: EdgeInsets.only(
              top: size.height * 0.018, left: size.width * 0.018)),),
    );
  }
}
