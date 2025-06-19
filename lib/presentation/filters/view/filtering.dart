import 'package:applocation/app/constants/widgets.dart';
import 'package:applocation/presentation/resources/color_manager.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:applocation/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FilteringScreen extends StatefulWidget {
  const FilteringScreen({super.key});

  @override
  State<FilteringScreen> createState() => _FilteringScreenState();
}

class _FilteringScreenState extends State<FilteringScreen> {
  int daysInMonth=30,selected=1;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    final themes=Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: Row(
          children: [
            BackButton(color: ColorManager.primary,style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(ColorManager.white)),),
            defaultGestureDetector(child: defaultText(text: AppStrings.clear.tr(),style: themes.labelMedium)),
          ],
        ),
        elevation: 0,
        leadingWidth: 150,
        forceMaterialTransparency: true,
        title: defaultText(text: AppStrings.filtration.tr(),style: themes.titleLarge),
        actions: [
          IconButton(color: Colors.white,onPressed: (){}, icon: Icon(Icons.cancel_outlined,color: ColorManager.primary,),)
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _divider(size),
              defaultContainer(
                margin: EdgeInsets.symmetric(horizontal:AppMargin.m20,vertical: AppMargin.m12),
                child: defaultText(text: AppStrings.byDate.tr(),style: themes.labelMedium),
              ),
              defaultContainer(
                height: size.height*0.1,
                padding: EdgeInsets.symmetric(horizontal: size.width*0.126,),
                child: ListView.builder(itemBuilder: (context,index){
                daysInMonth = getDaysInMonth(2024, 10);

                return defaultGestureDetector(
                  child:daysBuilder(size,themes,2024,10,index+1,selected),
                  onTap: (){
                    setState(() {
                      selected=index+1;
                    });
                  },);
                },itemCount: daysInMonth,scrollDirection: Axis.horizontal,),
              ),
              SizedBox(height: AppSize.s12,),
              _divider(size),
              defaultContainer(
                margin: EdgeInsets.symmetric(horizontal:AppMargin.m20,vertical: AppMargin.m12),
                child: defaultText(text:AppStrings.byRate.tr(),style: themes.labelMedium),
              ),
              _buildRatingOption(4.0),
              _buildRatingOption(3.5),
              _buildRatingOption(3.0),

              SizedBox(height: AppSize.s12,),
              _divider(size),
              defaultContainer(
                margin: EdgeInsets.symmetric(horizontal:AppMargin.m20,vertical: AppMargin.m12),
                child: defaultText(text: AppStrings.byType.tr(),style: themes.labelMedium),
              ),

              _buildRatingOption(1,defaultText(text: AppStrings.restaurants.tr(),)),
              _buildRatingOption(2,defaultText(text: AppStrings.lounge.tr(),)),
              _buildRatingOption(3,defaultText(text: AppStrings.party.tr(),)),

              Center(child: defaultOutlinedButton(onPressed: (){}, size: size,child: defaultText(text: AppStrings.save.tr(),style: themes.labelMedium),width: 0.76,height: 0.056,))
            ],
          ),
        ),
      ),
    );
  }

  Divider _divider(Size size)=>Divider(
    color: //ColorManager.grey,
    Color.fromRGBO(222, 222, 222, 1),
    indent: size.width*0.04,
    endIndent: size.width*0.04,
  );
  double? _selectedRating ,_selectedType; // Default selected value

  Widget _buildRatingOption(double rating,[Widget? child]) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent, // Removes the highlight color
        splashColor: Colors.transparent, // Removes the splash effect
      ),
      child: RadioListTile<double>(
        value: rating,
        groupValue: child==null?_selectedRating:_selectedType,
        onChanged: (double? value) {
          setState(() {
            child==null?_selectedRating = value!:_selectedType=value!;
          });
        },
        title: child??Row(
          children: [
            Text(
              '$rating & up',
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(width: 8),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: index < rating.round()
                      ? Colors.orange
                      : Colors.grey.shade300,
                  size: 20,
                );
              }),
            ),
          ],
        ),
        controlAffinity: ListTileControlAffinity.leading, // Align radio left
        activeColor: Colors.blue,
        contentPadding: EdgeInsets.all(0),
        // Color of the selected radio button
      ),
    );
  }
}
