import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ieeeapp/models/themes.dart';
import 'package:ieeeapp/screens/home_page.dart';
import 'package:ieeeapp/screens/login_page.dart';
import 'package:ieeeapp/utils/shared_pref.dart';


class SplashScreen extends StatefulWidget {
  static String id = "SplashScreen";

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> with TickerProviderStateMixin {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  SharedPrefsHelper _sharedPrefsHelper = SharedPrefsHelper();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    const duration = Duration(milliseconds: 3000);
    _sharedPrefsHelper.readToken().then((val){
      if(val !='0' && val != null){
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }else{
        Timer(duration, () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginPage()));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children:<Widget>[ Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1,
              )),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(
                  10,
                ),
              ),
              Image.asset(
                'images/ieee_branch.png',
                height: 400.0,
                width: 500.0,
              ),
              ColorizeAnimatedTextKit(
                  text: ['    IEEE-AZHAR'],
                  textStyle: TextStyle(
                    fontSize: 35,
                    fontFamily: "Ewert",
                  ),
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                  textAlign: TextAlign.start,
                  alignment: AlignmentDirectional.topStart),
              ColorizeAnimatedTextKit(
                  text: ['Student Branch'],
                  textStyle: TextStyle(
                    fontSize: 35,
                    fontFamily: "Ewert",
                  ),
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                  textAlign: TextAlign.start,
                  alignment: AlignmentDirectional.topStart),
            ],
          ),
        ),]
      ),
    );
  }
}