import 'dart:convert';

import 'package:get/get.dart';
import 'package:vakilyar/screens/documents/model/document.dart';

import '../../../module/snack.dart';
import '../../../utils/server.dart';
import '../../note/model/note.dart';

class DocumentController extends GetxController{
  RxBool loading = true.obs;
  RxList<Document> data=<Document>[].obs;
  fetchData(){
    try{
      var resdata= SendData().getData('register-user-space');
      resdata.then((value)  async{
        print(value.statusCode);
        var jsonResponse=jsonDecode(utf8.decode(value.bodyBytes));
        if(value.statusCode==200){
          data.clear();
          for (var element in jsonResponse['data']){
            data.add(Document.fromJson(element));
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
}