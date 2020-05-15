import 'package:flutter/material.dart';
import 'package:ieeeapp/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  static String id = 'Loginpage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: CircleAvatar(
                  radius: 70.0,
                  backgroundImage: AssetImage('images/ieee_branch.png'),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: true,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'your code',
                ),
              ),
              SizedBox(height: 10.0,),
              RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)=> HomeScreen()
                  ),);

                },
                child: const Text(

                  'log in',
                  style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}