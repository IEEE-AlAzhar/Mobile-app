import 'package:flutter/material.dart';
import 'package:ieeeapp/models/announcement.dart';
import 'package:intl/intl.dart';

// card shape of new event
newEvent(Announcement announcement) {
  String date = announcement.date;
  DateTime dateformat = DateTime.parse(date);
  String formattedDate = DateFormat('dd-MM-yyyy').format(dateformat);
  return Card(
      elevation: 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Center(
              child: FadeInImage.assetNetwork(fit: BoxFit.fill,
                  placeholder: "images/giphy.gif", image: announcement.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 9, bottom: 11, left: 15),
            child: Text(
              announcement.title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 27),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 11, left: 15),
            child: Text(
              formattedDate,
              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            ),
          ),
        ],
      ));
}

// card shape of old event
oldEvent(Announcement announcement) {
  String date = announcement.date;
  DateTime dateformat = DateTime.parse(date);
  String formattedDate = DateFormat('dd-MM-yyyy').format(dateformat);
  return Card(
    elevation: 7,
    child: ListTile(
      leading: Image.network(
        announcement.cover,
        width: 90,
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          announcement.title,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 9, bottom: 5),
        child: Text(formattedDate),
      ),
    ),
  );
}
