import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

mixin Persistable {
  Future<void> save(String key, Object object) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json.encode(object));
  }

  Future<Object?> load(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    return jsonString == null ? null : json.decode(jsonString);
  }
}
