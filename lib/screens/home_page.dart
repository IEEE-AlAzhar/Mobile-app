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
  Future<List<Announcement>> announcements;

  void initState() {
    // TODO: implement initState
    sharedPrefsHelper.readToken().then((onvalue) {
      token = onvalue;
      announcements = announcement();
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
            style: TextStyle(
                color: Colors.white, fontSize: 27, letterSpacing: 1.7),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: announcements,
            builder: (context, snapShot) {
              if (snapShot.hasData) {
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
              } else if (snapShot.hasError) {
                return Container(
                  child: Center(
                    child: Text("An error occurred, please try again later!"),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  Future<List<Announcement>> announcement() async {
    List<Announcement> tempAnnouncements = [];
    List<Announcement> finalAnnouncements = [];

    var response;
    await networkHelper.getAnnouncements(token).then((onValue) {
      response = onValue;
    });
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      for (int i = 0; i < data.length; i++) {
        Announcement announcement = Announcement.fromJson(data[i]);
        tempAnnouncements.add(announcement);
      }
      setState(() {
        finalAnnouncements = tempAnnouncements;
      });
      return finalAnnouncements;
    } else {
      throw Exception('Failed to load announcement');
    }
  }
}
