import 'package:flutter/material.dart';
import 'package:ieeeapp/screens/profile_page.dart';
import 'package:ieeeapp/screens/settings_page.dart';

var primary = Color(0xff0a111a);
// ignore: camel_case_types
class navigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              color: Colors.blue,
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
              leading: Icon(Icons.brightness_6),
              title: Text(
                'Night mood',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap:(){},
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

