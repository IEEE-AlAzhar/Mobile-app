import 'package:flutter/material.dart';
import 'package:ieeeapp/models/themes.dart';
import 'package:ieeeapp/utils/networking.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:ieeeapp/constants.dart';
import 'package:provider/provider.dart';

NetworkHelper nHelper = NetworkHelper();

class FeedbackPage extends StatelessWidget {
  static String id = 'FeedbackPage';

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Feedback'), centerTitle: true),
      body: Container(
        child: nHelper.feedBack.isNotEmpty? ListView.builder(
            itemCount: nHelper.feedBack.length,
            itemBuilder: (context, index) {
                var item = nHelper.feedBack[index];
                String date = item.fedDate;
                DateTime dateformat = DateTime.parse(date);
                String formattedDate =
                    DateFormat('dd-MM-yyyy').format(dateformat);
                return Card(
                  color: themeChange.darkTheme? Colors.blueGrey : Colors.white24,
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(
                      "${item.fedTit}",
                      style: titleStyle ,
                    ),
                    subtitle: Text("${item.fedBody}",style: subtitleStyle,),
                    trailing: Text(formattedDate),
                  ),
                );
              }
            ):
        Center(
          child: Text(
            "You Don't have Feedback yet!",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        )
      ),
    );
  }
}

