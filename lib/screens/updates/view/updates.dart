import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Updates extends GetView {
  const Updates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("بروزرسانی",style: Get.textTheme.headline2,),
      ),
    );
  }
}
