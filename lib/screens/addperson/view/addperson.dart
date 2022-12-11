import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:vakilyar/screens/addperson/addpersone_controller/add_person_controller.dart';

import '../../../module/button.dart';
import '../../../module/textfeilds.dart';

class keys {
  static var key20 = GlobalKey<FormState>();
  static var key21 = GlobalKey<FormState>();
  static var key22 = GlobalKey<FormState>();
  static var key23 = GlobalKey<FormState>();
  static var key24 = GlobalKey<FormState>();
  static var key25 = GlobalKey<FormState>();
  static var key26 = GlobalKey<FormState>();
  static var key27 = GlobalKey<FormState>();
  static var key28 = GlobalKey<FormState>();
  static var key29 = GlobalKey<FormState>();
}

Map data = Map();

class AddPersonPage extends GetView {
  @override
  Widget build(BuildContext context) {
    var size = 20.0;
AddPersonController controller =Get.put(AddPersonController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Scaffold(
          appBar: AppBar(
            title: Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Text(
              "افزودن موکل",
              style: Get.textTheme.headline3,
            ),),
            centerTitle: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Form(
                      key: keys.key20,
                      child: TxtFeild(
                        labelText: 'نام ',
                        obscureText: false,
                        onSaved: (value) {
                          data["name"] = value;
                        },
                        prefixIcon: Icons.person_outline,
                        textInputAction: TextInputAction.next,
                        keyboadtype: TextInputType.emailAddress,
                        wi: Get.width / 2.3,
                        customWidthSize: true,
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Form(
                      key: keys.key21,
                      child: TxtFeild(
                        wi: Get.width / 2.3,
                        customWidthSize: true,
                        labelText: 'نام خانوادگی ',
                        obscureText: false,
                        onSaved: (value) {
                          data["last_name"] = value;
                        },
                        prefixIcon: Icons.person_outline,
                        textInputAction: TextInputAction.next,
                        keyboadtype: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size,
                ),
                Form(
                  key: keys.key22,
                  child: TxtFeild(
                    labelText: 'نام پدر',
                    obscureText: false,
                    onSaved: (value) {
                      data["father_name"] = value;
                    },
                    prefixIcon: Icons.person_outline,
                    textInputAction: TextInputAction.next,
                    keyboadtype: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  height: size,
                ),
                Form(
                  key: keys.key23,
                  child: TxtFeild(
                    labelText: 'کد ملی',
                    obscureText: false,
                    onSaved: (value) {
                      data["national_code_customer"] = int.parse(value);
                    },
                    prefixIcon: Icons.code_outlined,
                    textInputAction: TextInputAction.next,
                    keyboadtype: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: size,
                ),
                Form(
                  key: keys.key24,
                  child: TxtFeild(
                    labelText: 'شماره تماس ',
                    obscureText: false,
                    onSaved: (value) {
                      data["phone_customer"] = int.parse(value);
                    },
                    prefixIcon: Icons.phone_android_outlined,
                    textInputAction: TextInputAction.next,
                    keyboadtype: TextInputType.number,
                  ),
                ),
                SizedBox(height: size),
                Form(
                  key: keys.key25,
                  child: TxtFeild(
                    labelText: 'شماره پرونده',
                    obscureText: false,
                    onSaved: (value) {
                      data["file_number"] = int.parse(value);
                    },
                    prefixIcon: Icons.numbers_outlined,
                    textInputAction: TextInputAction.next,
                    keyboadtype: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: size,
                ),

                Row(
                  children: [
                    Form(
                      key: keys.key27,
                      child: TxtFeild(
                        labelText: 'دریافتی ',
                        obscureText: false,
                        onSaved: (value) {

                          data["money_resive"] = double.parse(value);
print(data['money_resive'].runtimeType);                        },
                        prefixIcon: Icons.money_off_csred_outlined,
                        textInputAction: TextInputAction.next,
                        keyboadtype: TextInputType.number,
                        wi: Get.width / 2.3,
                        customWidthSize: true,
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Form(
                      key: keys.key28,
                      child: TxtFeild(
                        wi: Get.width / 2.3,
                        customWidthSize: true,
                        labelText: 'بدهی',
                        obscureText: false,
                        onSaved: (value) {
                          data["debt"] = double.parse(value);
                        },
                        prefixIcon: Icons.money_off_csred_outlined,
                        textInputAction: TextInputAction.next,
                        keyboadtype: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size,
                ),

                GestureDetector(
                    onTap: () {
                      keys.key20.currentState!.save();
                      keys.key21.currentState!.save();
                      // keys.key22.currentState!.save();
                      keys.key23.currentState!.save();
                      keys.key24.currentState!.save();
                      keys.key25.currentState!.save();

                      keys.key27.currentState!.save();
                      keys.key28.currentState!.save();
                      var js=jsonEncode(data);
                      controller.sendData(js);

                    },
                    child: Container(
                        child: const Btn(
                          title: 'ثبت',
                          hasBorder: false,
                        ))),

              ],
            ),
          )),
    );
  }
}
