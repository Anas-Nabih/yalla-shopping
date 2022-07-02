import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yalla_shopping/common_utils/res/app_constatnts.dart';
import 'package:yalla_shopping/common_utils/res/assets_manager.dart';
import 'package:yalla_shopping/domain/models/onboarding_model.dart';
import 'package:yalla_shopping/presentation/onboarding/view_model/onboarding_view_model.dart';
import 'package:yalla_shopping/presentation/onboarding/widgets/onboarding_scaffold.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() => _viewModel.start();



  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outPutSliderViewObject,
      builder: (context, snapshot) => OnBoardingScaffold(
          sliderViewObject: snapshot.data, viewModel: _viewModel),
    );
  }
}

class OnBoarding {
  final String title;
  final String subTitle;
  final String image;

  OnBoarding(
      {required this.title, required this.subTitle, required this.image});


}
