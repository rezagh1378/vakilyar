import 'dart:convert';

import 'package:get/get.dart';
import 'package:vakilyar/module/snack.dart';
import 'package:vakilyar/utils/server.dart';

import '../../../module/constans.dart';

class SignUpController extends GetxController{

  signup(data){
    var resdata= SendData().postData("signup", data);
    resdata.then((value)  async{
      var jsonResponse=jsonDecode(utf8.decode(value.bodyBytes));
      if(value.statusCode==201){
        Get.offNamed('/');
        Get.snackbar(
          '',
          '${jsonResponse['msg']}',
          backgroundColor: bl,
          overlayBlur: 20,
        );
      }
      else{
        errorSnackBar(title: "خطا",msg:'${jsonResponse['msg']}' );
      }

    });
  }
}
