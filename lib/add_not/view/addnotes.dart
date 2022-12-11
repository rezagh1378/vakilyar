import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../module/button.dart';
import '../../module/constans.dart';
import '../../module/textfeilds.dart';
import '../../screens/note/controller/note_controller.dart';
class keys{
  static var key1 = GlobalKey<FormState>();
  static var key2 = GlobalKey<FormState>();
}
class Addnotes extends GetView {

  @override
  Widget build(BuildContext context) {
    NoteController controller =Get.put(NoteController());
    var _controller = TextEditingController();
    var _controller1 = TextEditingController();
    Map<dynamic ,dynamic> note=Map();
    return Scaffold(
      appBar: AppBar(
        title: Text("افزودن یادداشت",style: Get.textTheme.headline3,),
        centerTitle: false,
      ),
      body:
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(
              height: 15,),
                Form(
                key: keys.key2,

                  child: TxtFeild(
                    controller: _controller,
                    labelText: 'تیتر',
                    obscureText: false,

                    onSaved: (value) {
                      note['title']=value;
                    },


                    customIconColor: bl,

                    prefixIcon: Icons.email_outlined,

                    textInputAction: TextInputAction.next,
                    keyboadtype: TextInputType.emailAddress,
                  ),),
              const  SizedBox(
                  height: 15,),
                Form(
                key: keys.key1,
                  child: TxtFeild(
                    labelText: 'متن',
                    controller: _controller1,
                    obscureText: false,
                    he: Get.height-300,
                    customHeightSize: true,
                    maxLines: 20,
                    onSaved: (value) {
                      note['attachment']=value;
                    },


                    customIconColor: bl,

                    prefixIcon: Icons.email_outlined,

                    textInputAction: TextInputAction.next,
                    keyboadtype: TextInputType.emailAddress,
                  ),),
              const  SizedBox(
                  height: 15,),
                InkWell(
                  onTap: (){
                    keys.key1.currentState!.save();
                    keys.key2.currentState!.save();
                    _controller.clear();
                    _controller1.clear();
                    controller.sendData(jsonEncode(note));
                  },
                    child: const Btn(
                      title: 'ثبت',
                      hasBorder: false,
                    ))


            ]

            ),
          ),
        )


    );


  }
  }