import 'package:flutter/material.dart';
import 'UserRegister.dart';
import 'DriverRegister.dart';

class RegisterChoice extends StatelessWidget {
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
      appBar: new AppBar(title: new Row(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(Icons.directions_car,color: Colors.lightGreen,),

        ],
      ),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: new Center(
        child: new Container(
          child: new Center(
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(bottom: 24.0,left: 24.0, right: 24.0),
                child: new RaisedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>DriverRegister())
                  );
                },
                  color: Colors.lightGreen,
                  textColor: Colors.grey[200],
                  child: const Text('سائق'),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

          ),
              ),

          //==========================================
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: new RaisedButton(onPressed:  (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>UserRegister())
              );
            },
              color: Colors.lightGreen,
              textColor: Colors.grey[200],
              child: const Text('مستخدم'),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

            ),
          ),
                  ]
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