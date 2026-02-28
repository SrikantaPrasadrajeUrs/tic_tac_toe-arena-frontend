import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe/core/storage/local_storage.dart';

class SharedPrefsStorage implements LocalStorage{
  final SharedPreferences _prefs;
  SharedPrefsStorage(SharedPreferences prefs):_prefs = prefs;

  @override
  String? getString(String key) {
    return _prefs.getString(key);
  }

  @override
  void setString(String key, String value) {
    _prefs.setString(key, value);
  }
}