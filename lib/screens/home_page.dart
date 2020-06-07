import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ieeeapp/models/announcement.dart';
import 'package:ieeeapp/screens/announcement_details.dart';
import 'package:ieeeapp/utils/networking.dart';
import 'package:ieeeapp/utils/shared_pref.dart';
import 'package:ieeeapp/widgets/cards.dart';
import 'package:ieeeapp/widgets/navigation_drawer.dart';

SharedPrefsHelper sharedPrefsHelper = SharedPrefsHelper();
NetworkHelper networkHelper = NetworkHelper();

String token;

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    // TODO: implement initState
    sharedPrefsHelper.readToken().then((onvalue) {
      token = onvalue;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'IEEE  AZHAR',
          style:
              TextStyle(color: Colors.white, fontSize: 27, letterSpacing: 1.7),
        ),
        centerTitle: true,
      ),
      body: HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  Future<List<Announcement>> announcement() async {
    List<Announcement> announcements = [];
    await networkHelper.getAnnouncements(token).then((onValue) {
      if (onValue.statusCode == 200) {
        var data = jsonDecode(onValue.body);
        for (int i = 0; i < data.length; i++) {
          Announcement announcement = Announcement(
              data[i]["title"],
              data[i]["body"],
              data[i]["date"],
              data[i]["cover"],
              data[i]["type"]);
          announcements.add(announcement);
        }
      }
    });

    return announcements;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: announcement(),
        builder: (context, snapShot) {
          if (!snapShot.hasData) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapShot.hasError) {
            return Container(
              child: Center(
                child: Text("An error occurred, please try again later!"),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: snapShot.data.length,
                itemBuilder: (_, int index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AnnouncementDetails(snapShot.data[index]);
                        }));
                      },
                      child: index != 0
                          ? oldEvent(snapShot.data[index])
                          : newEvent(snapShot.data[index]));
                });
          }
        });
  }
}
