import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakilyar/module/textfeilds.dart';

import '../../../module/constans.dart';
class History extends GetView {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("سابقه",style:Get.textTheme.headline3),
      ),
      body:
      Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:   [
            const SizedBox(height: 15),
           const TxtFeild(
              obscureText: false,
              labelText: "جستجو",
              prefixIcon: Icons.search,
              auttoFocus: false,
            ),
            const SizedBox(height: 10,),
            Expanded(child: ListView.builder(
              itemCount: 20,
              itemBuilder:  (BuildContext context, int index) {

                return ListTile(
                  iconColor: bl,
                  textColor: bl,
                  title: Text("نام موکل",style: Get.textTheme.headline2!.copyWith(fontWeight: FontWeight.w900),),
                  subtitle: Text("کدملی"),
                  trailing: Text("شماره پرونده"),
                  leading: const Icon(Icons.person),
                  // trailing: Text("شماره پرونده"),




                    );
                  })
                )

            ]))

    );
  }}