import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Pdfdocuments extends GetView{
  const Pdfdocuments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("فایلهای pdf",style:Get.textTheme.headline2,),
        centerTitle: true,
      ),
    );
  }
}