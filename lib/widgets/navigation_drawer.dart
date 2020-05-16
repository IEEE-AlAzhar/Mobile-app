import 'package:flutter/material.dart';
import 'package:ieeeapp/models/themes.dart';
import 'package:ieeeapp/screens/profile_page.dart';
import 'package:ieeeapp/screens/settings_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login_page.dart';
import '../utils/networking.dart';
import '../utils/shared_pref.dart';

SharedPrefsHelper shared = SharedPrefsHelper();
NetworkHelper net = NetworkHelper();

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  bool isDark = false;

//  Future<String> readToken() async {
//    final sharedPrefs = await SharedPreferences.getInstance();
//    var key = 'token';
//    final value = sharedPrefs.get(key)?? 0;
//  if(value !='0'){
//    Navigator.of(context).push(route)
// }
//  }
  String token;
  @override
  void initState() {
    var value;

//    readToken();
    shared.readToken().then((value) {
      token = value;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              color: themeChange.darkTheme ? Colors.blueGrey : Colors.blue[300],
              child: Center(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(''),
                      radius: 70.0,
                    ),
                    Text(
                      'user name',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'profile',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(ProfilePage.id);
              },
            ),
            Divider(
              height: 10.0,
            ),
            ListTile(
              leading: Icon(
                Icons.brightness_6,
              ),
              title: Text(
                'Night mood',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                setState(() {
                  isDark = !isDark;
                });
                themeChange.darkTheme = isDark;
              },
            ),
            Divider(
              height: 10.0,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Setting',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(SettingsScreen.id);
              },
            ),
            Divider(
              height: 10.0,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                'sign out',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                net.logout(token).then((val) {
                  if (val.statusCode == 200) {
                    token = '0';
                    shared.saveToken(token);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
