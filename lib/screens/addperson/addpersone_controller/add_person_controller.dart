import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../module/constans.dart';
import '../../../module/snack.dart';
import '../../../utils/server.dart';

class AddPersonController extends GetxController{
  sendData(data){
   try{
     var resdata= SendData().postData("register-user-space", data);
     resdata.then((value)  async{
       print(value.statusCode);
       var jsonResponse=jsonDecode(utf8.decode(value.bodyBytes));
       if(value.statusCode==201){
         Get.snackbar(
           '',
           '${jsonResponse['msg']}',
           backgroundColor: Colors.green,
           overlayBlur: 20,
         );
       }
       else{
         errorSnackBar(title: "خطا",msg:'${jsonResponse['msg']}' );
       }

     });
   }catch(e){
     print(e);
   }
  }
}