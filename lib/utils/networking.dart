import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as Dio;
import 'package:http/http.dart' as http;
import 'package:ieeeapp/models/achievement.dart';
import 'package:ieeeapp/models/feedback.dart';
import 'package:http_parser/http_parser.dart';
import 'shared_pref.dart';

const loginURL = "https://ieee-mobile-dashboard.herokuapp.com/api/users/login";
const updateUrl = 'https://ieee-mobile-dashboard.herokuapp.com/api/users/';

const logoutURL =
    "https://ieee-mobile-dashboard.herokuapp.com/api/users/logout";
const annoucementsURL =
    "https://ieee-mobile-dashboard.herokuapp.com/api/announcements/list";


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
      sharedPrefsHelper
          .saveCommittee(jsonDecode(response.body)["user"]["committee"]);
      sharedPrefsHelper.saveRole(jsonDecode(response.body)["user"]["role"]);
      sharedPrefsHelper.saveImage(jsonDecode(response.body)["user"]["image"]);
      List ach = (jsonDecode(response.body)["user"]["achievements"]);
      List feed = (jsonDecode(response.body)["user"]["feedbacks"]);
      sharedPrefsHelper.saveId(jsonDecode(response.body)["user"]["_id"]);
      sharedPrefsHelper.savePhone(jsonDecode(response.body)["user"]["phone"]);
      if (ach.isNotEmpty) {
        print("okkk1");
        for (var item in ach) {
          ache.add(Achievements(
              achTit: item["title"],
              achDesc: item["description"],
              achDate: item["date"],
              achCover: item["cover"]));
        }
      }
      if (feed.isNotEmpty) {
        print("okkk2");
        for (var item in feed) {
          feedBack.add(Feedback(
              fedTit: item["title"],
              fedBody: item["body"],
              fedDate: item["date"]));
        }
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

  Future<http.Response> updatePhone(
      String phone, String id, String token) async {
    Map<String, String> headers = {
      "x-access-token": "$token",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    var body = jsonEncode({"phone": "$phone"});
    var response = await http.put("$updateUrl/$id/phone",
        headers: headers, body: body);
    if (response.statusCode == 200) {
      return response;
    } else {
      print('${response.statusCode}');
    }
    return response;
  }

  Future<Dio.Response> updateImage(
      String id, String token, File imageFile) async {
    if (imageFile != null) {
      String fileName = imageFile.path.split("/").last;
      Map<String, String> headers = {
        "x-access-token": "$token",
        "Content-Type": "multipart/form-data",
        "Accept": "multipart/form-data",
      };
      Dio.Dio dio = Dio.Dio();
      Dio.FormData formData = Dio.FormData.fromMap({
        "image": await Dio.MultipartFile.fromFile(imageFile.path,
            filename: fileName,contentType: MediaType("image","png"))
      });
      Dio.Response response = await dio.put("$updateUrl/$id/image",
          options: Dio.Options(headers: headers),data: formData);
      return response;
    } else {
      print("Null File");
    }
  }
}
