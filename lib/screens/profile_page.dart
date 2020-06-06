import 'package:flutter/material.dart';
import 'package:ieeeapp/models/themes.dart';
import 'package:ieeeapp/utils/shared_pref.dart';
import 'package:provider/provider.dart';

SharedPrefsHelper sharedPrefsHelper = SharedPrefsHelper();

class ProfilePage extends StatefulWidget {
  static String id = 'ProfilePage';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: text('Technical', 15.0),
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: themeChange.darkTheme
                      ? Colors.blueGrey
                      : Colors.blue[100]),
              height: 350.0,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    child: FutureBuilder(
                      future: sharedPrefsHelper.readImage(),
                      builder: (_, snapshot) {
                          return Image.network('${snapshot.data}');
                      },
                    ),
                    radius: 70.0,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  FutureBuilder(
                    future: sharedPrefsHelper.readName(),
                    builder: (_, snapshot) {
                      return text('${snapshot.data}',30);
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  FutureBuilder(
                    future: sharedPrefsHelper.readCommittee(),
                    builder: (_, snapshot) {
                      return text(' ${snapshot.data }' , 15.0);
                    },
                  ),
                  FutureBuilder(
                    future: sharedPrefsHelper.readRole(),
                    builder: (_, snapshot) {
                      return text(' | ${snapshot.data}',15.0);
                    },
                  ),
                ],),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.business_center),
                    title: FutureBuilder(
                      future: sharedPrefsHelper.readAchievements(),
                      builder: (_, snapshot) {
                        return text('${snapshot.data}',20.0);
                      },
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(
                    height: 20.0,
                  ),
                  ListTile(
                      leading: Icon(Icons.feedback),
                      title: FutureBuilder(
                        future: sharedPrefsHelper.readFeedback(),
                        builder: (_, snapshot) {
                          return text('${snapshot.data}',20.0);
                        },
                      ),
                      trailing: Icon(Icons.arrow_forward_ios)),
                ],
              ),
            )
          ],
        ));
  }

  Widget text(
    String text,
    double size,
  ) {
    return Text(
      '$text',
      style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
    );
  }

}
