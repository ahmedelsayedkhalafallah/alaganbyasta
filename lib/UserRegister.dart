import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'User.dart';

// text controllers
TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController phoneController = TextEditingController();

class UserRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
        primaryColor: const Color(0xFF8BC34A),
        accentColor: const Color(0xFF8BC34A),
        canvasColor: const Color(0xFFEEEEEE),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.directions_car,color: Colors.lightGreen,),

          ],
        ),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: new Center(
        child: new Container(
          child: new Center(
              child: new SingleChildScrollView(
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                new Text(
                  'قم بملئ البيانات الآتية',
                  style: new TextStyle(
                    color: Colors.lightGreen,
                  ),
                  textAlign: TextAlign.center,
                ),
                //====================================
                new Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, bottom: 24.0),
                  child: new TextField(
                    decoration: new InputDecoration(
                      hintStyle: TextStyle(
                        color: Colors.lightGreen[200],
                      ),
                      hintText: 'اسم المستخدم',
                    ),
                    controller: nameController,
                    autofocus: true,
                    style: new TextStyle(
                      color: Colors.lightGreen,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                //====================================
                new Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, bottom: 24.0),
                  child: new TextField(
                    obscureText: true,
                    decoration: new InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.lightGreen[200],
                        ),
                        hintText: 'كلمة السر'),
                    controller: passwordController,
                    autofocus: true,
                    style: new TextStyle(
                      color: Colors.lightGreen,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                //====================================
                new Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, bottom: 24.0),
                  child: new TextField(
                    decoration: new InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.lightGreen[200],
                        ),
                        hintText: 'رقم التليفون'),
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    maxLength: 11,
                    autofocus: true,
                    style: new TextStyle(
                      color: Colors.lightGreen,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: new RaisedButton(
                    onPressed: () {
                      Register(context);
                    },
                    color: Colors.lightGreen,
                    textColor: Colors.grey[200],
                    child: const Text('تسجيل'),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                  ),
                ),
              ]))),
          color: Colors.blueGrey[800],
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

//name validation
bool validate_name(String name) {
  return (name != null && name.length > 10 && name != "          ");
}

bool validate_password(String password) {
  return (password != null && password.length > 10 && password != "          ");
}

bool validate_phone(String phone) {
  return (phone != null && phone.length == 11);
}

// firebase collection content retrieve
Future<Map<String, User>> getDataFromFireStore() async {
  CollectionReference ref = Firestore.instance.collection('DriverList');
  QuerySnapshot eventsQuery = await ref.getDocuments();

  Map<String, User> eventsHashMap = new Map<String, User>();

  eventsQuery.documents.forEach((document) {
    eventsHashMap.putIfAbsent(
        document['phone'],
        () => new User(
            name: document['name'],
            phone: document['phone'],
            password: document['password'],
            ordered: document['ordered']));
  });

  return eventsHashMap;
}

// check if the use is found
Future<bool> userCheck(String phone) async {
  bool isFound = false;
  Map<String, User> d = await getDataFromFireStore();
  if (d.containsKey(phone)) {
    isFound = true;
  }
  return isFound;
}

//registeration function
Future Register(BuildContext context) async {
  String name = nameController.text;
  String password = passwordController.text;
  String phone = phoneController.text;

  if (!(validate_name(name))) {
    ShowDialogue("من فضلك قم بادخال اسم المستخدم بشكل صحيح", context);
    return;
  }
  if (!(validate_password(password))) {
    ShowDialogue("من فضلك قم بادخال كلمة السر بشكل صحيح", context);
    return;
  }
  if (!(validate_phone(phone))) {
    ShowDialogue("من فضلك قم بادخال رقم التليفون بشكل صحيح", context);
    return;
  }

  if (!(await userCheck(phone))) {
    Firestore.instance.collection("UserList").document(phone).setData({
      'name': name,
      'phone': phone,
      'password': password,
      'ordered': 'false'
    }).whenComplete(() {
      ShowDialogue("تم تسجيلك كمستخدم يمكنك استخدام التطبيق الان ، عد إلى الصفحة الرئيسية وقم بتسجيل الدخول", context);
    });
  } else {
    ShowDialogue("هذا المستخدم قام بالتسجيل مسبقاً", context);
    return;
  }
}

//dialogue
ShowDialogue(String s, BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
            title: new Text("تنبيه"),
            content: new Text(s),
          ));
}
