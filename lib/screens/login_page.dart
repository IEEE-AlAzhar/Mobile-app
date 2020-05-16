import 'package:flutter/material.dart';
import 'package:ieeeapp/screens/home_page.dart';
import 'package:ieeeapp/utils/networking.dart';
import 'home_page.dart';

NetworkHelper nHelper = NetworkHelper();

class LoginPage extends StatefulWidget {
  static String id = 'Loginpage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Container(
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
                controller: textEditingController,
                obscureText: true,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'your code',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: const Text(
                  'log in',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  nHelper.login(textEditingController.text).then((val) {
                    if (val.statusCode == 200) {
                      Navigator.of(context).pushNamed(HomeScreen.id);
                    }
                    else{
                      final snackBar = SnackBar(content: Text('Incorrect code'));
                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                  });
                },

              ),
            ],
          ),
        ),
      ),
    );
  }
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
