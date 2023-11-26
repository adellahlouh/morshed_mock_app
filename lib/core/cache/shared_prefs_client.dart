import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsClient {
  final SharedPreferences _prefs;
  SharedPrefsClient(this._prefs);

  // set a string in prefs
  void setString(String key, String data) async =>
      await _prefs.setString(key, data);

  // set a int in prefs
  void setInt(String key, int data) async => await _prefs.setInt(key, data);

  void setBool(String key, bool data) async => await _prefs.setBool(key, data);

  void setStringList(String key, List<String> data) async =>
      await _prefs.setStringList(key, data);

  // get a String in prefs.
  String? getString(String key) => _prefs.getString(key);

  int? getInt(String key) => _prefs.getInt(key);

  bool? getBool(String key) => _prefs.getBool(key);

  bool containsKey(String key) => _prefs.containsKey(key);

  void removeKey(String key) => _prefs.remove(key);

  String? getKey(String key) => _prefs.getString(key);

  List<String>? getStringList(String key) => _prefs.getStringList(key);

}
