import 'package:flutter/material.dart';
import 'package:ieeeapp/screens/settings_page.dart';
import 'package:ieeeapp/screens/splash_screen.dart';

void main() => runApp(MaterialApp(
  title: "IEEE APP",
  initialRoute:  SettingsScreen.id  ,
  routes: {
    SplashScreen.id : (context) => SplashScreen(),
    SettingsScreen.id : (context) => SettingsScreen(),
  },
));

