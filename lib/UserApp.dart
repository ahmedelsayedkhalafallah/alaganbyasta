import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:mailer2/mailer.dart';


SharedPreferences sharedPreferences;


class UserApp extends StatelessWidget {





  UserApp({Key key}) : super(key: key);

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

end(){
  return exit(0);
}
   removePref() {
     sharedPreferences.setString('phone', "");
     print(sharedPreferences.getString('phone'));
     print("done again");
  }

  String  firstDestination,secondDestination = "المنيا",cartype = "car1",tripType,tripDate,tripTime;
  firstDistInit(){
    if(RadioSelected == 0){
      firstDestination = "from";
    }
    else{
      firstDestination = "to";
    }
  }
  tripTypeInit(){
    if(Radio2Selected == 0){
      tripType = "oneway";
    }
    else{
      tripType = "twoway";
    }
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
  //Price
  int price = 350;
  List<int> priceList = new List<int>();

  // initializing date and time pickers
  DateTime TodayDate = new DateTime.now();
  TimeOfDay TodayTime = new TimeOfDay.now();

  Future<Null> selectDate(BuildContext context) async{

    final DateTime Picker = await showDatePicker(
        context: context,
        initialDate: TodayDate,
        firstDate: TodayDate,
        lastDate: new DateTime(2021),
    );
    if (Picker != null && Picker != TodayDate){
      print('${TodayDate.toString()}  تاريخ الرحلة : ');
      setState(() {
        TodayDate = Picker;
      });
    }
  }

  Future<Null> selectTime(BuildContext context) async{

    final TimeOfDay Picker = await showTimePicker(
      context: context,
      initialTime: TodayTime,
    );
    if (Picker != null && Picker != TodayTime){
      print('${TodayTime.toString()}  وقت الرحلة : ');
      setState(() {
        TodayTime = Picker;
      });
    }
  }
//================================================

  //Radio initiation
  int RadioSelected = 0;

  void onChange_Radio(int value){
    setState(() {
      RadioSelected = value;
    });
  }

  //==================================

  //Radio 2 initiation
  int Radio2Selected = 0;

  void onChange_Radio2(int value){
    setState(() {
      Radio2Selected = value;
    });
    if(Radio2Selected == 1 && Drop_value != 'القاهرة'&& Drop_value != 'المطار'){
      price *=2;
    }
    else{
      price = priceList[DropDownValues.indexOf(Drop_value)];
    }
  }

  //==================================

  //DropDown Initiation
  String Drop_value = null;
  List<String> DropDownValues = new List<String>();
  void onChange_Drop(String value){
    setState(() {
      Drop_value = value;
    });
    price = priceList[DropDownValues.indexOf(value)];
    secondDestination = value;
  }

  //==================================
//DropDown Initiation
  String Drop_value2 = null;
  List<String> DropDownValues2 = new List<String>();
  void onChange_Drop2(String value){
    setState(() {
      Drop_value2 = value;
    });
    switch(Drop_value2){
      case 'سوزوكي':
        cartype ='car1';
        break;
      case 'ملاكي':
        cartype ='car2';
        break;
      case 'أفانصة':
        cartype ='car3';
        break;
      case 'ميكروباص':
        cartype ='car4';
        break;
      case 'أتوبيس':
        cartype ='car5';
        break;

    }
  }
  //===================================




  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      print("done");
      setState(() {});
    });

    DropDownValues.addAll(["المنيا","مغاغة","بنى مزار","القاهرة","المطار","بنى مزار فرح","مغاغة فرح"]);
    Drop_value = DropDownValues.elementAt(0);

    DropDownValues2.addAll(["سوزوكي","ملاكي","أفانصة","ميكروباص","أتوبيس"]);
    Drop_value2 = DropDownValues2.elementAt(0);
  }


  @override
  Widget build(BuildContext context) {
    //price initialization
    priceList.addAll([350,40,50,850,850,350,350]);
    //================================
    //radio buttons list
    List<Widget> RadioList = new List<Widget>();

    RadioList.add(new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('إلى آبا',style: new TextStyle(color: Colors.lightGreen),),
        Radio(value: 1, groupValue: RadioSelected, onChanged: (int value){onChange_Radio(value);}),
      ],
    ));

    RadioList.add(new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('من آبا',style: new TextStyle(color: Colors.lightGreen),),
        Radio(value: 0, groupValue: RadioSelected, onChanged: (int value){onChange_Radio(value);}),
      ],
    ));
    //==========================================

    // radio 2 buttons list
    List<Widget> Radio2List = new List<Widget>();

    Radio2List.add(new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('ذهاب وعودة',style: new TextStyle(color: Colors.lightGreen),),
        Radio(value: 1, groupValue: Radio2Selected, onChanged: (int value){onChange_Radio2(value);}),
      ],
    ));

    Radio2List.add(new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('ذهاب فقط',style: new TextStyle(color: Colors.lightGreen),),
        Radio(value: 0, groupValue: Radio2Selected, onChanged: (int value){onChange_Radio2(value);}),
      ],
    ));

    //==========================================
    return new Scaffold(
      appBar: new AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
                      child: Text('من فضلك قم باختيار الاتجاه',textAlign: TextAlign.center,style: new TextStyle(color: Colors.lightGreen),),
                    ),
                    //=============================================
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: RadioList,
                      ),
                    ),
                    //=============================================
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
                      child: Text('من فضلك قم باختيار الوجهة',textAlign: TextAlign.center,style: new TextStyle(color: Colors.lightGreen),),
                    ),
                    //=============================================


                          Padding(
                            padding: const EdgeInsets.only(left: 110.0,right: 110.0,top: 12.0,bottom: 12.0),
                            child: new DropdownButton(iconSize: 12.0,style:TextStyle(color: Colors.lightGreen,) ,value:Drop_value,
                              items: DropDownValues.map((String value){
                            return new DropdownMenuItem(
                                value: value,
                                child: Row(

                                  children: <Widget>[
                                    new Text('$value'),
                                  ],
                                ));
                      }).toList(),
                              onChanged: (String value){onChange_Drop(value);}),
                          ),


                    //=============================================
                    Padding(
                      padding: const EdgeInsets.only(left: 110.0,right: 110.0,top: 12.0,bottom: 12.0),
                      child: new DropdownButton(iconSize: 12.0,style:TextStyle(color: Colors.lightGreen,) ,value:Drop_value2,
                          items: DropDownValues2.map((String value){
                            return new DropdownMenuItem(
                                value: value,
                                child: Row(

                                  children: <Widget>[
                                    new Text('$value'),
                                  ],
                                ));
                          }).toList(),
                          onChanged: (String value){onChange_Drop2(value);}),
                    ),
                    //=============================================

                    Padding(
                      padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: Radio2List,
                      ),
                    ),

                    //=============================================


                    Padding(
                      padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
                      child: Text('${TodayDate.toString().substring(0,10)}  تاريخ الرحلة : ' , textAlign: TextAlign.center,style: new TextStyle(color: Colors.lightGreen),textDirection: TextDirection.rtl,),
                    ),

                    //=============================================
                    Padding(
                      padding: const EdgeInsets.only(left: 48.0,right: 48.0,top: 12.0,bottom: 12.0),
                      child: new RaisedButton(onPressed:(){selectDate(context);},
                        color: Colors.lightGreen,
                        textColor: Colors.grey[200],
                        child: const Text('اختيار تاريخ الرحلة'),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

                      ),
                    ),

                    //==========================================
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
                      child: Text('${TodayTime.toString().substring(10,15)}  وقت الرحلة : ', textAlign: TextAlign.center,style: new TextStyle(color: Colors.lightGreen),textDirection: TextDirection.rtl,),
                    ),
                    //==========================================
                    Padding(
                      padding: const EdgeInsets.only(left: 48.0,right: 48.0,top: 12.0,bottom: 12.0),
                      child: new RaisedButton(onPressed:(){selectTime(context);},
                        color: Colors.lightGreen,
                        textColor: Colors.grey[200],
                        child: const Text('اختيار وقت الرحلة'),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

                      ),
                    ),

                    //========================================

