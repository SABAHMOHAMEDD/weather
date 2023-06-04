import 'package:get/get.dart';


class FadeInAnimationController extends GetxController{


  //The Get.find() method is used
  // to get the instance of the FadeInAnimationController class. This method is part of the GetX package
  // and allows you to access the instance of a controller from anywhere in your Flutter application.

 //static FadeInAnimationController get find => Get.find();
//The animate variable is defined as a RxBool variable,
// which is a reactive variable provided by the GetX package.
// When the value of a reactive variable changes, any widgets that are
// listening to that variable are automatically updated to reflect the new value.
  RxBool animate =false.obs;


  Future startAnimation()async{
    //The startAnimation() method uses the Future.delayed()
    // method to wait for 500 milliseconds before
    // setting the value of the animate boolean variable to true.
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value =true;
    // to reset controller values

    Get.deleteAll(force: true);


  }
}