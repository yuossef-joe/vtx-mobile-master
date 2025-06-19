// import 'package:applocation/presentation/register/view_model/register_viewmodel.dart';
// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
//
// import '../../app/app_preferences.dart';
// import '../../app/constants/functions.dart';
// import '../../app/constants/widgets.dart';
// import '../../app/di.dart';
// import '../common/state_renderer/state_renderer_impl.dart';
// import '../resources/assets_manager.dart';
// import '../resources/color_manager.dart';
// import '../resources/routes_manager.dart';
// import '../resources/values_manager.dart';
//
// class RegisterView extends StatefulWidget {
//   const RegisterView({Key? key}) : super(key: key);
//
//   @override
//   _RegisterViewState createState() => _RegisterViewState();
// }
//
// class _RegisterViewState extends State<RegisterView> {
//   final RegisterViewModel _viewModel = instance<RegisterViewModel>();
//   final AppPreferences _appPreferences = instance<AppPreferences>();
//   final TextEditingController _userNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   bool _isObscure = true;
//   _bind() {
//     _viewModel.start();
//     _userNameController.addListener(() {
//       _viewModel.setUserName(_userNameController.text);
//     });
//     _emailController.addListener(() {
//       _viewModel.setEmail(_emailController.text);
//     });
//
//     _passwordController.addListener(() {
//       _viewModel.setPassword(_passwordController.text);
//     });
//
//     _phoneController.addListener(() {
//       _viewModel.setMobileNumber(_phoneController.text);
//     });
//     _viewModel.isUserRegisteredInSuccessfullyStreamController.stream
//         .listen((isLoggedIn) {
//       if (isLoggedIn) {
//         // navigate to main screen
//         SchedulerBinding.instance.addPostFrameCallback((_) {
//           _appPreferences.setUserLoggedIn();
//           Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
//         });
//       }
//     });
//   }
//
//   @override
//   void initState() {
//     _bind();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.white,
//       appBar: AppBar(
//         elevation: AppSize.s0,
//         backgroundColor: ColorManager.white,
//         iconTheme: IconThemeData(color: ColorManager.primary),
//       ),
//       body: StreamBuilder<FlowState>(
//         stream: _viewModel.outputState,
//         builder: (context, snapshot) {
//           return snapshot.data?.getScreenWidget(context, _getContentWidget(),
//                   () {
//                 _viewModel.register();
//               }) ??
//               _getContentWidget();
//         },
//       ),
//     );
//   }
//
//   Widget _getContentWidget() {
//     final Size size = MediaQuery.of(context).size;
//     final TextTheme themes=Theme.of(context).textTheme;
//     String code='+20';
//     return Stack(
//       alignment: Alignment.topLeft,
//       children: [
//         backGradient(size: size),
//         SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(AppPadding.p20),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: size.height * 0.38,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 40.0),
//                       child: Image(image: AssetImage(ImageAssets.splashLogo)),
//                     ),
//                   ),
//                   Text(
//                     '    Welcome Back,\n Sign up to continue',
//                     style: Theme.of(context).textTheme.headlineLarge,
//                   ),
//                   defaultTextFormField(
//                       controller: _userNameController,
//                       title: 'Your Name',
//                       validator: (val) {
//                         if (val != null) {
//                           return val.isEmpty
//                               ? 'username cannot be empty'
//                               : null;
//                         }
//                         return null;
//                       },
//                       style: Theme.of(context).textTheme.bodySmall!,
//                       onChanged: (val) {
//                         formKey.currentState!.validate();
//                       }),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     children: [
//                       defaultGestureDetector(
//                         child: circularBorderContainer(
//                   size: size,
//                     width: 0.2,
//                     height: 0.069,
//                     circle: 10,
//                     border: Border.all(color: ColorManager.grey),
//                     color: Colors.transparent,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         defaultText(text: code,style: themes.headlineMedium),
//                         Icon(Icons.keyboard_arrow_down,color: Color.fromRGBO(142, 142, 147, 1),)
//                       ],
//                     ),
//                   ),
//                         onTap: (){
//                           // todo :: show popUP dialog that lists the counties codes
//                         },
//                       ),
//                       SizedBox(width: AppSize.s16,),
//                       defaultContainer(
//                         width: size.width * 0.65,
//                         height: null,
//                         child: defaultTextFormField(
//                             controller: _phoneController,
//                             title: 'Your phone',
//                             validator: (val) {
//                               if (val != null) {
//                                 return val.isEmpty
//                                     ? 'username cannot be empty'
//                                     : null;
//                               }
//                               return null;
//                             },
//                             style: Theme.of(context).textTheme.bodySmall!,
//                             onChanged: (val) {
//                               formKey.currentState!.validate();
//                             }),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   defaultTextFormField(
//                       controller: _emailController,
//                       title: 'enter your email',
//                       validator: (val) =>
//                           !EmailValidator.validate(val ?? '', true)
//                               ? 'Not a valid email.'
//                               : null,
//                       style: Theme.of(context).textTheme.bodySmall!,
//                       onChanged: (val) {
//                         formKey.currentState!.validate();
//                       }),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   defaultTextFormField(
//                       controller: _passwordController,
//                       title: 'enter your password',
//                       style: Theme.of(context).textTheme.bodySmall!,
//                       validator: (value) {
//                         return validate_password(value);
//                       },
//                       isObscure: _isObscure,
//                       suffixIcon: _isObscure
//                           ? Icons.visibility_outlined
//                           : Icons.visibility_off_outlined,
//                       suffixPressed: () {
//                         _isObscure = !_isObscure;
//                         setState(() {});
//                       },
//                       onChanged: (val) {
//                         formKey.currentState!.validate();
//                       }),
//                   SizedBox(
//                     height: size.height * 0.06,
//                   ),
//                   defaultElevatedButton(
//                       text: 'Sign Up',
//                       onPressed: () {
//                         _viewModel.register();
//                       },
//                       height: size.height * 0.072),
//                   defaultContainer(
//                     height: size.height * 0.15,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         defaultText(
//                           text: "Have an account? ",
//                           style: Theme.of(context).textTheme.labelMedium,
//                         ),
//                         defaultGestureDetector(
//                           child: defaultText(
//                             text: ' Log in',
//                             style: Theme.of(context).textTheme.labelSmall!,
//                           ),
//                           onTap: () {
//                             Navigator.pushReplacementNamed(
//                                 context, Routes.loginRoute);
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
import 'package:applocation/app/constants/functions.dart';
import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:applocation/presentation/resources/styles_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/state_management/bloc/register_bloc.dart';
import '../../domain/state_management/events/register_event.dart';
import '../../domain/state_management/states/register_state.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/values_manager.dart';
import '../../../app/constants/widgets.dart';
import '../../../app/di.dart';
import '../../../app/app_preferences.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  String _selectedCountryCode = '+20'; // Default country code
  String _selectDefaultGender = 'Gender';
  String _selectDefaultNational = 'National';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme themes = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => instance<RegisterBloc>(),
      child: Scaffold(
        backgroundColor: ColorManager.white,

        body: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content:
                defaultText(text: state.msg.map!.msg),
                ),
              );
              Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
            } else if (state is RegisterFailure) {
              _showErrorDialog(context, state.message);
            }
          },
          builder: (context, state) {
            return _getContentWidget(size, themes, context, state);
          },
        ),
      ),
    );
  }

  Widget _getContentWidget(Size size, TextTheme themes, BuildContext context, RegisterState state) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        backGradient(size: size),
        SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s20,),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildTitle(themes),
                  _buildTitle2(themes),
                  _buildLogo(size),
                  _buildUserNameField(context,_formKey),
                  SizedBox(height: size.height * 0.02),
                  _buildPhoneNumberRow(context, themes, size,_formKey),
                  SizedBox(height: size.height * 0.02),
                  _gender(context),
                  SizedBox(height: size.height * 0.02),
                  _nationality(context),
                  SizedBox(height: size.height * 0.02),
                  _buildEmailField(context,_formKey),
                  SizedBox(height: size.height * 0.02),
                  _buildPasswordField(context,_formKey),
                  SizedBox(height: size.height * 0.02),
                  _buildSignUpButton(context, state),
                  _buildLoginRow(context, size),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo(Size size) {
    return Container(
      child: Image(image: AssetImage(ImageAssets.splashLogo)),
    );
  }

  Widget _buildTitle(TextTheme themes) {
    return Container(
      margin: EdgeInsets.only(top: AppSize.s40),
      child: Text(
        AppStrings.welcomeBack.tr(),
        style: headLineTextStyle (color: ColorManager.black, fontSize: 20),
      ),
    );
  }
  Widget _buildTitle2(TextTheme themes) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: AppSize.s4),
          child: Text(
            AppStrings.singUp.tr(),
            style: headLineTextStyle2 (),
          ),
        ),
        Container(
          child: Text(
            AppStrings.forContinue.tr(),
            style: headLineTextStyle (color: ColorManager.black,fontSize: 20),
          ),
        ),
      ],
    );
  }

  Widget _buildUserNameField(BuildContext context,GlobalKey<FormState> formKey) {
    return  defaultTextFormField(

        controller: _userNameController,
        title: AppStrings.username.tr(),
        validator: (val) {
          if (val != null) {
            return val.isEmpty
                ? AppStrings.emptyUserName.tr()
                : null;
          }
          return null;
        },
        style: inputTextStyle(),
        onChanged: (val) {
          formKey.currentState!.validate();
        });
  }

  Widget _buildPhoneNumberRow(BuildContext context, TextTheme themes, Size size,GlobalKey<FormState> formKey) {
    return Row(
      children: [
        defaultGestureDetector(
          child: circularBorderContainer(
            size: size,
            width: 0.17,
            height: 0.061,
            circle: 10,
            border: Border.all(color: ColorManager.grey),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                defaultText(text: _selectedCountryCode, style: inputTextStyle()),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color.fromRGBO(142, 142, 147, 1),
                ),
              ],
            ),
          ),
          onTap: () => _showCountryCodeDialog(context),
        ),
        const SizedBox(width: AppSize.s16),
        Expanded(
          child:
          defaultTextFormField(
              controller: _phoneController,
              title: AppStrings.yourPhone.tr(),
              validator: (val) {
                if (val != null) {
                  return val.isEmpty
                      ? AppStrings.emptyUserName.tr()
                      : null;
                }
                return null;
              },
              style: inputTextStyle(),
              onChanged: (val) {
                formKey.currentState!.validate();
              }),
        ),
      ],
    );
  }

  Widget _buildEmailField(BuildContext context,GlobalKey<FormState> formKey) {
    return  defaultTextFormField(
        controller: _emailController,
        title: AppStrings.emailHint.tr(),
        validator: (val) =>
        !EmailValidator.validate(val ?? '', true)
            ? AppStrings.notValidEmail.tr()
            : null,
        style: inputTextStyle(),
        onChanged: (val) {
          formKey.currentState!.validate();
        });
  }

  Widget _buildPasswordField(BuildContext context,GlobalKey<FormState> formKey) {
    return  defaultTextFormField(
        controller: _passwordController,
        title: AppStrings.password.tr(),
        style: inputTextStyle(),
        validator: (value) {
          return validate_password(value);
        },
        isObscure: _isObscure,
        suffixIcon: _isObscure
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        suffixPressed: () {
          _isObscure = !_isObscure;
          setState(() {});
        },
        onChanged: (val) {
          formKey.currentState!.validate();
        });
  }

  Widget _buildSignUpButton(BuildContext context, RegisterState state) {
    final Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: state is! RegisterLoading
          ? () {
        if (_formKey.currentState!.validate()) {
          context.read<RegisterBloc>().add(
            RegisterButtonPressed(
              userName: _userNameController.text,
              email: _emailController.text,
              password: _passwordController.text,
              phone: _phoneController.text,
              countryCode: _selectedCountryCode,
            ),
          );
        }
      }
          : null,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(size.width, size.height * 0.072),
      ),
      child: Text(AppStrings.signUp.tr(),
          style: buttonTextStyle(color: ColorManager.white)),
    );
  }

  Widget _buildLoginRow(BuildContext context, Size size) {
    return SizedBox(
      height: size.height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          defaultText(text: AppStrings.haveAnAccount.tr(), style: Theme.of(context).textTheme.headlineSmall),
          defaultGestureDetector(
            child: defaultText(text: AppStrings.login.tr(), style: Theme.of(context).textTheme.labelSmall!),
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.loginRoute);
            },
          ),
        ],
      ),
    );
  }
  void _showCountryCodeDialog(BuildContext context) {
    final List<String> countryCodes = [
      '+93', '+355', '+213', '+376', '+244', '+1268', '+54', '+374', '+61', '+43', '+994', '+1242', '+973', '+880', '+1246', '+375', '+32', '+501',
      '+229', '+975', '+591', '+387', '+267', '+55', '+673', '+359', '+226', '+257', '+238', '+855', '+237', '+1', '+236', '+235', '+56', '+86',
      '+57', '+269', '+242', '+506', '+385', '+53', '+357', '+420', '+45', '+253', '+1767', '+1809', '+593', '+20', '+503', '+240', '+291', '+372',
      '+268', '+251', '+679', '+358', '+33', '+241', '+220', '+995', '+49', '+233', '+30', '+1473', '+502', '+224', '+245', '+592', '+509', '+504',
      '+36', '+354', '+91', '+62', '+98', '+964', '+353', '+972', '+39', '+1876', '+81', '+962', '+7', '+254', '+686', '+965', '+996', '+856',
      '+371', '+961', '+266', '+231', '+218', '+423', '+370', '+352', '+261', '+265', '+60', '+960', '+223', '+356', '+692', '+222', '+230',
      '+52', '+691', '+373', '+377', '+976', '+382', '+212', '+258', '+95', '+264', '+674', '+977', '+31', '+64', '+505', '+227', '+234',
      '+850', '+389', '+47', '+968', '+92', '+680', '+970', '+507', '+675', '+595', '+51', '+63', '+48', '+351', '+974', '+40', '+7', '+250',
      '+1869', '+1758', '+1784', '+685', '+378', '+239', '+966', '+221', '+381', '+248', '+232', '+65', '+421', '+386', '+677', '+252', '+27',
      '+82', '+211', '+34', '+94', '+249', '+597', '+46', '+41', '+963', '+886', '+992', '+255', '+66', '+670', '+228', '+676', '+1868', '+216',
      '+90', '+993', '+688', '+256', '+380', '+971', '+44', '+1', '+598', '+998', '+678', '+379', '+58', '+84', '+967', '+260', '+263'
    ];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: ColorManager.white,
          title:  Text(AppStrings.selectCountryCode.tr()),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            height: 250, // Adjusted height to prevent intrinsic sizing issues
            child: ListView.builder(
              itemCount: countryCodes.length,
              itemBuilder: (context, index) {
                final code = countryCodes[index];
                return ListTile(
                  title: Text(code),
                  onTap: () {
                    setState(() {
                      _selectedCountryCode = code;
                    });
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _gender(BuildContext context) {
    final List<String> selectGender = ['Gender', 'Male', 'Female'];

    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.grey1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: DropdownButton<String>(
              value: _selectDefaultGender,
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down, color: ColorManager.grey2),
              underline: SizedBox.shrink(), // Removes default underline
              dropdownColor: ColorManager.white,
              items: selectGender.map((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          gender,
                          style: TextStyle(
                            color: _selectDefaultGender == gender
                                ? ColorManager.grey
                                : ColorManager.grey,
                            fontWeight: _selectDefaultGender == gender
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectDefaultGender = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _nationality(BuildContext context) {
    final List<String> selectNationality = [
      'National', 'Afghanistan', 'Albania', 'Algeria', 'Andorra', 'Angola', 'Antigua and Barbuda', 'Argentina', 'Armenia', 'Australia', 'Austria',
      'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados', 'Belarus', 'Belgium', 'Belize', 'Benin', 'Bhutan', 'Bolivia', 'Bosnia and Herzegovina',
      'Botswana', 'Brazil', 'Brunei', 'Bulgaria', 'Burkina Faso', 'Burundi', 'Cabo Verde', 'Cambodia', 'Cameroon', 'Canada', 'Central African Republic',
      'Chad', 'Chile', 'China', 'Colombia', 'Comoros', 'Congo (Congo-Brazzaville)', 'Costa Rica', 'Croatia', 'Cuba', 'Cyprus', 'Czechia (Czech Republic)',
      'Denmark', 'Djibouti', 'Dominica', 'Dominican Republic', 'Ecuador', 'Egypt', 'El Salvador', 'Equatorial Guinea', 'Eritrea', 'Estonia', 'Eswatini',
      'Ethiopia', 'Fiji', 'Finland', 'France', 'Gabon', 'Gambia', 'Georgia', 'Germany', 'Ghana', 'Greece', 'Grenada', 'Guatemala', 'Guinea', 'Guinea-Bissau',
      'Guyana', 'Haiti', 'Honduras', 'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran', 'Iraq', 'Ireland', 'Israel', 'Italy', 'Jamaica', 'Japan', 'Jordan',
      'Kazakhstan', 'Kenya', 'Kiribati', 'Kuwait', 'Kyrgyzstan', 'Laos', 'Latvia', 'Lebanon', 'Lesotho', 'Liberia', 'Libya', 'Liechtenstein', 'Lithuania',
      'Luxembourg', 'Madagascar', 'Malawi', 'Malaysia', 'Maldives', 'Mali', 'Malta', 'Marshall Islands', 'Mauritania', 'Mauritius', 'Mexico', 'Micronesia',
      'Moldova', 'Monaco', 'Mongolia', 'Montenegro', 'Morocco', 'Mozambique', 'Myanmar (formerly Burma)', 'Namibia', 'Nauru', 'Nepal', 'Netherlands',
      'New Zealand', 'Nicaragua', 'Niger', 'Nigeria', 'North Korea', 'North Macedonia', 'Norway', 'Oman', 'Pakistan', 'Palau', 'Palestine State', 'Panama',
      'Papua New Guinea', 'Paraguay', 'Peru', 'Philippines', 'Poland', 'Portugal', 'Qatar', 'Romania', 'Russia', 'Rwanda', 'Saint Kitts and Nevis',
      'Saint Lucia', 'Saint Vincent and the Grenadines', 'Samoa', 'San Marino', 'Sao Tome and Principe', 'Saudi Arabia', 'Senegal', 'Serbia', 'Seychelles',
      'Sierra Leone', 'Singapore', 'Slovakia', 'Slovenia', 'Solomon Islands', 'Somalia', 'South Africa', 'South Korea', 'South Sudan', 'Spain', 'Sri Lanka',
      'Sudan', 'Suriname', 'Sweden', 'Switzerland', 'Syria', 'Taiwan', 'Tajikistan', 'Tanzania', 'Thailand', 'Timor-Leste', 'Togo', 'Tonga',
      'Trinidad and Tobago', 'Tunisia', 'Turkey', 'Turkmenistan', 'Tuvalu', 'Uganda', 'Ukraine', 'United Arab Emirates', 'United Kingdom',
      'United States of America', 'Uruguay', 'Uzbekistan', 'Vanuatu', 'Vatican City', 'Venezuela', 'Vietnam', 'Yemen', 'Zambia', 'Zimbabwe'
    ];

    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.grey1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: DropdownButton<String>(
              value: _selectDefaultNational,
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down, color: ColorManager.grey2),
              underline: SizedBox.shrink(), // Removes default underline
              dropdownColor: ColorManager.white,
              items: selectNationality.map((String National) {
                return DropdownMenuItem<String>(
                  value: National,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          National,
                          style: TextStyle(
                            color: _selectDefaultNational == National
                                ? ColorManager.grey
                                : ColorManager.grey,
                            fontWeight: _selectDefaultNational == National
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectDefaultNational = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }


  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:  Text(AppStrings.registrationFailed.tr()),
        content: Text(message,style: TextStyle(color: Colors.black),),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child:  Text(AppStrings.ok.tr()),
          ),
        ],
      ),
    );
  }
}

