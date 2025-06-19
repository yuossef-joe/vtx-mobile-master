import 'package:applocation/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/font_manager.dart';
import '../../presentation/resources/routes_manager.dart';
import '../../presentation/resources/styles_manager.dart';


Widget buildEditButton(BuildContext context) {
  final Size size = MediaQuery.of(context).size;

  return ElevatedButton(
    onPressed:
        () {
    },
    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
      minimumSize: Size(size.width * 0.26, size.height * 0.041),
    ),

    child: Text("Edit", style: TextStyle(color: ColorManager.white, fontWeight: FontWeight.normal)),
  );
}
class SectionHeading extends StatelessWidget{
  const SectionHeading ({
   super.key,
   this.onPressed,
    required this.title,
    this.buttonTitle = "View all",
    this.showActionButton = true,
});
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style:SectionHeadingTextStyle(
            fontFamily: FontConstants.fontFamilySourceSansPro,color: Colors.black, fontWeight: FontWeightManager.semiBold,fontSize: AppSize.s18),
          maxLines: 1,overflow: TextOverflow.ellipsis,),
        if (showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }}

class profileMenu extends StatelessWidget {
  const profileMenu({
    super.key,
    required this.icon,
    this.color,
    this.title,
    this.onPressed,

  });
    final Widget  icon;
    final color;
    final title;
    final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed,
      child: Row(
        children: [
          Expanded(flex: 3 ,child: icon,),
          Expanded(flex: 7 ,child: Text(title,style: listTitleTextStyle(),overflow: TextOverflow.ellipsis,),),
          Expanded(flex: 2, child: Icon (Icons.arrow_forward_ios,size: AppSize.s20,),)
        ],
      ),
    );
  }
}
class NotificationIcons extends StatefulWidget {
  const NotificationIcons({
    super.key,
    required this.icon,
    this.color,
    required this.title,
    this.onPressed,
    required this.isSwitched,
  });

  final Widget icon;
  final Color? color;
  final String title;
  final void Function()? onPressed;
  final bool isSwitched;

  @override
  _NotificationIconsState createState() => _NotificationIconsState();
}

class _NotificationIconsState extends State<NotificationIcons> {
  late bool isSwitched;

  @override
  void initState() {
    super.initState();
    isSwitched = widget.isSwitched;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.only(right: AppSize.s18),
        child: Row(
          children: [
            Expanded(flex: 3, child: widget.icon),
            Expanded(
              flex: 7,
              child: Text(
                widget.title,
                style: listTitleTextStyle(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Transform.scale(scaleX:1 ,
              scaleY: 0.8, // Adjust the scale factor to increase width (1.2 = 20% wider)
              child: Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
                activeColor: Colors.white,               // Thumb color when active
                activeTrackColor: ColorManager.primary,   // Track color when active
                inactiveThumbColor: Colors.white,         // Thumb color when inactive
                inactiveTrackColor: ColorManager.grey,    // Track color when inactive
              ),
            ),
          ],
        ),
      ),
    );
  }
}


