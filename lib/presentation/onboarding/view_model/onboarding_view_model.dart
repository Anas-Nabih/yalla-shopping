import 'dart:async';

import 'package:yalla_shopping/domain/models/onboarding_model.dart';
import 'package:yalla_shopping/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs, OnBoardingViewModelOutputs{

  /// stream controller outputs
  final StreamController _streamController = StreamController<SliderViewObject>();
 /// Onboarding view model inputs
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
    /// call user api
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChange(int index) {
    // TODO: implement onPageChange
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => throw UnimplementedError();

  @override
  // TODO: implement outPutSliderViewObject
  Stream get outPutSliderViewObject => throw UnimplementedError();
}


 abstract class OnBoardingViewModelInputs{
  void goNext();
  void goPrevious();
  void onPageChange(int index);

  /// stream controller input
 Sink get inputSliderViewObject;
 }
abstract class OnBoardingViewModelOutputs{
  Stream get outPutSliderViewObject;
}