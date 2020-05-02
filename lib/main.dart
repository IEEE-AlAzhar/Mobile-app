import 'package:flutter/material.dart';
import 'package:ieeeapp/screens/splash_screen.dart';

void main() => runApp(MaterialApp(
  title: "IEEE APP",
  initialRoute: SplashScreen.id ,
  routes: {
    SplashScreen.id : (context) => SplashScreen(),

  },
));

