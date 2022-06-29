import 'package:yalla_shopping/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs, OnBoardingViewModelOutputs{

  /// stream controller outputs

 /// Onboarding view model inputs
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
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
}


 abstract class OnBoardingViewModelInputs{
  void goNext();
  void goPrevious();
  void onPageChange(int index);
 }
abstract class OnBoardingViewModelOutputs{}