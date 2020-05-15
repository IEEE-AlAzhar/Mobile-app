import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  factory SharedPrefsHelper() {
    return internalObject;
  }

  static final SharedPrefsHelper internalObject = SharedPrefsHelper._internal();
  SharedPrefsHelper._internal();

  saveToken(String token) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'token';
    sharedPrefs.setString(key, token);
  }

  Future<String> readToken() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'token';
    final value = sharedPrefs.get(key);
    return value;
  }
}
