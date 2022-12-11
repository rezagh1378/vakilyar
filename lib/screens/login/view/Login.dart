import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakilyar/module/textfeilds.dart';
import 'package:http/http.dart';
import '../../../module/button.dart';
import '../../../module/constans.dart';
import '../../../module/textfeilds.dart';
import '../../../utils/server.dart';
import '../controller/login_controller.dart';

class keys {
  static var key1 = GlobalKey<FormState>();
  static var key2 = GlobalKey<FormState>();
}

class LoginPage extends StatelessWidget {


  @override
  LoginController controller= Get.put(LoginController());
  Widget build(BuildContext context) {
    Map data = Map();


    return Scaffold(
      body: GetBuilder<LoginController>(builder: (controller){
        return  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height / 5,
                ),
                Center(
                  child: Text(
                    "وکیل یار",
                    style: Get.textTheme.headline1,
                  ),
                ),
                Form(
                  key: keys.key1,
                  child: TxtFeild(
                    labelText: 'نام کاربری',
                    obscureText: false,
                    onSaved: (value) {
                      data['username'] = value;
                    },


                    customIconColor: bl,
                    ontap: (){
                    },
                    prefixIcon: Icons.email_outlined,

                    textInputAction: TextInputAction.next,
                    keyboadtype: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: 15),
                Form(
                  key: keys.key2,
                  child: TxtFeild(
                    labelText: 'رمز عبور',
                    maxLines: 1,
                    obscureText: true,
                    onSaved: (value) {
                      data['password'] = value;
                    },
                    suffixIcon: Icons.remove_red_eye,
                    prefixIcon: Icons.lock_outline,
                    textInputAction: TextInputAction.done,
                    keyboadtype: TextInputType.number,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [

                        Spacer(),
                        TextButton(
                            onPressed:(){

                            },
                            child: Text(
                              'فراموشی رمز عبور',
                              style: Get.textTheme.bodyText1,
                            )),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      keys.key1.currentState!.save();
                      keys.key2.currentState!.save();
                      // var js=jsonEncode(data);
                      controller.signin(data);


                    },
                    child: Container(
                        child: const Btn(
                          title: 'ورود',
                          hasBorder: false,
                        ))),
                Padding(
                    padding: const EdgeInsets.only(top: 160),
                    child: GestureDetector(
                      onTap: ()=> Get.toNamed("/signup"),
                      child: RichText(
                          text: TextSpan(
                              text: 'حساب کاربری ندارید ؟',
                              style: Get.textTheme.subtitle1,
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' ثبت نام کنید',
                                    style: Get.textTheme.subtitle1!.copyWith(color: bl))
                              ])),
                    ))
              ],
            ),
          ),
        );
      })
    );
  }
}

