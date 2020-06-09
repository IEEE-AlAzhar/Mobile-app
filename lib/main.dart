import 'package:flutter/material.dart';
import 'package:ieeeapp/screens/home_page.dart';
import 'package:ieeeapp/screens/login_page.dart';
import 'package:ieeeapp/screens/profile_page.dart';
import 'package:ieeeapp/screens/settings_page.dart';
import 'package:ieeeapp/screens/splash_screen.dart';
import 'package:ieeeapp/utils/dart_themes_styles.dart';
import 'package:provider/provider.dart';
import 'models/themes.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';

DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

void main() => runApp(ChangeNotifierProvider(
      create: (context) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "IEEE AL-AZHAR SB APP",
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),
          initialRoute: SplashScreen.id,
          routes: {
            LoginPage.id: (context) => LoginPage(),
            SplashScreen.id: (context) => SplashScreen(),
            SettingsScreen.id: (context) => SettingsScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            ProfilePage.id: (context) => ProfilePage(),
          },
        );
      }),
    ));
