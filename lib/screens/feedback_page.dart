import 'package:flutter/material.dart';
import 'package:ieeeapp/utils/networking.dart';

NetworkHelper nHelper = NetworkHelper();

class FeedbackPage extends StatelessWidget {
  static String id = 'FeedbackPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text('Feedback'),centerTitle: true),
        body:Container(
          child: ListView.builder(
              itemCount: nHelper.feedBack.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10.0),
                    child:
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("${nHelper.feedBack[index].fedTit}",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("${nHelper.feedBack[index].fedBody}"),
                                    Text("${nHelper.feedBack[index].fedDate}"),
                                  ])),
                        );
              }),
        ),


    );
  }
}
