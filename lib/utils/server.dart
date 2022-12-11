import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vakilyar/utils/peref.dart';

class SendData {
  var uri = "http://95.216.230.202:8000/api";

  Future<http.Response> postData(postUrl, post_body) async {
    var token = SimpleUserPreferences.getToken('token');
    var post_url = "$uri/$postUrl";
    var url = Uri.parse(post_url);
    // var token = ;
    // var firstPost = SimpleUserPreferences.getFirstLogin('post');

    var response = await http.post(url,
        body: post_body,
        headers: {
                "Content-type": "application/json",
                "Authorization": "Bearer $token",
                // "Access-Control-Allow-Origin": " *"
              });
    return response;
  }

  Future<http.Response> getData(getUrl) async {
    var token = SimpleUserPreferences.getToken('token');

    var get_url = "$uri/$getUrl";
    var url = Uri.parse(get_url);
    var response = await http.get(url, headers: {
      "Content-type": "application/json",
      "Authorization": "Bearer $token",
      "Access-Control_Allow_Origin": "*"
    });
    return response;
  }

  Future<http.Response> checkData(getUrl) async {
    var get_url = "$uri/$getUrl";
    var url = Uri.parse(get_url);
    var response = await http.get(url, headers: {
      "Content-type": "application/json",
      "Access-Control_Allow_Origin": "*"
    });
    return response;
  }

  Future<http.Response> uploadData(
      {uploadUrl, filename, title, path, perm}) async {
    var upload_url = '$uri/$uploadUrl';
    var url = Uri.parse(upload_url);
    var token = SimpleUserPreferences.getToken('token');
    var req = await http.MultipartRequest('POST', url);
    req.files.add(await http.MultipartFile.fromPath('file', filename));
    req.fields.addAll({
      'title': title,
      'path': path,
      'perm': perm,
    });
    req.headers.addAll({"Authorization": "Bearer $token"});
    var res = await http.Response.fromStream(await req.send());

    return res;
  }
  Future<http.Response> sendWithOutToken(postUrl,post_body)async{
    var post_url = "$uri/$postUrl";
    var url = Uri.parse(post_url);
    // var token = ;
    // var firstPost = SimpleUserPreferences.getFirstLogin('post');

    var response = await http.post(url,
        body: post_body,headers:   {
          "Content-type": "application/json",
        });
    return response;
  }
  Future<http.Response> delet(postUrl,index)async{
    var post_url = "$uri/$postUrl/$index";
    var url = Uri.parse(post_url);
    var token = SimpleUserPreferences.getToken('token');
    var res=await http.delete(url,headers: {
      "Content-type": "application/json",
      "Authorization": "Bearer $token",
      "Access-Control_Allow_Origin": "*",

    });
    return res;
  }
}
