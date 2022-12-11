import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakilyar/router/app_routes.dart';
import 'package:vakilyar/screens/note/model/note.dart';

import '../../../module/snack.dart';
import '../../../utils/server.dart';

class NoteController extends GetxController{
  RxBool loading = true.obs;
  RxList<Note> data=<Note>[].obs;
  fetchData(){
    try{
      var resdata= SendData().getData('notes');
      resdata.then((value)  async{
        print(value.statusCode);
        var jsonResponse=jsonDecode(utf8.decode(value.bodyBytes));
        if(value.statusCode==200){
          data.clear();
          for (var element in jsonResponse['data']){
            data.add(Note.fromJson(element));
          }
          loading=false.obs;
          update();
        }
        else{
          errorSnackBar(title: "خطا",msg:'${jsonResponse['msg']}' );
        }

      });
    }catch(err){
      print(err);
    }
  }



  sendData(sendData){
    try{
      var resdata=SendData().postData("notes", sendData);
      resdata.then((value) async{
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
        else {
          errorSnackBar(title:"خطا",msg:'${jsonResponse['msg']}');
        }

      });
    }catch(e){
      print(e);
    }
  }

  removeItem(index){
    try{
      var resdata=SendData().delet('notes', index);
      resdata.then((value) async{
        print(value.statusCode);
        var jsonResponse=jsonDecode(utf8.decode(value.bodyBytes));
        if(value.statusCode==204){
          Get.snackbar(
            '',
            '${jsonResponse['msg']}',
            backgroundColor: Colors.green,
            overlayBlur: 20,

          );
        }
        else {
          errorSnackBar(title:"خطا",msg:'${jsonResponse['msg']}');
        }

      });
    }catch(e){
      print(e);
    }
  }

}