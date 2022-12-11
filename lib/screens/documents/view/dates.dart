import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:vakilyar/module/button.dart';

import '../../../module/constans.dart';
import '../../../module/textfeilds.dart';
class keys {
  static var key1 = GlobalKey<FormState>();}
class Dates extends GetView {
  const Dates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map data = Map();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ثبت جلسات",
          style: Get.textTheme.headline2,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const SizedBox(height: 10,),
            Form(
              key: keys.key1,
              child: TxtFeild(
                labelText: 'موضوع جلسه',
                obscureText: false,
                onSaved: (value) {
                  data['title'] = value;
                },
                customIconColor: bl,
                ontap: () {},
                prefixIcon: Icons.email_outlined,
                textInputAction: TextInputAction.next,
                keyboadtype: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap:() {
                keys.key1.currentState!.save();
                var js=jsonEncode(data);
                controller.sendData(js);
              },
              child: Container(
                child: const Btn(
                  title: 'ثبت',
                  hasBorder: false,
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
