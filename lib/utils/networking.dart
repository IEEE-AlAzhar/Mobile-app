import 'dart:async';
import 'dart:convert';
import 'shared_pref.dart';
import 'package:http/http.dart'  as http;


SharedPrefsHelper sharedPrefsHelper = SharedPrefsHelper();

class NetworkHelper{

  factory NetworkHelper(){
    return internalObject;
  }

  static final NetworkHelper internalObject = NetworkHelper._internal();
  NetworkHelper._internal();



}