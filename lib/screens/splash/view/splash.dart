import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vakilyar/module/constans.dart';
import 'package:vakilyar/screens/splash/controller/splash_controller.dart';


class Splash extends GetView{
  @override
  SplashController controller=Get.put(SplashController());

  Splash({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.fetchData();
   return Obx((){
     return Scaffold(
       body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         mainAxisSize: MainAxisSize.min,
         children: [
           SizedBox(height: Get.height/3,),
           Center(child: Text("وکیل یار",style:Get.textTheme.headline1,),),
           Spacer(),
           Text('${controller.msg.value}',style: Get.textTheme.bodyText1,),
           Padding(padding: const EdgeInsets.symmetric(vertical: 20),
             child:   SpinKitFadingCircle(color: bl),
           )
         ],
       ),
     );
   });
  }

}