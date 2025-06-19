import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app/constants/functions.dart';
import '../../../app/di.dart';
import '../../../domain/state_management/bloc/login_bloc.dart';
import '../../../domain/state_management/events/login_events.dart';
import '../../../domain/state_management/states/login_states.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import '../../../app/app_preferences.dart';
import '../../../app/constants/widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => instance<LoginBloc>()..add(LoginCheckTokenEvent()),
      child: Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) async {
            if (state is LoginInitial) {
              dismissDialog(context);
            }
            if (state is LoginCheckAuthFailure) {
              dismissDialog(context);
              //context.read<LoginBloc>().add(LoginInputChanged('', ''));
            }
            if (state is LoginCheckAuth) {
              final token = await _appPreferences.getToken();
              if (token == null) {
                if (context.mounted) {
                  //context.read<LoginBloc>().add(LoginInputChanged('', ''));
                }
              } else {
                if (context.mounted) {
                  context.read<LoginBloc>().add(LoginCheckAuthEvent());
                }
              }
            }
            if (state is LoginCheckAuthSuccess) {
              if (context.mounted) {
                dismissDialog(context);
                Navigator.pushNamed(context, Routes.upgradeToProRoute);
              }
            }
            if (state is LoginSuccess) {
              if (state.auth.customer!.approval == "approved") {
                _appPreferences.setUserLoggedIn();
                if (context.mounted) {
                  Navigator.of(context)
                      .pushReplacementNamed(Routes.upgradeToProRoute);
                }
                return;
              } else {
                if (state.auth.customer!.verify) {
                  if (context.mounted) {
                    dismissDialog(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: defaultText(
                          text: AppStrings.approvalPending.tr(),
                        ),
                      ),
                    );
                  }
                } else {
                  if (context.mounted) {
                    dismissDialog(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: defaultText(
                          text: AppStrings.emailConfimation.tr(),
                        ),
                      ),
                    );
                  }
                }
              }
            } else if (state is LoginFailure) {
              if (context.mounted) {
                dismissDialog(context);

                _showErrorDialog(context, state.message);
                context.read<LoginBloc>().add(LoginInputChanged(
                    _usernameController.text, _passwordController.text));
              }
            } else if (state is LoginLoading) {
              if (context.mounted) {
                _showLoadingDialog(context);
              }
            }
          },
          builder: (context, state) {
            return _getContentWidget(size, context, state);
          },
        ),
      ),
    );
  }

  Widget _getContentWidget(Size size, BuildContext context, LoginState state) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        backGradient(size: size),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildLogo(size),
                  const SizedBox(height: 20),
                  _buildTitle(),
                  const SizedBox(height: 10),
                  _buildEmailField(context),
                  defaultTextFormField(
                    hintstyle: TextStyle(color: ColorManager.grey),
                    controller: _usernameController,
                    title: AppStrings.emailHint.tr(),
                    errorText: (state is LoginInvalidInput &&
                            !isEmailValid(_usernameController.text))
                        ? AppStrings.invalidEmail.tr()
                        : null,
                    onSubmitted: (value) {
                      context.read<LoginBloc>().add(
                            LoginInputChanged(_usernameController.text,
                                _passwordController.text),
                          );
                    },
                    style: inputTextStyle(),
                  ),
                  const SizedBox(height: 5),
                  _buildPasswordField(context),
                  defaultTextFormField(
                      controller: _passwordController,
                      title: AppStrings.password.tr(),
                      style: inputTextStyle(),
                      // validator: (value) {
                      //   validate_password(value);
                      // },
                      // errorText: (snapshot.data ?? true)
                      // ? null
                      // : AppStrings.passwordError.tr(),
                      validator: (value) {
                        return validate_password(value);
                      },
                      onSubmitted: (value) {
                        context.read<LoginBloc>().add(
                              LoginInputChanged(_usernameController.text,
                                  _passwordController.text),
                            );
                      },
                      isObscure: _isObscure,
                      suffixIcon: _isObscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      suffixPressed: () {
                        _isObscure = !_isObscure;
                        setState(() {});
                      }),
                  // onChanged: (val) {
                  //   _formKey.currentState!.validate();
                  // }),
                  const SizedBox(height: 10),
                  _buildRememberMeCheckbox(),
                  const SizedBox(height: 20),
                  _buildLoginButton(context, state),
                  const SizedBox(height: 20),
                  _buildSignupRow(context, size),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildLogo(Size size) {
    return SizedBox(
      height: size.height * 0.30,
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Image(image: AssetImage(ImageAssets.splashLogo)),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Let’s login for explore continues",
      style: getRegularStyle(
          color: ColorManager.grey,
          fontSize: FontSize.s14,
          fontFamily: FontConstants.fontFamilyInter),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return defaultAlignedLabel(
      label: AppStrings.labelEmail.tr(),
      pad: AppPadding.p8,
      style: Theme.of(context).textTheme.headlineSmall!,
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return defaultAlignedLabel(
      label: AppStrings.labelPassword.tr(),
      pad: AppPadding.p8,
      style: Theme.of(context).textTheme.headlineSmall!,
    );
  }

  Widget _buildRememberMeCheckbox() {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Checkbox(
          activeColor: ColorManager.primary,
          value: _rememberMe,
          onChanged: (value) {
            setState(() {
              _rememberMe = value!;
            });
          },
        ),
        title: Text(
          AppStrings.keepSigned.tr(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        trailing: 
        Text(
          '',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        );
  }

  Widget _buildLoginButton(BuildContext context, LoginState state) {
    final Size size = MediaQuery.of(context).size;

    return defaultElevatedButton(
      onPressed: state is! LoginInvalidInput
          ? () {
              if (_formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(
                      LoginButtonPressed(
                        _usernameController.text,
                        _passwordController.text,
                        _rememberMe,
                      ),
                    );
              }
            }
          : null,
      text: AppStrings.login.tr(),
      size: size,
      height: 0.072,
    );
  }

  Widget _buildSignupRow(BuildContext context, Size size) {
    return SizedBox(
      height: size.height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.dontHaveAnAccount.tr(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          defaultGestureDetector(
            child: defaultText(
              text: AppStrings.signUp.tr(),
              style: Theme.of(context).textTheme.labelSmall!,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.registerRoute);
            },
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            message,
            style: TextStyle(color: ColorManager.black),
          ),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Force a rebuild to re-evaluate the login button state
                setState(() {});
              },
              child: Text(
                AppStrings.ok.tr(),
                style: TextStyle(color: ColorManager.black),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          onPopInvokedWithResult: (didPop, result) {},
          canPop: false,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
