import 'package:flutter/material.dart';
import 'package:ieeeapp/utils/shared_pref.dart';


SharedPrefsHelper sharedPrefsHelper = SharedPrefsHelper();

class AchievementPage extends StatelessWidget {
  static String id = 'AchievementsPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Achievements'),centerTitle: true),
       body: Container(
         child: Column(
           children: [
           FutureBuilder(
               future: sharedPrefsHelper.readTitle(),
               builder: (_, snapshot) {
                 if(snapshot.hasData){
                   return Text('${snapshot.data}');
                 }else{
                   return Text('this is empty');
                 }
               }
           ),
//           FutureBuilder(
//               future: sharedPrefsHelper.readDescription(),
//               builder: (_, snapshot) {
//                 if(snapshot.hasData){
//                   return Text('${snapshot.data}');
//                 }else{
//                   return Text('this is empty');
//                 }
//               }
//           ),
//           FutureBuilder(
//               future: sharedPrefsHelper.readDate(),
//               builder: (_, snapshot) {
//                 if(snapshot.hasData){
//                   return Text('${snapshot.data}');
//                 }else{
//                   return Text('this is empty');
//                 }
//               }
//           ),
         ],),
       )


    );
  }
}
