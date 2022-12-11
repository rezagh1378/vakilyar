import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vakilyar/module/constans.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

class EditeProfile extends GetView{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title:
     Text("ویرایش پروفایل",style: Get.textTheme.headline3,),centerTitle: false,),

   );

}
}