import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Guidence extends GetView {
  const Guidence({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("دستورالعمل ها",style: Get.textTheme.headline2,),
      ),
    );
  }
}
