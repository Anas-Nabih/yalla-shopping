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


/// login model

class Authentication {
   String  id;
   String  name;
   String  email;
   String  phone;
   String  role;
   int  numOfNotifications;

   Authentication({required this.email,required this.name,required this.phone,required this.id,required this.role,required this.numOfNotifications});
}