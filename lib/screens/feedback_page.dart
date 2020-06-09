import 'package:flutter/material.dart';
import 'package:ieeeapp/utils/shared_pref.dart';


SharedPrefsHelper sharedPrefsHelper = SharedPrefsHelper();

class FeedbackPage extends StatelessWidget {
  static String id = 'FeedbackPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text('Feedback'),centerTitle: true),
        body: Container(

        )


    );
  }
}
