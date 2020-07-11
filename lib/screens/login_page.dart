import 'package:flutter/material.dart';
import 'package:ieeeapp/constants.dart';
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
  bool _showSpinner = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: ModalProgressHUD(
          inAsyncCall: _showSpinner,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.lightBlueAccent,
                Colors.white,
                primaryColor,
              ]),
            ),
//            margin: EdgeInsets.only(
//              left: 10.0,
//              right: 10.0,
//            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image.asset('images/ieee_azhar.png'),

//                    tag: 'logo',
//                    child: CircleAvatar(
//                      radius: 150.0,
//                      backgroundImage: AssetImage('images/ieee_azhar.png'),
                  ),
//                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, 1),
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          ),
                        ]),
                    child: TextField(
                      style: TextStyle(fontSize: 20),
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'your code',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                    ),
                    child: Text(
                      'login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {

                      if(textEditingController.text.isNotEmpty){
                        setState(() {
                          _showSpinner = true;
                        });
                        nHelper.login(textEditingController.text).then((val) {
                          if (val.statusCode == 200) {
                            setState(() {
                              _showSpinner = false;
                            });
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                            textEditingController.clear();
                          } else {
                            setState(() {
                              _showSpinner = false;
                            });

                            final snackBar =
                            SnackBar(content: Text('Incorrect code'));
                            _scaffoldKey.currentState.showSnackBar(snackBar);
                          }
                        });

                      }else{
                        final snackBar =
                        SnackBar(content: Text('Empty field'));
                        _scaffoldKey.currentState.showSnackBar(snackBar);
                      }
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
