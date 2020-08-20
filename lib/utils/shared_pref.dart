import 'dart:convert';

import 'package:ieeeapp/models/achievement.dart';
import 'package:ieeeapp/models/feedback.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  factory SharedPrefsHelper() {
    return internalObject;
  }

  static final SharedPrefsHelper internalObject = SharedPrefsHelper._internal();

  SharedPrefsHelper._internal();

  saveAchievements(List<Achievements> list)async{
    final sharedPrefs = await SharedPreferences.getInstance();
    final String entriesJson = json.encode(list.map((entry) => entry.toJson()).toList());
    sharedPrefs.setString('ach', entriesJson);
  }

  Future<List<Achievements>> readAchievements()async{
    final sharedPrefs = await SharedPreferences.getInstance();
    final String savedEntriesJson = sharedPrefs.getString('ach');
    final List<dynamic> entriesDeserialized = json.decode(savedEntriesJson);
    List<Achievements> deserializedList = entriesDeserialized.map((json) =>Achievements.fromJson(json)).toList();
    return deserializedList;
  }



  saveFeedback(List<Feedback> list)async{
    final sharedPrefs = await SharedPreferences.getInstance();
    final String entriesJson = json.encode(list.map((entry) => entry.toJson()).toList());
    sharedPrefs.setString('feedback', entriesJson);
  }

  Future<List<Feedback>> readFeedback()async{
    final sharedPrefs = await SharedPreferences.getInstance();
    final String savedEntriesJson = sharedPrefs.getString('feedback');
    final List<dynamic> entriesDeserialized = json.decode(savedEntriesJson);
    List<Feedback> deserializedList = entriesDeserialized.map((json) =>Feedback.fromJson(json)).toList();
    return deserializedList;
  }

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