import 'package:applocation/app/app_preferences.dart';
import 'package:applocation/presentation/resources/font_manager.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:applocation/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../app/constants/widgets.dart';
import '../../app/di.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});
  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  TextStyle _style()=>TextStyle(
    fontFamily: FontConstants.fontFamilyRoboto,
    color: Color.fromRGBO(51, 51, 51, 1),
    fontWeight: FontWeight.w500,
    fontSize: AppSize.s16,
  );
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme themes=Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        leading: BackButton(
          style: transparentButtonStyle(),
          color: Color.fromRGBO(51, 51, 51, 1),
        ),
        title: Text(AppStrings.AddCard.tr(),style: themes.headlineSmall,),
        actions: [
          IconButton(onPressed: (){}, style: transparentButtonStyle(),icon: Icon(Icons.more_vert_outlined,color: Color.fromRGBO(51, 51, 51, 1),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height*0.82,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultText(text: AppStrings.NameOnCard.tr(),style: _style()),
                  SizedBox(height: 16.0),
                  defaultTextFormField(
                    controller: nameController,
                    title: '',
                    style: TextStyle(color: Colors.black),
                  ),

                  SizedBox(height: 16.0),

                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child:   defaultText(text: 'Card number',style: _style()),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        flex: 4,
                        child:    defaultText(text: 'CVV',style: _style()),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: defaultTextFormField(
                          controller: cardNumberController,
                          title: '',
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length != 16) {
                              return AppStrings.Carderror.tr();
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        flex: 4,
                        child: defaultTextFormField(
                          controller: cvvController,
                          title: '',
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length != 3) {
                              return 'CVV must be 3 digits';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child:   defaultText(text: AppStrings.Month.tr(),style: _style()),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        flex: 4,
                        child:    defaultText(text: AppStrings.Year.tr(),style: _style()),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [

                      Expanded(
                        flex: 6,
                        child: defaultTextFormField(
                          controller: monthController,
                          title: '',
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length != 2) {
                              return AppStrings.Montherror.tr();
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        flex: 4,
                        child: defaultTextFormField(
                          controller: yearController,
                          title: '',
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length != 2) {
                              return AppStrings.Yearerror.tr();
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
              defaultElevatedButton(
                onPressed:
                (){
                  _appPreferences.addCard();
                  Navigator.pop(context);
                },
                text: AppStrings.SaveCard.tr(),
                size: size,
                height: 0.072,
              ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
