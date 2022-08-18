import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //This widget is the root of your application.
  @override
  widget build(BuildContext context){
    return MaterialApp(
      title: 'LAB2',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'LAB 2_Keo-Bua-Bao'),
    );
  }
}

class _MyHomePageState extends StatelessWidget {
  MyHomePage({Key key,this.title}): super(key:key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int mayra;
  int input;
  bool button1 = false;
  bool button2 = false;
  bool button3 = false;
  TextEditingController txtMayRa = new TextEditingController();
  TextEditingController txtKetQua = new TextEditingController();

  void XuLyMayRa() {
    setState(() {
      var rng = new Random();
      mayra = rng.nextInt(3);
      if (mayra == 0) {
        txtMayRa.text = "Keo";
      } else if (mayra == 1) {
        txtMayRa.text = "Bua";
      } else {
        txtMayRa.text = "Bao";
      }
      int kq = input - mayra;
      if (kq == 0)
        txtKetQua.text = "Hoa";
      else if (kq == 1 || kq == -2)
        txtKetQua.text = "Ban Thang";
      else
        txtKetQua.text = "Ban Thua";
    });
  }
  @override
  widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.yellow,
              child: Center(
               child: Text(
                "Bua - Keo - Bao",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                child:Center(
                  child: Text(
                    "Ban ra gi?",
                    style: TextStyle(fontSize: 20, color:Colors.black),
                  ),
                ),
             ),
            Padding(
              padding: EdgeInsets.fromLTRB(48, 5, 0, 0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        onPressed:() {
                          setState(() {
                            button1 = true;
                            button2 = false;
                            button3 = false;
                            input = 0;
                            XuLyMayRa();
                          });
                        },
                      color: button2 ? Colors.red : Colors.blue,
                      child: Text ("Bua"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        onPressed: (){
                          setState(() {
                            button1 = false;
                            button2 = true ;
                            button3 = false ;
                            input = 1;
                            XuLyMayRa()
                          });
                        }
                        color: button2 ? Colors.red: Colors.blue,
                        child: Text("Bua"),
                        ),
                  )
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: (){
                        setState(() {
                          button1 = false;
                          button2 = false;
                          button3 = true ;
                          input = 2;
                          XuLyMayRa()
                        });
                      }
                      color: button3 ? Colors.red: Colors.blue,
                      child: Text("Bao"),
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0 ),
              child: Center(
                child: TextField(
                  controller: txtMayRa,
                    enabled: false,
                  style: TextStyle(fontSize: 20,color: Colors.black),
                  decoration: InputDecoration(labelText: 'May ra: '),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 240),
             child: Center(
               child: TextField(
                 controller: txtKetQua,
                 enabled: false,
                 style: TextStyle(fontSize: 20,color: Colors.black),
                 decoration: ,
               )
             )

            )
          ],

        )
      ),
    )
  }
}