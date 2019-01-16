import 'package:flutter/material.dart';
import 'UserRegister.dart';
import 'DriverRegister.dart';

class OrderBinding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      debugShowCheckedModeBanner: false,
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