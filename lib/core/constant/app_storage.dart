import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> getInstance() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<void> saveKey(String key, String value) async {
    _prefs ??= await SharedPreferences.getInstance();
    _prefs!.setString(key, value);
  }

  static Future<String?> getKey(String key) async {
    _prefs ??= await SharedPreferences.getInstance();
    String? data = _prefs!.getString(key);
    return data;
  }

  static Future<void> removeKey(String key) async {
    _prefs ??= await SharedPreferences.getInstance();
    _prefs!.remove(key);
  }

  static Future<void> clear() async {
    _prefs ??= await SharedPreferences.getInstance();
    _prefs!.clear();
  }

  static Future<void> saveBool(String key, bool value) async {
    _prefs ??= await SharedPreferences.getInstance();
    _prefs!.setBool(key, value);
  }

  static Future<bool?> getBool(String key) async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!.getBool(key);
  }

  static Future<void> saveInt(String key, int value) async {
    _prefs ??= await SharedPreferences.getInstance();
    _prefs!.setInt(key, value);
  }
}
