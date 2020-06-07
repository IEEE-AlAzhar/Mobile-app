import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ieeeapp/screens/login_page.dart';
import 'package:ieeeapp/screens/profile_page.dart';
import 'package:ieeeapp/utils/FadeAnimation.dart';
import 'package:ieeeapp/models/themes.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  static String id = "SplashScreen";

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}


class _SplashScreen extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;

  bool hideIcon = false;
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _widthController.forward();
            }
          });

    _widthController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _positionController.forward();
            }
          });

    _positionController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                hideIcon = true;
              });
              _scale2Controller.forward();
            }
          });

    _scale2Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scale2Animation =
        Tween<double>(begin: 1.0, end: 50.0).animate(_scale2Controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.pushNamed(context, LoginPage.id);
//              context,
//              PageTransition(
//                  type: PageTransitionType.fade, child: LoginPage()));
            }
          });
  }

//  @override
//  void initState() {
//    super.initState();
//    const duration = Duration(milliseconds: 7000);
//    Timer(duration, () {
//      Navigator.of(context).pop();
//      Navigator.push(
//          context, MaterialPageRoute(builder: (context) => SecondScreen()));
//    });
//  }

  @override
  Widget build(BuildContext context) {
//    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.white,
          width: 1,
        )),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(
                10,
              ),
            ),
            Image.asset(
              'images/ieee_branch.png',
              height: 400.0,
              width: 500.0,
            ),
//            Padding(
//              padding: EdgeInsets.only(
//                top: 10,
//              ),
//            ),
            ColorizeAnimatedTextKit(
                text: ['    IEEE-AZHAR', 'Student Branch'],
                textStyle: TextStyle(
                  fontSize: 35,

//                color: Colors.indigo.shade900,
                  fontFamily: "Ewert",
                ),
                colors: [
                  Colors.purple,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                ],
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.topStart),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            FadeAnimation(
                1.6,
                AnimatedBuilder(
                  animation: _scaleController,
                  builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _widthController,
                          builder: (context, child) => Container(
                            width: _widthAnimation.value,
                            height: 80,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue.withOpacity(.4)),
                            child: InkWell(
                              onTap: () {
                                _scaleController.forward();
                              },
                              child: Stack(children: <Widget>[
                                AnimatedBuilder(
                                  animation: _positionController,
                                  builder: (context, child) => Positioned(
                                    left: _positionAnimation.value,
                                    child: AnimatedBuilder(
                                      animation: _scale2Controller,
                                      builder: (context, child) =>
                                          Transform.scale(
                                              scale: _scale2Animation.value,
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.cyanAccent),
                                                child: hideIcon == false
                                                    ? Icon(
                                                        Icons.arrow_forward,
                                                        color: Colors.white,
                                                      )
                                                    : Container(),
                                              )),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      )),
                )),
          ],
        ),
      ),
    );
  }
}
