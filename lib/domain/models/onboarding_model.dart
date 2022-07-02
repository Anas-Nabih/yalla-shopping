class SliderObject {
  final String title;
  final String subTitle;
  final String image;

  SliderObject(
      {required this.title, required this.subTitle, required this.image});
}

class SliderViewObject{
  final SliderObject sliderObj;
  final int numOfSlides;
  final int currentIndex;

  const SliderViewObject({required this.sliderObj,required this.currentIndex,required this.numOfSlides});
}