import 'package:shared_preferences/shared_preferences.dart';

class SimpleUserPreferences {
  static  SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future setUsername(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  static String? getUsername(String key) {
    return _prefs?.getString(key);
  }

  static Future setPassword(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  static String? getPassword(String key) {
    return _prefs?.getString(key);
  }

  static Future setToken(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  static String? getToken(String key) {
    return _prefs?.getString(key);
  }

  static Future setFirstLogin(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  static bool? getFirstLogin(String key) {
    return _prefs?.getBool(key);
  }

  static Future setRout(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  static String? getRoute(String key) {
    return _prefs?.getString(key);
  }

  static Future delRout(String key) async {
    await _prefs?.remove(key);
  }
}
