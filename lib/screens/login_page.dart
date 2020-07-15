import 'package:flutter/material.dart';
import 'package:ieeeapp/models/themes.dart';
import 'package:ieeeapp/screens/home_page.dart';
import 'package:ieeeapp/utils/networking.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

NetworkHelper nHelper = NetworkHelper();

class LoginPage extends StatefulWidget {
  static String id = 'Loginpage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final FocusNode _focusNode = FocusNode();
  bool _showSpinner = false;
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final logo = Padding(
      padding: EdgeInsets.all(20),
      child: Hero(
          tag: 'hero',
          child: SizedBox(
            height: 250,
            width: 250,
            child: Image.asset(
              'images/logo.png',
              color: Colors.blue[300],
            ),
          )),
    );

    final iconVisibility = IconButton(
      onPressed: _toggle,
      icon: Image.asset(
        _obscureText ? 'images/hide.png' : 'images/show.png',
        color: themeChange.darkTheme ? Colors.blue[300] : Colors.black,
      ),
      iconSize: 10,
    );

    final inputPassword = Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: _textEditingController,
        keyboardType: TextInputType.number,
        obscureText: _obscureText,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue[300],
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(50.0),
            ) ,
            suffixIcon: iconVisibility,
            hintText: 'Password',
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue[300],
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          ),
      ),
    );

    final buttonLogin = Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ButtonTheme(
        height: 56,
        child: RaisedButton(
          child: Text('Login',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          color: Colors.blue[300],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {
            if (_textEditingController.text.isNotEmpty) {
              setState(() {
                _showSpinner = true;
              });
              nHelper.login(_textEditingController.text).then((val) {
                if (val.statusCode == 200) {
                  setState(() {
                    _showSpinner = false;
                  });
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                  _textEditingController.clear();
                } else {
                  setState(() {
                    _showSpinner = false;
                  });

                  final snackBar = SnackBar(content: Text('Incorrect code'));
                  _scaffoldKey.currentState.showSnackBar(snackBar);
                }
              });
            } else {
              final snackBar = SnackBar(content: Text('Empty field'));
              _scaffoldKey.currentState.showSnackBar(snackBar);
            }
          },
        ),
      ),
    );

    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 100,left: 20,right: 20),
          children: <Widget>[
            logo,
            SizedBox(
              height: 50,
            ),
            SizedBox(
                height: 80,
                child: inputPassword,
            ),
            buttonLogin,
          ],
        ),
      ),
    ));
  }

  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
