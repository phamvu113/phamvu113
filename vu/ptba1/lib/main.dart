import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  //This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        title: 'Lab 1',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("LAB 1"),
          ),
          body: Center(
            child: MyHomePage(),
          ),
        ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage>{
  TextEditingController heSoAController = new TextEditingController();
  TextEditingController heSoBController = new TextEditingController();
  TextEditingController ketQuaAController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
        Stack(children:<Widget>[
        Text(
          "Giai phuong trinh bac 1",
          style: TextStyle(
              fontSize: 30,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 6
                ..color = Colors.blue),
        ),
        Text("Giai phuong trinh bac 1",
            style: TextStyle(fontSize: 30, color: Colors.blue[300]))
        ]),
    Padding(
    padding:const EdgeInsets.fromLTRB(0, 0 , 0, 40),
    child: TextField(
    controller: heSoAController,
    style: TextStyle(fontSize:18, color: Colors.black),
    decoration: InputDecoration(
    labelText: "He so a",
    labelStyle: TextStyle(color: Colors.grey,fontSize: 15),
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
    child: TextField(
    controller: heSoBController,
    style: TextStyle(fontSize: 18,color: Colors.black),
    decoration: InputDecoration(
    labelText: "He so b",
    labelStyle: TextStyle(color: Colors.grey,fontSize: 15),
    ),
    ),
    ),
    Padding(
    padding:const EdgeInsets.fromLTRB(0, 0, 0, 40),
    child: SizedBox(
    width: double.infinity,
    height:56,
    child:RaisedButton(
    onPressed: timNghiemX,
    color : Colors.blue,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    child: Text(
    "Tim Nghiem X",
    style: TextStyle(color: Colors.white,fontSize: 18),
    ),
    ),
    )),
    Padding(
    padding:const EdgeInsets.fromLTRB(0, 0, 0, 40),
    child: SizedBox(
    width: double.infinity,
    height: 56,
    child: TextField(
    controller: ketQuaAController,
    style: TextStyle(fontSize: 20,color: Colors.black),
    enabled:false,
    decoration: InputDecoration(
    labelText: "Kết quả",
    labelStyle: TextStyle(color: Colors.grey,fontSize: 15),
    ),
    ),
    )),
    ]
    ,
    )
    ,
    );
  }
  void timNghiemX(){
    setState(() {
      if (double.parse(heSoAController.text) == 0 &&
          double.parse(heSoBController.text) == 0) {
        ketQuaAController.text = "Phuong trinh co so nghiem";
      }
      if (double.parse(heSoAController.text) == 0 &&
          double.parse(heSoBController.text) < 0 ||
          double.parse(heSoBController.text) > 0) {
        ketQuaAController.text = "phuong trinh vo nghiem";
      }
      if (double.parse(heSoAController.text) < 0 ||
          double.parse(heSoAController.text) > 0) {
        ketQuaAController.text = (-(double.parse(heSoBController.text) /
            double.parse(heSoAController.text))).toString();
      }
    } );
  }
  }

