import 'package:flutter/material.dart';
import 'Order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';



String namePref,phonePref, typePref,statePref,car1Pref,car2Pref,car3Pref,car4Pref,car5Pref;
SharedPreferences sharedPreferences;


Map<String, Order> orders = new Map<String, Order>();

List<Widget> ol = new List<Widget>();


orderDest(Order o){
  if(o.firstDestination=="from")
    return new Text("${o.secondDestination}مشوار من آبا إلى ",textAlign: TextAlign.center,style: new TextStyle(color: Colors.lightGreen),textDirection: TextDirection.rtl,);
  else
    return new Text("مشوار من ${o.secondDestination} إلى آبا",textAlign: TextAlign.center,style: new TextStyle(color: Colors.lightGreen),textDirection: TextDirection.rtl,);

}


returnCar(String car){
  switch(car)
  {
    case'car1':
      return 'سوزوكي';
    case'car2':
      return 'ملاكي';
    case'car3':
      return 'أفانصة';
    case'car4':
      return 'ميكروباص';
    case'car5':
      return 'أتوبيس';

  }

}


class DriverApp extends StatelessWidget {
  final List<Widget>orderList ;


  DriverApp({Key key, @required this.orderList}) : super(key: key);

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
      home: new MyHomePage(orderList: orderList,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<Widget>orderList;
  MyHomePage({Key key, @required this.orderList}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState(orderList: orderList);
}


class _MyHomePageState extends State<MyHomePage> {

  Future removePref() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('phone', "");
    print('removed');
    return exit(0);

  }

  final List<Widget>orderList ;
  _MyHomePageState({Key key, @required this.orderList});


  Map<String, Order> orders = new Map<String, Order>();


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
//                  Padding(
//                    padding: const EdgeInsets.only(left: 48.0,right: 48.0,top: 12.0,bottom: 12.0),
//                    child: new RaisedButton(onPressed:(){
//                      removePref();
//                    },
//                      color: Colors.lightGreen,
//                      textColor: Colors.grey[200],
//                      child: const Text('تسجيل خروج'),
//                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
//
//                    ),
//                  ),
                  new Column(
                    children: ol,
                  )

                ],
              )
          )
          ),
          color: Colors.blueGrey[800],
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
        ),
      ),
    );
  }

  @override
  void initState() {
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
    ImportOrders import = new ImportOrders();
    import.getOrderDataFromFireStore();

    super.initState();

  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
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
              () =>
          new Order(
              cartype: document['cartype'],
              phone: document['phone'],
              firstDestination: document['firstDestination'],
              price: document['price'].toString(),
              secondDestination: document['secondDestination'],
              state: document['state'],
              tripdate: document['tipdate'],
              triptime: document['triptime'],
              triptype: document['triptype'],
              user: document['user']
          ));
    });

    orders = eventsHashMap;
    print('orders loaded');
    //clear not matched orders
    var toRemove = [];
    orders.forEach((k,v){
      switch(v.cartype){
        case 'car1':
          print('filtering');
          if(car1Pref == 'false'){
            toRemove.add(k);
          }
          break;
        case 'car2':
          if(car2Pref == 'false'){
            toRemove.add(k);
print("entered");
          }
          break;
        case 'car3':
          if(car3Pref == 'false'){
            toRemove.add(k);
          }
          break;
        case 'car4':
          if(car4Pref == 'false'){
            toRemove.add(k);
          }
          break;
        case 'car5':
          if(car5Pref == 'false'){
            toRemove.add(k);
          print('entered2');
          }
          break;
      }
    });
    orders.removeWhere((k,v) => toRemove.contains(k));
print('end filter');
    //put orders in the list
    orders.forEach((k,v){
      print('adding element');
      ol.add(Padding(
        padding: const EdgeInsets.all(36.0),
        child: new Card(
          color: Colors.grey[700],
          shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          margin: EdgeInsets.all(4.0),
          child: Column(
            children: <Widget>[
              orderDest(v),
              new Text("يوم ${v.tripdate} الساعة ${v.triptime}",textAlign: TextAlign.center,style: new TextStyle(color: Colors.lightGreen),textDirection: TextDirection.rtl,),
              new Text("نوع السيارة المطلوب : ${returnCar(v.cartype)}",textAlign: TextAlign.center,style: new TextStyle(color: Colors.lightGreen),textDirection: TextDirection.rtl,),
              Padding(
                padding: const EdgeInsets.only(left: 48.0,right: 48.0,top: 12.0,bottom: 12.0),
                child: new RaisedButton(onPressed:(){

                },
                  color: Colors.lightGreen,
                  textColor: Colors.grey[200],
                  child: const Text('قبول الطلب'),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

                ),
              ),
            ],
          ),
        ),
      ));
    });
  }
}


