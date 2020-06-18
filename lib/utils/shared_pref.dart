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
  saveName(String name) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'name';
    sharedPrefs.setString(key, name);
  }

  Future<String> readName() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'name';
    final value = sharedPrefs.get(key);
    return value;
  }

  saveCommittee(String committee) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'committee';
    sharedPrefs.setString(key, committee);
  }

  Future<String> readCommittee() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'committee';
    final value = sharedPrefs.get(key);
    return value;
  }

  saveRole(String role) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'role';
    sharedPrefs.setString(key, role);
  }

  Future<String> readRole() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'role';
    final value = sharedPrefs.get(key);
    return value;
  }

  saveImage(String image) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'image';
    sharedPrefs.setString(key, image);
  }

  Future<String> readImage() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'image';
    final value = sharedPrefs.get(key);
    return value;
  }
  saveId(String id) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = '_id';
    sharedPrefs.setString(key, id);
  }

  Future<String> readId() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = '_id';
    final value = sharedPrefs.get(key);
    return value;
  }

  savePhone(String phone) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'phone';
    sharedPrefs.setString(key, phone);
  }

  Future<String> readPhone() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'phone';
    final value = sharedPrefs.get(key);
    return value;
  }
}