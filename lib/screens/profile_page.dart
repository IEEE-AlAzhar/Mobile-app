import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ieeeapp/models/themes.dart';
import 'package:ieeeapp/screens/achievement_page.dart';
import 'package:ieeeapp/screens/feedback_page.dart';
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
        body: Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color:
                  themeChange.darkTheme ? Colors.blueGrey : Colors.blue[100]),
          height: 400.0,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                child: ClipOval(
                  child: SizedBox(
                    height: 180.0,
                    width: 180.0,
                    child: FutureBuilder(
                        future: sharedPrefsHelper.readImage(),
                        builder: (_, snapshot) {
                          if (snapshot.hasData) {
                            return Image.network('${snapshot.data}',fit: BoxFit.fill,);
                          } else {
                            return Text("${snapshot.error}");
                          }
                        }),
                  ),
                ),
                radius: 70.0,
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              FutureBuilder(
                  future: sharedPrefsHelper.readName(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return text('${snapshot.data}', 30);
                    } else {
                      return Text("${snapshot.error}");
                    }
                  }),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FutureBuilder(
                      future: sharedPrefsHelper.readCommittee(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          return text(' ${snapshot.data}', 15.0);
                        } else {
                          return Text("${snapshot.error}");
                        }
                      }),
                  FutureBuilder(
                      future: sharedPrefsHelper.readRole(),
                      builder: (_, snapshot) {
                        if (snapshot.hasData) {
                          return text(' | ${snapshot.data}', 15.0);
                        } else {
                          return Text("${snapshot.error}");
                        }
                      }),
                ],
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 10.0)),
        Expanded(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.business_center),
                title: text('Achievements', 20),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(AchievementsPage.id);
                },
              ),
              Divider(
                height: 20.0,
              ),
              ListTile(
                leading: Icon(Icons.feedback),
                title: text('Feedback', 20),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(FeedbackPage.id);
                },
              ),
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
