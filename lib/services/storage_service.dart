import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences _sharedPreferences;

  StorageService(this._sharedPreferences);

  // Save a string value
  Future<void> saveString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  // Get a string value
  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  // Save an integer value
  Future<void> saveInt(String key, int value) async {
    await _sharedPreferences.setInt(key, value);
  }

  // Get an integer value
  int? getInt(String key) {
    return _sharedPreferences.getInt(key);
  }

  // Save a boolean value
  Future<void> saveBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  // Get a boolean value
  bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  // Remove a stored value
  Future<void> remove(String key) async {
    await _sharedPreferences.remove(key);
  }
}
