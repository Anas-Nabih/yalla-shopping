import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:yalla_shopping/common_utils/res/colors.dart';
import 'package:yalla_shopping/domain/models/onboarding_model.dart';
 import 'package:yalla_shopping/presentation/onboarding/view_model/onboarding_view_model.dart';
import 'package:yalla_shopping/presentation/user/login/login_view.dart';

class OnBoardingScaffold extends StatefulWidget {
  final SliderViewObject? sliderViewObject;
  final OnBoardingViewModel viewModel;
  const OnBoardingScaffold({required this.sliderViewObject,required this.viewModel,Key? key}) : super(key: key);

  @override
  State<OnBoardingScaffold> createState() => _OnBoardingScaffoldState();
}

class _OnBoardingScaffoldState extends State<OnBoardingScaffold> {
  @override
  Widget build(BuildContext context) {
    return widget.sliderViewObject != null ? Scaffold(
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
        child: Row(
          children: [
            Visibility(
              visible: widget.sliderViewObject?.currentIndex != 0,
              child: GestureDetector(
                onTap: ()=> Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const LoginView(),)),
                child: Text("Skip",
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ),
            ),
            const Spacer(),
            Row(
              children: List.generate(
                widget.sliderViewObject?.numOfSlides ?? 0,
                    (index) => Container(
                  height: 2.h,
                  width: 2.h,
                  margin: EdgeInsets.symmetric(horizontal: .5.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: MColors.primary),
                    color: widget.sliderViewObject?.currentIndex  == index ? Colors.white: MColors.lightPrimary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
                onTap: ()=> setState(()=>widget.viewModel.goNext()),
                child: Text("Next", style: TextStyle(fontSize: 12.sp, color: Colors.grey))),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(widget.sliderViewObject?.sliderObj.title ?? "",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 4.h,
          ),
          Text(widget.sliderViewObject?.sliderObj.subTitle ?? "",
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
                controller: widget.viewModel.pageController,
                itemCount: widget.sliderViewObject?.numOfSlides,
                itemBuilder: (context, index) =>
                    SvgPicture.asset(widget.sliderViewObject?.sliderObj.image ?? ""),
                onPageChanged: (index) {
                  widget.viewModel.onPageChange(index);
                },
              ))
        ],
      ),
    ): Container() ;
  }
}
