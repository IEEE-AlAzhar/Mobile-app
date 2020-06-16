import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ieeeapp/utils/networking.dart';

NetworkHelper nHelper = NetworkHelper();

class AchievementsPage extends StatelessWidget {
  static String id = 'AcheivementsPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achevements'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: nHelper.ache.length,
            itemBuilder: (context, index) {
              return Card(
                  margin: EdgeInsets.all(10.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      child: (Image.network("${nHelper.ache[index].achCover}")),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                    ),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Text("${nHelper.ache[index].achTit}",style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("${nHelper.ache[index].achDesc}"),
                          Text("${nHelper.ache[index].achDate}"),
                        ]))
                  ]));
            }),
      ),
    );
  }
}
