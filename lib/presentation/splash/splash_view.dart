import 'dart:async';
import 'package:applocation/presentation/resources/color_manager.dart';
import 'package:applocation/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import '../resources/assets_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDeley(){
    _timer =  Timer(const Duration(seconds: 2), _goNext);
  }
_goNext(){
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
}
@override
  void initState() {
    super.initState();
    _startDeley();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: const Center(child: Image(image: AssetImage(ImageAssets. splashLogo))),
    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
