import 'package:applocation/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  String validPin = "12311231";

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _verifiScreen(),
    );
  }

  Widget _verifiScreen() {
    return SafeArea(
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _headlineText(),
                const SizedBox(height: 20),
                _subtitleText(),
                _numberText(),
                const SizedBox(height: 40),

              ],
            ),
            _pinInput(),
            const SizedBox(height: 30),
            _secondSubtitleText(),
            const SizedBox(height: 10),
            _receivedCode(),
            const SizedBox(height: 320),
            Container(

              padding: const EdgeInsets.only(bottom: AppPadding.p50),
              child: _buildEditButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headlineText() {
    return Text(
      AppStrings.verification.tr(),
      style: headLineTextStyle2(),
    );
  }

  Widget _subtitleText() {
    return Text(
      AppStrings.verificationSubtitle.tr(),
      style: subtitleText(),
    );
  }

  Widget _numberText() {
    return Text(
      AppStrings.phoneNumber.tr(),
      style: subtitleText(),
    );
  }

  Widget _secondSubtitleText() {
    return Text(
      AppStrings.receivedCodeTitle.tr(),
      style: subtitleText(),
    );
  }

  Widget _receivedCode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppStrings.resendCodeTitle.tr(), style: subtitleText()),
        const SizedBox(width: 10),
        Text(AppStrings.resendCodeTime.tr(), style: subtitleText()),
      ],
    );
  }

  Widget _pinInput() {
    final PinTheme defaultTheme = PinTheme(
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.lightGrey),
        color: ColorManager.white,
      ),
      height: 60,
      width: 70,
      textStyle: inputTextStyle(),
    );
    return Form(
      key: formKey,
      child: Pinput(
        defaultPinTheme: defaultTheme,
        focusedPinTheme: defaultTheme.copyBorderWith(border: Border.all(color: ColorManager.grey)),
        controller: pinController,
        focusNode: focusNode,
        separatorBuilder: (index) => const SizedBox(width: 20),
        validator: (value) {
          return value == validPin ? null : AppStrings.pinIsIncorrect.tr();
        },
      ),
    );
  }

  Widget _buildEditButton() {
    final Size size = MediaQuery.of(context).size;

    return ElevatedButton(
      onPressed:
          () {
        Navigator.pushReplacementNamed(context, Routes.mainRoute);
      },
      style:
      ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(AppSize.s18),
                left: Radius.circular(AppSize.s18))),
        minimumSize: Size(size.width * 0.9, size.height * 0.072),
      ),
      child: Text(AppStrings.VerificationNow.tr(), style: TextStyle(color: ColorManager.white, fontWeight: FontWeight.w600)),
    );
  }
}
