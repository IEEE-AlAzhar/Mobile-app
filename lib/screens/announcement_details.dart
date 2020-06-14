import 'package:flutter/material.dart';
import 'package:ieeeapp/models/announcement.dart';
import 'package:ieeeapp/widgets/cards.dart';

class AnnouncementDetails extends StatelessWidget {
  Announcement announcement;
  AnnouncementDetails(this.announcement);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "home",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            newEvent(announcement),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text(announcement.body, style: TextStyle(fontSize: 21)),
            )
          ],
        ),
      ),
    );
  }
}
