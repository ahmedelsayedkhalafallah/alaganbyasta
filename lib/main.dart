import 'package:flutter/material.dart';
import 'RegisterChoice.dart';
import 'UserApp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'User.dart';
import 'Driver.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'OrderBinding.dart';
import 'DriverApp.dart';
import 'Order.dart';

// text controllers
TextEditingController passwordController = TextEditingController();
TextEditingController phoneController = TextEditingController();
SharedPreferences sharedPreferences;
String namePref,
    phonePref,
    typePref,
    statePref,
    car1Pref,
    car2Pref,
    car3Pref,
    car4Pref,
    car5Pref;

saveDataPref(String phone, String name, String type, String state,
    [String car1, String car2, String car3, String car4, String car5]) {
  sharedPreferences.setString('phone', phone);
  sharedPreferences.setString('name', name);
  sharedPreferences.setString('type', type);
  sharedPreferences.setString('state', state);
  if (car1 != null) {
    sharedPreferences.setString('car1', car1);
    sharedPreferences.setString('car2', car2);
    sharedPreferences.setString('car3', car3);
    sharedPreferences.setString('car4', car4);
    sharedPreferences.setString('car5', car5);
  }
  print('pref stored');
  print('${sharedPreferences.getString('phone')}');
}

orderDest(Order o) {
  if (o.firstDestination == "from")
    return new Text(
      "${o.secondDestination}مشوار من آبا إلى ",
      textAlign: TextAlign.center,
      style: new TextStyle(color: Colors.lightGreen),
      textDirection: TextDirection.rtl,
    );
  else
    return new Text(
      "مشوار من ${o.secondDestination} إلى آبا",
      textAlign: TextAlign.center,
      style: new TextStyle(color: Colors.lightGreen),
      textDirection: TextDirection.rtl,
    );
}

Map<String, Order> orders = new Map<String, Order>();
List<Widget> orderList = new List<Widget>();
clearOrderList() {
  orders.forEach((k, v) {
    switch (v.cartype) {
      case 'car1':
        if (car1Pref == 'false') {
          orders.remove(k);
        }
        break;
      case 'car2':
        print("entered");
        if (car2Pref == 'false') {
          orders.remove(k);
        }
        break;
      case 'car3':
        if (car3Pref == 'false') {
          orders.remove(k);
        }
        break;
      case 'car4':
        if (car4Pref == 'false') {
          orders.remove(k);
        }
        break;
      case 'car5':
        if (car5Pref == 'false') {
          orders.remove(k);
        }
        break;
    }
  });
}

returnCar(String car) {
  switch (car) {
    case 'car1':
      return 'سوزوكي';
    case 'car2':
      return 'ملاكي';
    case 'car3':
      return 'أفانصة';
    case 'car4':
      return 'ميكروباص';
    case 'car5':
      return 'أتوبيس';
  }
}

createOrderList() {
  orders.forEach((k, v) {
    orderList.add(Padding(
      padding: const EdgeInsets.all(36.0),
      child: new Card(
        color: Colors.grey[700],
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)),
        margin: EdgeInsets.all(4.0),
        child: Column(
          children: <Widget>[
            orderDest(v),
            new Text(
              "يوم ${v.tripdate} الساعة ${v.triptime}",
              textAlign: TextAlign.center,
              style: new TextStyle(color: Colors.lightGreen),
              textDirection: TextDirection.rtl,
            ),
            new Text(
              "نوع السيارة المطلوب : ${returnCar(v.cartype)}",
              textAlign: TextAlign.center,
              style: new TextStyle(color: Colors.lightGreen),
              textDirection: TextDirection.rtl,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 48.0, right: 48.0, top: 12.0, bottom: 12.0),
              child: new RaisedButton(
                onPressed: () {},
                color: Colors.lightGreen,
                textColor: Colors.grey[200],
                child: const Text('قبول الطلب'),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
              ),
            ),
          ],
        ),
      ),
    ));
  });
}

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
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
    if (phonePref != null && phonePref != "" &&typePref !='driver' ) {
      if (typePref == 'user') {
        if (statePref == 'false') {
          return new UserApp();
        } else {
          return new OrderBinding();
        }

      }

    } else
      return new Scaffold(
        appBar: new AppBar(
          title: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.directions_car,
                color: Colors.lightGreen,
              ),
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
              children: <Widget>[
//                  new Container(
//                    alignment: Alignment.center,
//                    height: 60.0,
//                    decoration: new BoxDecoration(
//                        color: Colors.blueGrey[800],
//                        border: new Border.all(
//                            color: Colors.lightGreenAccent[400],
//                            width: 1.0
//                        ),
//                        borderRadius: new BorderRadius.circular(12.0)
//                    ),
//                    child: new TextFormField(
//                      decoration: null,
//                    ),
//                  )
//                  ,
                // User name text field
                new Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, bottom: 24.0),
                  child: new TextField(
                    decoration: new InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.lightGreen[200],
                        ),
                        hintText: 'رقم التليفون'),
                    controller: phoneController,
                    autofocus: true,
                    style: new TextStyle(
                      color: Colors.lightGreen,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
//=======================================
                //PassWord text field
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
                //=============================================

                new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterChoice()));
                        },
                        color: Colors.blueGrey[800],
                        textColor: Colors.grey[200],
                        child: const Text('إنشاء حساب'),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                      ),

                      //==========================================
                      new RaisedButton(
                        onPressed: () {
                          login(context);
                        },
                        color: Colors.lightGreen,
                        textColor: Colors.grey[200],
                        child: const Text('دخول'),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                      ),

                      //============================================
                    ]),
              ],
            ))),
            color: Colors.blueGrey[800],
            padding: const EdgeInsets.all(0.0),
            alignment: Alignment.center,
          ),
        ),
      );
  }

  @override
  void initState() {
    super.initState();
//    Firestore.instance.collection('OrderList').getDocuments().then((QuerySnapshot eventsQuery){
//      Map<String, Order> eventsHashMap = new Map<String, Order>();
//
//      eventsQuery.documents.forEach((document) {
//        eventsHashMap.putIfAbsent(
//            document['phone'],
//                () =>
//            new Order(
//                cartype: document['cartype'],
//                phone: document['phone'],
//                firstDestination: document['firstDestination'],
//                price: document['price'].toString(),
//                secondDestination: document['secondDestination'],
//                state: document['state'],
//                triptime: document['triptime'],
//                triptype: document['triptype'],
//                user: document['user']
//            ));
//      });
//
//      orders = eventsHashMap;
//      setState(() {});
//    });
    //readFile('phone');
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      phonePref = sp.getString('phone');
      namePref = sp.getString('name');
      typePref = sp.getString('type');
      statePref = sp.getString('state');
      car1Pref = sp.getString('car1');
      car2Pref = sp.getString('car2');
      car3Pref = sp.getString('car3');
      car4Pref = sp.getString('car4');
      car5Pref = sp.getString('car5');
      setState(() {});
    });
  }
}

