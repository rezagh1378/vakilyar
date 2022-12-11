import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vakilyar/module/textfeilds.dart';
import 'package:get/get.dart';
import '../../../module/button.dart';
import '../../../module/constans.dart';
import '../controller/signup_controller.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class keys {
  static var key3 = GlobalKey<FormState>();
  static var key4 = GlobalKey<FormState>();
  static var key5 = GlobalKey<FormState>();
  static var key6 = GlobalKey<FormState>();
  static var key7 = GlobalKey<FormState>();
  static var key8 = GlobalKey<FormState>();
  static var key9 = GlobalKey<FormState>();
  static var key10 = GlobalKey<FormState>();
}

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  SignUpController controller = Get.put(SignUpController());
  String label = '';

  String selectedDate = Jalali.now().toJalaliDateTime();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    label = 'انتخاب تاریخ زمان';
  }

  Widget build(BuildContext context) {
    Map data = Map();
    var size = 10.0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 26,
              ),
              Center(
                child: Text(
                  'وکیل یار',
                  style: Get.textTheme.headline1!.copyWith(fontSize: 80),
                ),
              ),
              Form(
                key: keys.key3,
                child: TxtFeild(
                  labelText: 'نام نام خانوادگی',
                  obscureText: false,
                  onSaved: (value) {
                    data["full_name"] = value;
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
                  key: keys.key4,
                  child: TxtFeild(
                    labelText: 'کدملی',
                    obscureText: false,
                    onSaved: (value) {
                      data["nationalـcode"] = value;
                    },
                    prefixIcon: Icons.confirmation_number_outlined,
                    textInputAction: TextInputAction.next,
                    keyboadtype: TextInputType.number,
                  )),
              SizedBox(
                height: size,
              ),
              Form(
                  key: keys.key5,
                  child: TxtFeild(
                    labelText: 'نام کاربری',
                    obscureText: false,
                    onSaved: (value) {
                      data['username'] = value;
                    },
                    prefixIcon: Icons.drive_file_rename_outline,
                    textInputAction: TextInputAction.next,
                    keyboadtype: TextInputType.emailAddress,
                  )),
              SizedBox(
                height: size,
              ),
              Form(
                  key: keys.key6,
                  child: TxtFeild(
                    labelText: 'رمز عبور',
                    obscureText: true,
                    maxLines: 1,
                    onSaved: (value) {
                      data['password'] = value;
                    },
                    prefixIcon: Icons.password_outlined,
                    textInputAction: TextInputAction.next,
                    keyboadtype: TextInputType.emailAddress,
                  )),
              SizedBox(
                height: size,
              ),
              Form(
                  key: keys.key7,
                  child: TxtFeild(
                    labelText: 'email',
                    obscureText: false,
                    onSaved: (value) {

                      data['email'] = value;
                    },
                    prefixIcon: Icons.email_outlined,
                    textInputAction: TextInputAction.next,
                    keyboadtype: TextInputType.emailAddress,
                  )),
              SizedBox(
                height: size,
              ),
              Form(
                  key: keys.key8,
                  child: TxtFeild(
                    labelText: 'کد وکالت',
                    obscureText: false,
                    onSaved: (value) {
                      data['attorneyـcode'] = value;
                    },
                    prefixIcon: Icons.code_outlined,
                    textInputAction: TextInputAction.next,
                    keyboadtype: TextInputType.number,
                  )),
              SizedBox(
                height: size,
              ),
              Form(
                  key: keys.key10,
                  child: TxtFeild(
                    labelText: 'شماره همراه',
                    obscureText: false,
                    onSaved: (value) {
                      data['phone'] = value;
                    },
                    prefixIcon: Icons.phone_android_outlined,
                    textInputAction: TextInputAction.go,
                    keyboadtype: TextInputType.number,
                  )),
              SizedBox(
                height: size,
              ),
              GestureDetector(
                child: customBtn(),
                onTap: () async {
                  Jalali? picked = await showPersianDatePicker(

                    context: context,
                    initialDate: Jalali.now(),
                    firstDate: Jalali(1385, 8),
                    lastDate: Jalali(1450, 9),
                  );
                  if (picked != null && picked != selectedDate) {
                    setState(() {
                      label = picked.toJalaliDateTime();

                      // print(label);
                    });
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    keys.key3.currentState!.save();
                    keys.key4.currentState!.save();
                    keys.key5.currentState!.save();
                    keys.key6.currentState!.save();
                    keys.key7.currentState!.save();
                    keys.key8.currentState!.save();
                    keys.key10.currentState!.save();
                    var time =DateTime.parse(label);
                    // Gregorian g = Gregorian(time.year, time.month, time.day);
                    // print(time.year);
                    data['birth_date']=time.toString();
                    var js = jsonEncode(data);
                    controller.signup(js);
                  },
                  child: Container(
                      child: const Btn(
                    title: 'ثبت نام',
                    hasBorder: false,
                  ))),
            ],
          ),
        ),
      ),
    );
  }

  customBtn() {
    return Container(
      height: 60,
      width: Get.width - 30,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderTextFeild),
      ),
      child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              label,
              style: Get.textTheme.subtitle1,
            ),
          )),
    );
  }
}
