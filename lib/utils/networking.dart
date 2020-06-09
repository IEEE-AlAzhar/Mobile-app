import 'dart:async';
import 'dart:convert';
import 'shared_pref.dart';
import 'package:http/http.dart' as http;

const loginURL = "https://ieee-mobile-dashboard.herokuapp.com/api/users/login";

SharedPrefsHelper sharedPrefsHelper = SharedPrefsHelper();

class NetworkHelper {
  factory NetworkHelper() {
    return internalObject;
  }

  static final NetworkHelper internalObject = NetworkHelper._internal();

  NetworkHelper._internal();

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
      sharedPrefsHelper.saveCommittee(jsonDecode(response.body)["user"]["committee"]);
      sharedPrefsHelper.saveRole(jsonDecode(response.body)["user"]["role"]);
      sharedPrefsHelper.saveImage(jsonDecode(response.body)["user"]["image"]);
//      sharedPrefsHelper.saveAchievements(jsonDecode(response.body)["user"]["achievements"]);
      sharedPrefsHelper.saveTitle(jsonDecode(response.body)["user"]["achievements"][0]["title"]);
//      sharedPrefsHelper.saveDescription(jsonDecode(response.body)["user"]["achievements"][0]["description"]);
//      sharedPrefsHelper.saveDate(jsonDecode(response.body)["user"]["achievements"][0]["date"]);
//      sharedPrefsHelper.saveCover(jsonDecode(response.body)["user"]["${"achievements"}${"cover"}"]);
    }
    return response;
  }
}
