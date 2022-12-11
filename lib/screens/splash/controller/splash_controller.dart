import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

import '../../../module/snack.dart';
import '../../../router/app_routes.dart';
import '../../../utils/peref.dart';
import '../../../utils/server.dart';
import '../../../utils/storag.dart';

class SplashController extends GetxController {
  RxString msg = 'در حال اتصال به سرور'.obs;

  // checknet() async {
  //   try {
  //     final result =
  //     await InternetAddress.lookup('http://192.168.1.8:3000/api/connection');
  //     print('connected');
  //     print(result);
  //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //       print('connected');
  //       fetchData();
  //     }
  //   } on SocketException catch (_) {
  //     print('not connected');
  //     await Future.delayed(Duration(seconds: 1));
  //     checknet();
  //   }
  // }

  fetchData() {
    var res = SendData().checkData('connection');
    res.then((value) async {
      var jsonResponse = jsonDecode(utf8.decode(value.bodyBytes));
      print(value.statusCode);
      print('sdlvknsdlvknsdv');
      if (value.statusCode == 200) {
        msg = 'به سرور متصل شدید'.obs;
        print('dfvdf');
        // await SimpleUserPreferences.setFirstLogin('post', true);

        loginHandler();
        update();
      }
    }).catchError((err) async {
      print(err);
      await Future.delayed(const Duration(seconds: 1));
      fetchData();
    });
  }

  void _handleSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    // Get.offNamed(Routes.SigninSignup);
  }

  void loginHandler() async {

await SimpleUserPreferences.init();
    final SimpleUserStorage _userStorage = SimpleUserStorage();
    var username = await _userStorage.getUsername('username');
    if (username != null) {
      var pass = await _userStorage.getPassword('password');
      msg = 'ورود به حساب کاربری'.obs;
      Map data = new Map();
      data['username'] = username;
      data['password'] = pass;
      var res = SendData().sendWithOutToken('signin', jsonEncode(data));
      res.then((value) async {
        var jsonResponse = jsonDecode(utf8.decode(value.bodyBytes));
        if (value.statusCode == 200) {
          print(jsonResponse['data']['access_token']);
          var token = jsonResponse['data']['access_token'];
          await SimpleUserPreferences.setToken(
              'token', token);
          print(SimpleUserPreferences.getToken('token'));
          await SimpleUserPreferences.setFirstLogin('post', false);
          Get.offAllNamed(Routes.menu);
        } else {
          Get.offAllNamed(Routes.login);
        }
      });
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}
