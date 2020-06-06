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

  saveName(String name)async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'name';
    sharedPrefs.setString(key, name);
  }

  Future<String> readName() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'name';
    final value = sharedPrefs.get(key);
    return value;
  }

  saveCommittee(String committee)async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'committee';
    sharedPrefs.setString(key, committee);
  }

  Future<String> readCommittee() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'committee';
    final value = sharedPrefs.get(key);
    return value;
  }

  saveRole(String role)async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'role';
    sharedPrefs.setString(key, role);
  }

  Future<String> readRole() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'role';
    final value = sharedPrefs.get(key);
    return value;
  }

  saveImage(String image)async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'image';
    sharedPrefs.setString(key, image);
  }

  Future<String> readImage() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'image';
    final value = sharedPrefs.get(key);
    return value;
  }

  saveAchievements(String achievements)async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'achievements';
    sharedPrefs.setString(key, achievements);
  }

  Future<String> readAchievements() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'achievements';
    final value = sharedPrefs.get(key);
    return value;
  }

  saveFeedback(String feedbacks)async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = feedbacks;
    sharedPrefs.setString(key, feedbacks);
  }

  Future<List> readFeedback() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'feedbacks';
    final value = sharedPrefs.get(key);
    return value;
  }



}
