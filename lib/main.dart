import 'package:flutter/material.dart';
import 'quizzler_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: FirstScreen(),
    ),
  );
}

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  //เริ่มต้นกำหนดค่าสำหรับ textField
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  //โดยถ้าต้องการอ้างถึงค่าข้อมูลใน textField นี้ สามารถอ้างถึงด้วย myController.text
  //จบการกำหนดค่าต่างๆสำหรับ textField
  String text = "How to play: \n The aim of the game is to score more points than the computer. The number of points is the sum of the card numbers. "
      "\nJack/Queen/King all have random values. You can keep rolling, but there's a 1/15 chance the game will end.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(left: 10, right: 10, top: 100),
              child: Text("Card Randoming Game", textAlign: TextAlign.center ,
                style: TextStyle(color: Colors.white,fontSize: 100, fontStyle: FontStyle.italic,fontFamily: "Sarabun"),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: myController,
                  style: TextStyle(fontSize: 40),
                  decoration: InputDecoration( hintText: "Your Name:"),
                ),
              ),
            ),
          ),
          //TODO : ศึกษาตัวอย่างการใช้ GestureDetector และ onTap -> https://docs.flutter.dev/cookbook/gestures/handling-taps
          //เริ่มต้นตัวอย่างการใช้งาน
          Padding(
              padding: EdgeInsets.all(10),
              child: Text(text, style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              //TODO : ศึกษาตัวอย่างการใช้ Navigator.push -> https://docs.flutter.dev/cookbook/navigation/navigation-basics
              Navigator.push(context, MaterialPageRoute(builder: (context) => Quizzler(name: myController.text)));
            },
            child: Expanded(
              child: Container(
                child: Text(
                  'NEXT',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.blueGrey,
                height: 50.0,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}