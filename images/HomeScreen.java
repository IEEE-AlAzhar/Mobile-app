import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[900],
          leading: IconButton(
            onPressed: () {
              // SideDrawer
            },
            icon: Icon(
              Icons.dehaze,
              color: Colors.white,
            ),
          ),
          title: Text(
            'IEEE  AZHAR',
            style:
                TextStyle(color: Colors.white, fontSize: 27, letterSpacing: 1),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelPadding: const EdgeInsets.only(bottom: 11),
            labelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 19),
            unselectedLabelColor: Colors.grey[300],
            unselectedLabelStyle: TextStyle(fontSize: 17),
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            tabs: <Widget>[
              Text(
                "Home",
              ),
              Text(
                "Proffile",
              ),
              Text(
                "Setting",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            HomeScreenContent(),
            Text(
              "Proffile",
              style: TextStyle(color: Colors.blueAccent),
            ),
            Text(
              "Setting",
              style: TextStyle(color: Colors.blueAccent),
            ),
          ],
        ),
      ),
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