bool validate_password(String password) {
  return (password != null && password.length > 10 && password != "          ");
}

bool validate_phone(String phone) {
  return (phone != null && phone.length == 11);
}

// firebase collection content retrieve
Future<Map<String, User>> getUserDataFromFireStore() async {
  CollectionReference ref = Firestore.instance.collection('UserList');
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
  Map<String, User> d = await getUserDataFromFireStore();
  print('${d.containsKey(phone)}');
  if (d.containsKey(phone)) {
    isFound = true;
  }
  return isFound;
}

// firebase collection content retrieve
Future<Map<String, Driver>> getDriverDataFromFireStore() async {
  CollectionReference ref = Firestore.instance.collection('DriverList');
  QuerySnapshot eventsQuery = await ref.getDocuments();

  Map<String, Driver> eventsHashMap = new Map<String, Driver>();

  eventsQuery.documents.forEach((document) {
    eventsHashMap.putIfAbsent(
        document['phone'],
        () => new Driver(
            name: document['name'],
            phone: document['phone'],
            password: document['password'],
            car1: document['car1'],
            car2: document['car2'],
            car3: document['car3'],
            car4: document['car4'],
            car5: document['car5'],
            activation: document['activation']));
  });

  return eventsHashMap;
}

// check if the use is found
Future<bool> DriverCheck(String phone) async {
  bool isFound = false;
  Map<String, Driver> d = await getDriverDataFromFireStore();
  if (d.containsKey(phone)) {
    isFound = true;
  }
  return isFound;
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

Future login(BuildContext context) async {
  String password = passwordController.text;
  String phone = phoneController.text;
  print("entered login function");
  //check if the user is registered
  Map<String, User> users = new Map<String, User>();
  users = await getUserDataFromFireStore();
  if (await userCheck(phone)) {
    // user is registered check if it is the right password
    if (users[phone].password == password) {
      // check if the user have an order
      saveDataPref(
          users[phone].phone, users[phone].name, "user", users[phone].ordered);
      if (users[phone].ordered == "true") {

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderBinding()));
        return;
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserApp()));
        return;
      }
    } else {
      ShowDialogue(
          "تم إدخال كلمة السر بشكل خاطئ من فضلك تأكد من كلمة السر", context);
    }
  }

  Map<String, Driver> drivers = new Map<String, Driver>();
  drivers = await getDriverDataFromFireStore();
  if (await DriverCheck(phone)) {
    // user is registered check if it is the right password
    if (drivers[phone].password == password) {
      //check if driver account is activated
      if (drivers[phone].activation == "true") {
        saveDataPref(
            drivers[phone].phone,
            drivers[phone].name,
            "driver",
            drivers[phone].activation,
            drivers[phone].car1,
            drivers[phone].car2,
            drivers[phone].car3,
            drivers[phone].car4,
            drivers[phone].car5);
        ImportOrders i = new ImportOrders();
        i.getOrderDataFromFireStore();
        createOrderList();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DriverApp(
                      orderList: orderList,
                    )));
      } else {
        ShowDialogue(
            "لم يتم تفعيل حسابكم بعد يرجى الانتظار وسيتم التواصل معكم قريباً",
            context);
      }
    } else {
      ShowDialogue(
          "تم إدخال كلمة السر بشكل خاطئ من فضلك تأكد من كلمة السر", context);
    }
  } else {
    ShowDialogue(
        "لم يتم تسجيل هذا المستخدم من فضلك قم بانشاء حساب اولا", context);
  }
}

class ImportOrders {
  Future getOrderDataFromFireStore() async {
    CollectionReference ref = Firestore.instance.collection('OrderList');
    QuerySnapshot eventsQuery = await ref.getDocuments();

    Map<String, Order> eventsHashMap = new Map<String, Order>();

    eventsQuery.documents.forEach((document) {
      eventsHashMap.putIfAbsent(
          document['phone'],
          () => new Order(
              cartype: document['cartype'],
              phone: document['phone'],
              firstDestination: document['firstDestination'],
              price: document['price'].toString(),
              secondDestination: document['secondDestination'],
              state: document['state'],
              triptime: document['triptime'],
              triptype: document['triptype'],
              user: document['user']));
    });

    orders = eventsHashMap;
  }
}
