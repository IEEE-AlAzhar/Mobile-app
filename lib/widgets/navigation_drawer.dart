import 'package:flutter/material.dart';
import 'package:ieeeapp/models/themes.dart';
import 'package:ieeeapp/screens/profile_page.dart';
import 'package:ieeeapp/screens/settings_page.dart';
import 'package:provider/provider.dart';


// ignore: camel_case_types
class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  bool isDark =false;

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
              color: themeChange.darkTheme ? Colors.blueGrey: Colors.blue[300],
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
              onTap:(){Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=> ProfilePage()
              ),);},
            ),
            Divider(
              height: 10.0,
            ),
            ListTile(
              leading: Icon(Icons.brightness_6,),
              title: Text(
                'Night mood',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap:(){
                setState(() {
                  isDark= !isDark;
                });
                themeChange.darkTheme=isDark;
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
              onTap:(){Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=> SettingsScreen()
              ),);},
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
              onTap:(){},
            ),
          ],
        ),
      ),
    );
  }
}

