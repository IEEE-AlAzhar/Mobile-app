import 'dart:async';
import 'dart:convert';
import 'shared_pref.dart';
import 'package:http/http.dart'  as http;
const loginURL = "https://ieee-mobile-dashboard.herokuapp.com/api/users/login";
const updatePhoneUrl = 'https://ieee-mobile-dashboard.herokuapp.com/api/users/';

SharedPrefsHelper sharedPrefsHelper = SharedPrefsHelper();

class NetworkHelper {

  factory NetworkHelper(){
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
      sharedPrefsHelper.saveId(jsonDecode(response.body)["user"]["_id"]);
      sharedPrefsHelper.savePhone(jsonDecode(response.body)["user"]["phone"]);
    }
    return response;
  }

  Future<http.Response> updatePhone(String phone,String id,String token) async {
    Map<String, String > headers = {
    "x-access-token" : "$token",
    "Content-Type": "application/json",
    "Accept" : "application/json",
    };
    var body = jsonEncode({"phone": "$phone"});
    var response = await http.put("$updatePhoneUrl/$id/phone", headers: headers , body: body);
    if(response.statusCode==200){
      return response;
    }
   else{
     print('${response.statusCode}');
    }
   return response;
  }
}