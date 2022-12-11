
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakilyar/screens/apperience/controller/apperience.dart';

import '../../../module/constans.dart';

class Theme extends GetView {
   Theme({Key? key}) : super(key: key);
ApperienceController controller = Get.put(ApperienceController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApperienceController>(builder: (controller){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: Scaffold(

          body:
          Column(
            children: <Widget>[
              SizedBox(height: 45,),
              Text("تم",style: Get.textTheme.headline2!.copyWith(fontSize: 25,color: bl),),
              RadioListTile(
                  title: Text('تاریک',style: Get.textTheme.headline2,),
                  value: 0, groupValue: controller.theme, onChanged: (val){
                controller.handleRadio(val);
                print(val);
              }),
              RadioListTile(
                  title: Text('روشن',style: Get.textTheme.headline2,),
                  value: 1, groupValue: controller.theme, onChanged: (val){
               controller.handleRadio(val);
                print(val);
              }),
              SizedBox(height: 10,),
              Text("فونت",style: Get.textTheme.headline2!.copyWith(fontSize: 25,color: bl),),
              RadioListTile(
                  title: Text('کوچک',style: Get.textTheme.headline2,),
                  value: 0, groupValue: controller.font, onChanged: (vall){
                controller.handleRadioo(vall);
                print(vall);
              }),
              RadioListTile(
                  title: Text('متوسط',style: Get.textTheme.headline2,),
                  value: 1, groupValue: controller.font, onChanged: (vall){
                controller.handleRadioo(vall);
                print(vall);
              }),
              RadioListTile(

                  title: Text("بزرگ",style: Get.textTheme.headline2,),

                  value: 2, groupValue: controller.font, onChanged: (vall){
                controller.handleRadioo(vall);
                print(vall);
              }),


            ],
          ),
        ),
      );
    });
  }
}
