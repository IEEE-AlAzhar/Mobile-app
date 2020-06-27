import 'dart:async';
import 'dart:convert';
import 'package:ieeeapp/models/achievement.dart';
import 'package:ieeeapp/models/feedback.dart';

import 'shared_pref.dart';
import 'package:http/http.dart' as http;

const loginURL = "https://ieee-mobile-dashboard.herokuapp.com/api/users/login";
const updatePhoneUrl = 'https://ieee-mobile-dashboard.herokuapp.com/api/users/';

const logoutURL =
    "https://ieee-mobile-dashboard.herokuapp.com/api/users/logout";
const annoucementsURL =
    "https://ieee-mobile-dashboard.herokuapp.com/api/announcements/list";

const updateImageUrl = "https://ieee-mobile-dashboard.herokuapp.com/api/users/";
const ImageFile = "image=@/home/mohamedsaad/Downloads/v8.png";

SharedPrefsHelper sharedPrefsHelper = SharedPrefsHelper();


class NetworkHelper {
  factory NetworkHelper() {
    return internalObject;
  }

  static final NetworkHelper internalObject = NetworkHelper._internal();


  NetworkHelper._internal();

  List<Achievements> ache = [];
  List<Feedback> feedBack = [];

  Future<http.Response> login(String code) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    var body = jsonEncode({"code": "$code"});
    var response = await http.post(loginURL, headers: headers, body: body);
    if (response.statusCode == 200) {
      sharedPrefsHelper.saveToken(jsonDecode(response.body)["token"]);
      sharedPrefsHelper.saveName(jsonDecode(response.body)["user"]["name"]);
      sharedPrefsHelper.saveCommittee(
          jsonDecode(response.body)["user"]["committee"]);
      sharedPrefsHelper.saveRole(jsonDecode(response.body)["user"]["role"]);
      sharedPrefsHelper.saveImage(jsonDecode(response.body)["user"]["image"]);
      List ach = (jsonDecode(response.body)["user"]["achievements"]);
      List feed = (jsonDecode(response.body)["user"]["feedbacks"]);
      sharedPrefsHelper.saveId(jsonDecode(response.body)["user"]["_id"]);
      sharedPrefsHelper.savePhone(jsonDecode(response.body)["user"]["phone"]);

      for (var item in ach) {
        ache.add(Achievements(achTit: item["title"],
            achDesc: item["description"],
            achDate: item["date"],
            achCover: item["cover"]));
      }

      for (var item in feed) {
        feedBack.add(Feedback(fedTit: item["title"],
            fedBody: item["body"],
            fedDate: item["date"]));
      }
    }
    return response;
  }

  Future<http.Response> logout(String token) async {
    Map<String, String> headers = {"x-access-token": token};
    var response = await http.get(
      logoutURL,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      print(response.statusCode);
    }
    return response;
  }

  Future<http.Response> getAnnouncements(String token) async {
    Map<String, String> header = {
      "x-access-token": token,
    };
    var response = await http.get(annoucementsURL, headers: header);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load announcement');
    }
  }

  Future<http.Response> updatePhone(String phone, String id,
      String token) async {
    Map<String, String> headers = {
      "x-access-token": "$token",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    var body = jsonEncode({"phone": "$phone"});
    var response = await http.put(
        "$updatePhoneUrl/$id/phone", headers: headers, body: body);
    if (response.statusCode == 200) {
      return response;
    }
    else {
      print('${response.statusCode}');
    }
    return response;
  }

  Future<http.Response> updateImage(String id, String token) async{
    Map<String , String> headers = {
      "x-access-token": "$token",
      "Content-Type": "multipart/form-data",
      "Accept": "multipart/form-data",
    };
    var body = jsonEncode(ImageFile);
    var response = await http.put("$updateImageUrl/$id/image",headers: headers,body: body);
    if(response.statusCode==200){
      return response;
    }
    else{
      print('${response.statusCode}');
    }
    return response;
  }

}
