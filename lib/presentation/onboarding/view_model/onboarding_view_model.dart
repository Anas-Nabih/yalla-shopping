import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yalla_shopping/common_utils/res/CONST.dart';
import 'package:yalla_shopping/common_utils/res/assets_manager.dart';
import 'package:yalla_shopping/domain/models/onboarding_model.dart';
import 'package:yalla_shopping/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  /// stream controller outputs
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late final List<SliderObject> _sliderList;
  int _currentIndex = 0;

  PageController? pageController;

  @override
  void start() {
    _sliderList = _getSliderData();
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _sliderList.length) {
       return nextIndex = 0;
     } else {
       return nextIndex;
    }
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      return previousIndex = _sliderList.length - 1;
    } else {
      return previousIndex;
    }
  }

  @override
  void onPageChange(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // TODO: implement outPutSliderViewObject
  Stream<SliderViewObject> get outPutSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  /// onBoarding private functions

  _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(
        sliderObj: _sliderList[_currentIndex],
        currentIndex: _currentIndex,
        numOfSlides: _sliderList.length));
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(
            title: Const.onBoarding1Title,
            subTitle: Const.onBoarding1Description,
            image: AssetsManager.onBoardingLogo1),
        SliderObject(
            title: Const.onBoarding2Title,
            subTitle: Const.onBoarding2Description,
            image: AssetsManager.onBoardingLogo2),
        SliderObject(
            title: Const.onBoarding3Title,
            subTitle: Const.onBoarding3Description,
            image: AssetsManager.onBoardingLogo3),
        SliderObject(
            title: Const.onBoarding4Title,
            subTitle: Const.onBoarding4Description,
            image: AssetsManager.onBoardingLogo4),
      ];
}

abstract class OnBoardingViewModelInputs {
  int goNext();

  int goPrevious();

  void onPageChange(int index);

  /// stream controller input
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outPutSliderViewObject;
}
