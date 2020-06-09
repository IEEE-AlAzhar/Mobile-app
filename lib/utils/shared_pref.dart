import 'package:ieeeapp/utils/dart_themes_styles.dart';
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

  saveAchievements(List achievements)async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'achievements';
    sharedPrefs.setStringList(key, achievements);
  }

  Future<List> readAchievements() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'achievements';
    final List  value = sharedPrefs.get(key);
    return value;
  }

  saveFeedback(List feedbacks)async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'feedbacks';
    sharedPrefs.setStringList(key, feedbacks);
  }

  Future<List> readFeedback() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'feedbacks';
    final value = sharedPrefs.get(key);
    return value;
  }
  saveTitle(String title)async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'title';
    sharedPrefs.setString(key, title);
  }

  Future<String> readTitle() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'title';
    final value = sharedPrefs.get(key);
    return value;
  }
  saveDescription(String description)async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'description';
    sharedPrefs.setString(key, description);
  }

  Future<String> readDescription() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'description';
    final value = sharedPrefs.get(key);
    return value;
  }
  saveDate(String date)async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'date';
    sharedPrefs.setString(key, date);
  }

  Future<String> readDate() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'date';
    final value = sharedPrefs.get(key);
    return value;
  }
  saveCover(String cover)async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'cover';
    sharedPrefs.setString(key, cover);
  }

  Future<String> readCover() async{
    final sharedPrefs = await SharedPreferences.getInstance();
    var key = 'cover';
    final value = sharedPrefs.get(key);
    return value;
  }



}