//                    Padding(
//                      padding: const EdgeInsets.only(top: 12.0,bottom: 12.0),
//                      child: Text('  جنيه$price  سعر الرحلة : ', textAlign: TextAlign.center,style: new TextStyle(color: Colors.lightGreen),textDirection: TextDirection.rtl,),
//                    ),
                    //========================================
                    Padding(
                      padding: const EdgeInsets.only(left: 48.0,right: 48.0,top: 12.0,bottom: 12.0),
                      child: new RaisedButton(onPressed:(){
                        sendOrder();
                      },
                        color: Colors.lightGreen,
                        textColor: Colors.grey[200],
                        child: const Text('حجز'),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

                      ),
                    ),

                    //========================================
                    Padding(
                      padding: const EdgeInsets.only(left: 48.0,right: 48.0,top: 12.0,bottom: 12.0),
                      child: new RaisedButton(onPressed:(){
                        removePref();
                        ShowDialogue("لقد قمت بتسجيل الخروج بنجاح قم باغلاق التطبيق", context);
                      },
                        color: Colors.lightGreen,
                        textColor: Colors.grey[200],
                        child: const Text('تسجيل خروج'),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 48.0,right: 48.0,top: 12.0,bottom: 12.0),
                      child: new RaisedButton(onPressed:(){
                        end();
                      },
                        color: Colors.lightGreen,
                        textColor: Colors.grey[200],
                        child: const Text('إغلاق التطبيق'),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

                      ),
                    ),

                  ],





              )
          )
          ),
          color: Colors.blueGrey[800],
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
        ),
      ),
    )
    ;
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

  Future sendOrder() async{

    String userName, userPhone;
    firstDistInit();
    tripTypeInit();
    SharedPreferences pref = await SharedPreferences.getInstance();
    userPhone = pref.getString("phone");
    userName = pref.getString("name");
    print("${pref.getString("phone")}");
if(secondDestination == null){
  secondDestination = "المنيا";
}
    if(cartype == null){
      cartype = "car1";
    }
    tripDate = TodayDate.toString().substring(0,10);
    tripTime = TodayTime.toString().substring(10,15);
    Firestore.instance.collection("OrderList").document(userPhone).setData({
      'firstDestination':firstDestination,
      'secondDestination':secondDestination,
      'triptype' : tripType,
      'triptime' : tripTime,
      'price' : price,
      'user' : userName,
      'phone' : userPhone,
      'state' : 'binding',
      'cartype' : cartype,
      'tripdate' : tripDate
    }).whenComplete((){
//      Firestore.instance.collection("UserList").document(userPhone).setData({
//        'ordered': 'true'
//      });
      ShowDialogue("تم تسجيل طلبكم وسيتم التواصل معك قريباً", context);
    });
    var options = new GmailSmtpOptions()
      ..username = 'Adelbasuny558@gmail.com'
      ..password = '01228746950'; // Note: if you have Google's "app specific passwords" enabled,
    // you need to use one of those here.

    // How you use and store passwords is up to you. Beware of storing passwords in plain.

    // Create our email transport.
    var mmm = new SmtpTransport(options);

    // Create our mail/envelope.
    var envelope = new Envelope()
      ..from = 'Adelbasuny558@gmail.com'
      ..recipients.add('Hassanbasuny245@gmail.com')
      ..subject = ' مشوار من '+
          ((firstDestination == 'from')? ' آبا ':secondDestination)+' إلى '+
          ((firstDestination == 'to')? secondDestination:'آبا')+
    ' يوم '+tripDate+'الساعة '+tripTime
      ..text = 'مشوار من '+
          ((firstDestination == 'from')? ' آبا ':secondDestination)+' إلى '+
          ((firstDestination == 'from')? secondDestination:'آبا')+
          ' يوم '+tripDate+' الساعة '+tripTime +'\n'+'صاحب الطلب : '+userName+'\nرقم تليفون صاحب الطلب: '+userPhone+'\nسعر الرحلة : '+price.toString()+'\n'
    +'نوع السيارة المطلوب :'+ returnCar(cartype);

    // Email it.
    mmm.send(envelope)
        .then((envelope) => print('Email sent!'))
        .catchError((e) => print('Error occurred: $e'));

  }
}

