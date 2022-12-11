import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakilyar/module/snack.dart';
import 'package:vakilyar/screens/profile/model/profile.dart';
import 'package:vakilyar/utils/server.dart';

class ProfileController extends GetxController{
  RxBool loading = true.obs;
  RxList <Profile> data = <Profile>[].obs;
  RxMap profileData={}.obs;
  fetchData(){
    try{
      var resdata=SendData().getData('profile');
      resdata.then((value) async{

        var jsonResponse=jsonDecode(utf8.decode(value.bodyBytes));
        if(value.statusCode==200){
          profileData.clear();

          profileData.addAll(jsonResponse['data']);

          loading=false.obs;
          update();
        }
        else{
          errorSnackBar(title: "خطا",msg:'${jsonResponse['msg']}' );
        }

      });}
    catch(err){
      print(err);
  }

}


}