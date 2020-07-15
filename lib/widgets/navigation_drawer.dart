import 'package:flutter/material.dart';
import 'package:ieeeapp/constants.dart';
import 'package:ieeeapp/models/themes.dart';
import 'package:ieeeapp/screens/login_page.dart';
import 'package:ieeeapp/screens/profile_page.dart';
import 'package:ieeeapp/screens/settings_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
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
  bool showSpinner = false;
  String token;

  @override
  void initState() {

    var value;
    shared.readToken().then((value) {
      token = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Drawer(
      child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 300.0,
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                color:
                    themeChange.darkTheme ? Colors.blueGrey : Colors.blue[300],
                child: Center(
                  child:ClipOval(
                    child: SizedBox(
                      height: 180.0,
                      width: 180.0,
                      child: FutureBuilder(
                          future: shared.readImage(),
                          builder: (_, snapshot) {
                            if (snapshot.hasData) {
                              return  Image.network(
                                snapshot.data,
                                fit: BoxFit.fill,
                              );
                            } else {
                              return CircleAvatar(
                                backgroundImage: AssetImage("image/profile.png"),
                              );
                            }
                          }),
                    ),
                  ),
                  //Text("IEEE AL-AZHAR",style: titleStyle,),
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
                  themeChange.darkTheme?
                  Icons.wb_sunny : Icons.brightness_3
                ),
                title: Text(
                  themeChange.darkTheme?
                  'Light mood' : "Night mood",
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
                  setState(() {
                    showSpinner = true;
                  });
                  net.logout(token).then((val) {
                    if (val.statusCode == 200) {
                      token = '0';
                      shared.saveToken(token);
                      net.feedBack.clear();
                      net.ache.clear();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    } else {
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
