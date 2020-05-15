import 'package:flutter/material.dart';
import 'package:ieeeapp/screens/home_page.dart';
import 'package:ieeeapp/screens/profile_page.dart';
import 'package:ieeeapp/screens/settings_page.dart';
import 'package:ieeeapp/screens/splash_screen.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "IEEE AL-AZHAR SB APP",
      initialRoute: ProfilePage.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        SettingsScreen.id: (context) => SettingsScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProfilePage.id: (context) => ProfilePage(),
      },
    ));
