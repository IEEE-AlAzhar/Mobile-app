import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ieeeapp/main.dart';
import 'package:ieeeapp/utils/networking.dart';
import 'package:ieeeapp/widgets/input_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';



NetworkHelper nHelper = NetworkHelper();

TextEditingController myController = TextEditingController();

class SettingsScreen extends StatefulWidget {
  static String id = "SettingsScreen";
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  File _image;
  String token = '';
  String id = '';
  String _imagepath;
  String phoneInit;
  bool _spin =false;
  TextEditingController myController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    sharedPrefsHelper.readToken().then((value) {
      setState(() {
        token = value;
      });
    });

    sharedPrefsHelper.readId().then((value) {
      setState(() {
        id = value;
      });
    });
    sharedPrefsHelper.readPhone().then((value) {
      setState(() {
        phoneInit =value;
        myController.text = value;
      });
    });
    sharedPrefsHelper.readImage().then((value) {
      setState(() {
        _imagepath = value;
      });
    });
  }
  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
    Navigator.pop(context);
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    Navigator.pop(context);
  }

  Future<void> _showChoiceDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select Your Choice'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('🖼 Pick from gallery'),
                    onTap: () {
                      getImageFromGallery();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: GestureDetector(
                      child: Text('📷 Take picture'),
                      onTap: () {
                        getImageFromCamera();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: _spin,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 60.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40.0),
                         child :CircleAvatar(
                            backgroundColor: Colors.white,
                           backgroundImage: FileImage(File(_imagepath)),
                          radius: 100.0,
                          child: ClipOval(
                            child: SizedBox(
                              height: 180.0,
                              width: 180.0,
                              child: FutureBuilder(
                                  future: sharedPrefsHelper.readImage(),
                                  builder: (_, snapshot) {
                                    if (snapshot.hasData) {
                                      return _image != null
                                          ? Image.file(
                                        _image,
                                        fit: BoxFit.fill,
                                      )
                                          : Image.network(
                                        snapshot.data,
                                        fit: BoxFit.fill,
                                      );
                                    } else {
                                      return CircleAvatar(
                                        backgroundImage: AssetImage("image/profile.png"),
                                      );
                                    }
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 100.0,
                      ),
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          _showChoiceDialog();
                        },
                        child: Icon(
                          Icons.photo_camera,
                          color: Colors.blue[300],
                          size: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(25.0),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, top: 40.0, bottom: 10.0, right: 15.0),
                      child: InputField('Update Phone', myController),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: themeChangeProvider.darkTheme ? Colors.blueGrey : Colors.blue[300],
                  elevation: 6.0,
                  padding: EdgeInsets.only(
                      left: 25.0, top: 10.0, bottom: 10.0, right: 25.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {

                    if(myController.text.isEmpty){
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text('Empty Field'),
                      ));
                    }
                    if(myController.text != phoneInit ){
                      setState(() {
                        _spin= true;
                      });
                    nHelper
                        .updatePhone(myController.text, id, token)
                        .then((value) {
                      if (value.statusCode == 200) {
                        setState(() {
                          _spin= false;
                        });
                        sharedPrefsHelper
                            .savePhone(jsonDecode(value.body)["phone"]);
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Updated phone number successfully'),
                        ));
                      } else {
                        setState(() {
                          _spin= false;
                        });
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('${value.statusCode}'),
                        ));
                        print(value.statusCode);
                      }
                    });
                    }
                    if(_image!=null){
                      setState(() {
                        _spin= true;
                      });
                    nHelper.updateImage(id, token,_image).then((value) {
                      if (value.statusCode == 200) {
                        setState(() {
                          _spin= false;
                        });
                        print("updated photo");
                        print("$value");
                        String val =value.toString();
                        String newImage = val.substring(10,val.length-2);
                        sharedPrefsHelper.saveImage(newImage);
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Updated Image successfully'),
                        ));
                        print(value.statusCode);
                      } else {
                        setState(() {
                          _spin= false;
                        });
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('${value.statusCode}'),
                        ));
                        print(value.statusCode);
                      }
                    });
                    _image =null;
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void dispose(){
    myController.dispose();
    super.dispose();
  }
}

