import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:math';

class ResultPage extends StatelessWidget {
  ResultPage({required this.score});
  final String score;
  int com_score = Random().nextInt(25);
  var col = Colors.white;

  String WinLose() {
    if (int.parse(score) > com_score) {
      col = Colors.green;
      return "YOU WIN!";
    }
    else if (int.parse(score) == com_score){
      col = Colors.blue;
      return "DRAW!";
    }
    else{
      col = Colors.red;
      return "YOU LOSE!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 10,),
          Text(WinLose(), textAlign: TextAlign.center,style: TextStyle(fontSize: 50, color: col, fontWeight: FontWeight.bold, fontFamily: "Sarabun"),),
          Text("You scored: $score",textAlign: TextAlign.center,style: TextStyle(fontSize: 30, fontFamily: "Sarabun")),
          Text("The Computer Scored: $com_score",textAlign: TextAlign.center,style: TextStyle(fontSize: 30, fontFamily: "Sarabun"),),
          Image(
            image: NetworkImage("https://ichef.bbci.co.uk/news/976/cpsprodpb/C17B/production/_126313594_gettyimages-1217576289.jpg"),
            height: 488,
            width: 275,
          ),
          GestureDetector(
            onTap: () {
              //TODO 3: ใช้ Navigator.push เพื่อไปยัง FirstScreen() โดยไม่ต้องส่งค่าใดๆไปด้วย
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstScreen()),
              );
            },
            child: Expanded(
              child: Container(
                child: const Text(
                  'Back to First Page',
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