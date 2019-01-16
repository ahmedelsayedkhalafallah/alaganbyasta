import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Driver.dart';
import 'dart:async';




// text controllers
TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController phoneController = TextEditingController();
// checkboxes values
bool car1= false, car2= false,car3=false, car4 = false, car5 = false;


class DriverRegister extends StatelessWidget {
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








  // check box 1 state change
  void checkChanged1(bool value){
    setState(() {
      car1 = value;
    });
  }



  // check box 2 state change
  void checkChanged2(bool value){
    setState(() {
      car2 = value;
    });
  }



  // check box 3 state change
  void checkChanged3(bool value){
    setState(() {
      car3 = value;
    });
  }

  // check box 4 state change
  void checkChanged4(bool value){
    setState(() {
      car4 = value;
    });
  }

  // check box 5 state change
  void checkChanged5(bool value){
    setState(() {
      car5 = value;
    });
  }


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

                    new Text('قم بملئ البيانات الآتية',style: new TextStyle(color: Colors.lightGreen,),textAlign: TextAlign.center,),
                    //====================================
                    new Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0,bottom: 24.0),
                      child: new TextField(
                        decoration: new InputDecoration(
                          hintStyle: TextStyle(color: Colors.lightGreen[200],),
                          hintText: 'اسم المستخدم',


                        ),
                        controller: nameController,
                        autofocus: true,
                        style: new TextStyle(color: Colors.lightGreen,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //====================================
                    new Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0,bottom: 24.0),
                      child: new TextField(
                        obscureText: true,
                        decoration: new InputDecoration(
                            hintStyle: TextStyle(color: Colors.lightGreen[200],),
                            hintText: 'كلمة السر'

                        ),
                        controller: passwordController,
                        autofocus: true,
                        style: new TextStyle(color: Colors.lightGreen,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //====================================
                    new Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0,bottom: 24.0),
                      child: new TextField(
                        decoration: new InputDecoration(
                            hintStyle: TextStyle(color: Colors.lightGreen[200],),
                            hintText: 'رقم التليفون'

                        ),
                        keyboardType: TextInputType.number,
                        maxLength: 11,
                        controller: phoneController,
                        autofocus: true,
                        style: new TextStyle(color: Colors.lightGreen,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //=====================================

//=======================================
                    new Text('قم باختيار انواع السيارات التى تمتلكها',style: new TextStyle(color: Colors.lightGreen,),textAlign: TextAlign.center,),

                    //===========================================

                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text('سوزوكي',style: new TextStyle(color: Colors.lightGreen,),textAlign: TextAlign.center,),
                        new Checkbox(key:null, onChanged: (bool value){checkChanged1(value);}, value:car1,),
                      ],
                    ),
                    //===========================================
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text('ملاكي',style: new TextStyle(color: Colors.lightGreen,),textAlign: TextAlign.center,),
                        new Checkbox(key:null, onChanged: (bool value){checkChanged2(value);}, value:car2,),
                      ],
                    ),
                    //==========================================
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text('أفانصة',style: new TextStyle(color: Colors.lightGreen,),textAlign: TextAlign.center,),
                        new Checkbox(key:null, onChanged: (bool value){checkChanged3(value);}, value:car3,),
                      ],
                    ),
                    //============================================
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text('ميكروباص',style: new TextStyle(color: Colors.lightGreen,),textAlign: TextAlign.center,),
                        new Checkbox(key:null, onChanged: (bool value){checkChanged4(value);}, value:car4,),
                      ],
                    ),
                    //============================================
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text('أتوبيس',style: new TextStyle(color: Colors.lightGreen,),textAlign: TextAlign.center,),
                        new Checkbox(key:null, onChanged: (bool value){checkChanged5(value);}, value:car5,),
                      ],
                    ),
                    //============================================

                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      child: new RaisedButton(onPressed:  (){Register(context);},
                        color: Colors.lightGreen,
                        textColor: Colors.grey[200],
                        child: const Text('تسجيل'),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

                      ),
                    ),



                  ]
              ),
        )
          ),
          color: Colors.blueGrey[800],
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}



//name validation
bool validate_name(String name){
  return(name != null && name.length >10&&name !="          ");

}
bool validate_password(String password){
  return(password != null && password.length >10&&password !="          ");

}
bool validate_phone(String phone){
  return(phone != null && phone.length == 11 );

}
bool validate_cartypes(){
  return (car1||car2||car3||car4||car5);
}


// firebase collection content retrieve
Future<Map<String , Driver>> getDataFromFireStore() async {
  CollectionReference ref = Firestore.instance.collection('DriverList');
  QuerySnapshot eventsQuery = await ref.getDocuments();

  Map<String, Driver> eventsHashMap = new Map<String, Driver>();

  eventsQuery.documents.forEach((document) {
    eventsHashMap.putIfAbsent(document['phone'], () => new Driver(
        name: document['name'],
        phone: document['phone'],
        password: document['password'],
        car1: document['car1'],
        car2: document['car2'],
        car3: document['car3'],
        car4: document['car4'],
        car5: document['car5'],
        activation: document['activation']
    ));
  });

  return eventsHashMap;
}


// check if the use is found
Future<bool> userCheck(String phone) async{

  bool isFound = false;
  Map<String , Driver> d = await getDataFromFireStore();
  if(d.containsKey(phone)){
    isFound = true;
  }
  return isFound;

}



//dialogue
ShowDialogue(String s,BuildContext context){
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text("تنبيه"),
        content: new Text(s),
      )
  );
}


//registeration function
Future Register(BuildContext context) async{
  String name = nameController.text;
  String password = passwordController.text;
  String phone = phoneController.text;


  if(!(validate_name(name))) {
  ShowDialogue("من فضلك قم بادخال اسم المستخدم بشكل صحيح", context);
  return;
  }
  if(!(validate_password(password)))
  {
    ShowDialogue("من فضلك قم بادخال كلمة السر بشكل صحيح", context);
    return;
  }
  if(!(validate_phone(phone)))
  {
    ShowDialogue("من فضلك قم بادخال رقم التليفون بشكل صحيح", context);
    return;
  }
  if(!(validate_cartypes())){
    ShowDialogue("من فضلك قم باختيار السيارات التى تمتلكها", context);
    return;
  }



if(!(await userCheck(phone))) {
  Firestore.instance.collection("DriverList").document(phone).setData({
    'name': name,
    'phone': phone,
    'password': password,
    'car1': car1.toString(),
    'car2': car2.toString(),
    'car3': car3.toString(),
    'car4': car4.toString(),
    'car5': car5.toString(),
    'activation': 'false'
  }).whenComplete((){
    ShowDialogue("تم تسجيل طلبكم وسيتم التواصل معك قريباً", context);
  });
}
else{
  ShowDialogue("هذا المستخدم قام بالتسجيل مسبقاً", context);
  return;
}


}




