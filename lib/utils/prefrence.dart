import 'package:shared_preferences/shared_preferences.dart';

class SimpleUserPreferences{
  static SharedPreferences? _prefs;

  static Future<void> init() async{
    _prefs=await SharedPreferences.getInstance();
}
  static Future setToken(String key,String value)  async{
    await _prefs?.setString(key, value);
  }
  static String? getToken(String key){
    return _prefs?.getString(key);
  }
  static Future setUsername(String key,String value)  async{
    await _prefs?.setString(key, value);
  }
  static Future getUsername(String key)  async{
    await _prefs?.getString(key);
  }
}