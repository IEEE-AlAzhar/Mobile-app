import 'dart:async';
import 'dart:convert';
import 'shared_pref.dart';
import 'package:http/http.dart'  as http;
const loginURL = "https://ieee-mobile-dashboard.herokuapp.com/api/users/login";

SharedPrefsHelper sharedPrefsHelper = SharedPrefsHelper();

class NetworkHelper{

  factory NetworkHelper(){
    return internalObject;
  }

  static final NetworkHelper internalObject = NetworkHelper._internal();
  NetworkHelper._internal();


  Future<http.Response> login(String code)async{
    Map<String , String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    var body = jsonEncode({"code" : "$code"});
    var response =await http.post(loginURL,headers: headers,body:body);
    if(response.statusCode == 200){
      sharedPrefsHelper.saveToken(jsonDecode(response.body)["token"]);
      sharedPrefsHelper.saveCommittee(jsonDecode(response.body)['committee']);
      sharedPrefsHelper.saveRole(jsonDecode(response.body)['role']);
      sharedPrefsHelper.saveImage(jsonDecode(response.body)['image']);
      sharedPrefsHelper.saveFeedback(jsonDecode(response.body)['feedbacks']);
      sharedPrefsHelper.saveAchievements(jsonDecode(response.body)['achievements']);
    }
    return response;
  }

}