import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Divisions with Carry',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Divisions with Carry'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  int data = 0;
  int carry = 0;
  void calculator() {
    setState(() { //setState rebuild widget evry time that i call it 
      int a = int.parse(myController1.text);
      int b = int.parse(myController2.text);
      data = (a ~/ b);
      carry = (a - (data * b));
      log(data.toString());
      log(carry.toString());
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              controller: myController1,
              decoration: new InputDecoration(labelText: "numero"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
            ),
            new TextField(
              controller: myController2,
              decoration: new InputDecoration(labelText: "divisore"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
            ),
            RaisedButton(
              onPressed: calculator,
              child: Text('RUN'),
            ),
            Text(
              "Result: " + '$data',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Carry:" + '$carry',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
