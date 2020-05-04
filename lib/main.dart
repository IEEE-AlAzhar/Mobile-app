import 'package:flutter/material.dart';
import 'package:ieeeapp/screens/home_page.dart';
import 'package:ieeeapp/screens/splash_screen.dart';
import 'package:ieeeapp/screens/profile_page.dart';
void main() => runApp(MaterialApp(
  title: "IEEE APP",
  initialRoute: ProfilePage.id,
  routes: {
    SplashScreen.id : (context) => SplashScreen(),
    HomeScreen.id : (context) => HomeScreen(),
    ProfilePage.id : (context) => ProfilePage(),

  },

));



