import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SimpleUserStorage {
  static late FlutterSecureStorage _storage;

  static Future<void> init() async {
    _storage = FlutterSecureStorage();
  }
  Future setusername(String key , String value) async{
    var writeData=await _storage.write(key: key,value: value);
    return writeData;
  }
  Future setPassword(String key , String value) async{
    var writeData=await _storage.write(key: key,value: value);
    return writeData;
  }
  Future getUsername(String key) async{
    return _storage.read(key: key);
  }
  Future getPassword(String key) async{
    return _storage.read(key: key);
  }
}
