import 'package:get/get.dart';

class ApperienceController extends GetxController{
  // RxString theme = 'dark'.obs;
int theme = 0;
int font = 0;


  handleRadio(val){

    theme=val;

    update();
  }

handleRadioo(vall){

  font=vall;

  update();
}


}