import 'dart:async';

import 'package:applocation/domain/model/models.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../resources/strings_manager.dart';

class OnBoardingViewModel {
  // stream controllers outputs
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentPageIndex = 0;

  // OnBoarding ViewModel Inputs
  void dispose() {
    _streamController.close();
  }

  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  void goNext() {
    // TODO: implement goNext
  }

  void onPageChanged(int index) {
    _currentPageIndex = index;
    _postDataToView();
  }

  Sink get inputSliderViewObject => _streamController.sink;

  // OnBoarding ViewModel Inputs
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // OnBoarding private functions
  void _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(
        _list[_currentPageIndex], _list.length, _currentPageIndex));
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(
            AppStrings.onBoardingTitle1.tr(),
            AppStrings.onBoardingTitle2.tr(),
            AppStrings.onBoardingSubTitle1.tr())
      ];
}

abstract class OnBoardingViewModelInputs {
  void goNext();
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
