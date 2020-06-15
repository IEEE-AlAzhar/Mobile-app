import 'package:flutter/material.dart';

// card shape of new event
newEvent(List content) {
  return Card(
      elevation: 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Image.asset(content[1]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 9, bottom: 11, left: 15),
            child: Text(
              content[0],
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 27),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 11, left: 15),
            child: Text(
              content[2],
              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            ),
          ),
        ],
      ));
}


// card shape of old event
oldEvent(List content) {
  return Card(
    elevation: 7,
    child: ListTile(
      leading: Image.asset(
        content[1],
        width: 90,
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          '${content[0]}',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 9, bottom: 5),
        child: Text(content[2]),
      ),
    ),
  );
}