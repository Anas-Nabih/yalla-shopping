import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:yalla_shopping/common_utils/res/app_constatnts.dart';
import 'package:yalla_shopping/common_utils/res/assets_manager.dart';
import 'package:yalla_shopping/common_utils/res/colors.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
        child: Row(
          children: [
            Visibility(
              visible: _currentIndex != 0,
              child: Text("Skip",
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
            ),
            Spacer(),
            Row(
              children: List.generate(
                OnBoarding.onBoardingList.length,
                (index) => Container(
                  height: 2.h,
                  width: 2.h,
                  margin: EdgeInsets.symmetric(horizontal: .5.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: MColors.primary),
                    color: _currentIndex == index ? Colors.white: MColors.lightPrimary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
                onTap: ()=>setState(() {
                  _currentIndex = _currentIndex +1;
                }),
                child: Text("Next", style: TextStyle(fontSize: 12.sp, color: Colors.grey))),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(OnBoarding.onBoardingList[_currentIndex].title,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 4.h,
          ),
          Text(OnBoarding.onBoardingList[_currentIndex].subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey)),
          SizedBox(
            height: 10.h,
          ),
          Container(
              height: 40.h,
              child: PageView.builder(
                itemCount: OnBoarding.onBoardingList.length,
                itemBuilder: (context, index) =>
                    SvgPicture.asset(OnBoarding.onBoardingList[index].image),
                onPageChanged: (int) {
                  setState(() {
                    _currentIndex = int;
                  });
                },
              ))
        ],
      ),
    );
  }
}

class OnBoarding {
  final String title;
  final String subTitle;
  final String image;

  OnBoarding(
      {required this.title, required this.subTitle, required this.image});

  static List<OnBoarding> onBoardingList = [
    OnBoarding(
        title: AppConstants.onBoarding1Title,
        subTitle: AppConstants.onBoarding1Description,
        image: AssetsManager.onBoardingLogo1),
    OnBoarding(
        title: AppConstants.onBoarding2Title,
        subTitle: AppConstants.onBoarding2Description,
        image: AssetsManager.onBoardingLogo2),
    OnBoarding(
        title: AppConstants.onBoarding3Title,
        subTitle: AppConstants.onBoarding3Description,
        image: AssetsManager.onBoardingLogo3),
    OnBoarding(
        title: AppConstants.onBoarding4Title,
        subTitle: AppConstants.onBoarding4Description,
        image: AssetsManager.onBoardingLogo4),
  ];
}
