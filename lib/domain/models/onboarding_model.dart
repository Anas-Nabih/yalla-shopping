class OnBoarding {
  final String title;
  final String subTitle;
  final String image;

  OnBoarding(
      {required this.title, required this.subTitle, required this.image});
}

class SliderViewObject{
  final OnBoarding sliderObj;
  final int numOfSlides;
  final OnBoarding currentIndex;

  const SliderViewObject({required this.sliderObj,required this.currentIndex,required this.numOfSlides});
}