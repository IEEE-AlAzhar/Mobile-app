import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static String id = 'ProfilePage';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: text('Technical', 15.0, Colors.white),elevation: 0.0,backgroundColor: Colors.blueAccent,),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.blueAccent,
              height: 350.0,
              width: double.infinity,
              child: Column(mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(''),
                    radius: 70.0,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  text('Nada Abduallah', 20.0, Colors.white),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  text('Mobile App | Member', 12.0, Colors.white),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.business_center),
                    title: text('Achivmentes', 20.0, Colors.black),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(
                    height: 20.0,
                  ),
                  ListTile(
                      leading: Icon(Icons.feedback),
                      title: text('Feedback', 20.0, Colors.black),
                      trailing: Icon(Icons.arrow_forward_ios)),
                ],
              ),
            )
          ],
        ));
  }

  Widget text(String text, double size, Color color) {
    return Text(
      '$text',
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
