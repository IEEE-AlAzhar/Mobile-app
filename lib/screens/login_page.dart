import 'package:flutter/material.dart';
import 'package:ieeeapp/screens/home_page.dart';
import 'package:ieeeapp/utils/networking.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'home_page.dart';

NetworkHelper nHelper = NetworkHelper();

class LoginPage extends StatefulWidget {
  static String id = 'Loginpage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textEditingController = TextEditingController();
  bool showSpinner = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Container(
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
                    height: 70.0,
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
                      setState(() {
                        showSpinner = true;
                      });
                      nHelper.login(textEditingController.text).then((val) {
                        if (val.statusCode == 200) {
                          Navigator.of(context).pushNamed(HomeScreen.id);
                        } else {
                          setState(() {
                            showSpinner = false;
                          });

                          final snackBar =
                              SnackBar(content: Text('Incorrect code'));
                          _scaffoldKey.currentState.showSnackBar(snackBar);
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
