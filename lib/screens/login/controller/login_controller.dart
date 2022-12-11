import 'dart:convert';

import 'package:get/get.dart';
import 'package:vakilyar/module/snack.dart';
import 'package:vakilyar/utils/peref.dart';
import 'package:vakilyar/utils/server.dart';
import 'package:vakilyar/utils/storag.dart';

import '../../../module/constans.dart';

class LoginController extends GetxController{

 RxBool tap=false.obs;


signin(data)async{
  var resdata= SendData().sendWithOutToken("signin", jsonEncode(data));
  resdata.then((value)  async{

    var jsonResponse=jsonDecode(utf8.decode(value.bodyBytes));
    if(value.statusCode==200){
      final SimpleUserStorage _userStorage=SimpleUserStorage();
      print(data['username']);
      _userStorage.setusername('username', data['username']);
      _userStorage.setPassword('password', data['password']);

      await SimpleUserPreferences.setToken('token', jsonResponse['data']['access_token']);
      await SimpleUserPreferences.setFirstLogin('post', false);
      Get.offNamed('/menu');
      Get.snackbar(
        '',
        'ورود با موفقیت انجام شد',
        backgroundColor: bl,
        overlayBlur: 20,
      );
    }
    else{
      errorSnackBar(title: "خطا",msg:'${jsonResponse['msg']}' );
    }

  });

}}