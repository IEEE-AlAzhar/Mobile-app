import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ieeeapp/models/themes.dart';
import 'package:ieeeapp/utils/shared_pref.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import '../constants.dart';

SharedPrefsHelper _sharedPrefsHelper = SharedPrefsHelper();

class AchievementsPage extends StatelessWidget {
  static String id = 'AcheivementsPage';
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements'),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: _sharedPrefsHelper.readAchievements(),
          builder: (_, snapshot){
            return snapshot.hasData ?
            ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var item = snapshot.data[index];
                  String date = item.achDate;
                  DateTime dateformat = DateTime.parse(date);
                  String formattedDate =
                  DateFormat('dd-MM-yyyy').format(dateformat);
                  return Card(
                      color: themeChange.darkTheme? Colors.blueGrey : Colors.white12 ,
                      margin: EdgeInsets.all(10.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 100.0,
                              height: 100.0,
                              child: (Image.network("${item.achCover}")),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                            ),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("${item.achTit}",
                                          style: titleStyle),
                                      Text("${item.achDesc}",style: subtitleStyle,),
                                      Text(formattedDate),
                                    ]))
                          ]));
                }) :
            Center(
              child: Text ("You Don't have Achievements yet!" ,
                style: TextStyle(
                    color: themeChange.darkTheme ? Colors.white : Colors.black,
                    fontSize: 20.0,fontWeight: FontWeight.bold),),
            );
          },
        )
        ,
      ),
    );
  }
}
/*

ListView.builder(
            itemCount: nHelper.ache.length,
            itemBuilder: (context, index) {
                var item = nHelper.ache[index];
                String date = item.achDate;
                DateTime dateformat = DateTime.parse(date);
                String formattedDate =
                DateFormat('dd-MM-yyyy').format(dateformat);
                return Card(
                    color: themeChange.darkTheme? Colors.blueGrey : Colors.white12 ,
                    margin: EdgeInsets.all(10.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 100.0,
                            height: 100.0,
                            child: (Image.network("${item.achCover}")),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                          ),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("${item.achTit}",
                                        style: titleStyle),
                                    Text("${item.achDesc}",style: subtitleStyle,),
                                    Text(formattedDate),
                                  ]))
                        ]));
              })
 */

/*
Center(
          child: Text ("You Don't have Achievements yet!" ,
            style: TextStyle(
                color: themeChange.darkTheme ? Colors.white : Colors.black,
                fontSize: 20.0,fontWeight: FontWeight.bold),),
        )
 */