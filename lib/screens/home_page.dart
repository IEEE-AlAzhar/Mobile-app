 import 'package:flutter/material.dart';
import'package:ieeeapp/widgets/cards.dart';
import 'package:ieeeapp/widgets/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  List events = [
    ['Next event', 'images/92925.jpg', '1/9/2020'],
    ['Last event', 'images/images (1).jpg', '10 days'],
    ['Third event', 'images/images (4).jpg', '25 days'],
    ['Second event', 'images/images (5).jpg', 'one month'],
    ['First event', 'images/ok.jpg', '2 months']
  ];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: events.length,
        itemBuilder: (_, int index) {
          if (index != 0) {
            return oldEvent(events[index]);
          } else
            return newEvent(events[index]);
        });
  }
}
