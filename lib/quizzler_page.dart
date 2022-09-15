import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'result_page.dart';
import 'dart:math';

QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  //TODO : ตัวอย่างการสร้าง constructor ในภาษา dart
  //โดยในที่นี้กำหนดให้ เมื่อมีการเรียกใช้ Quizzler จะต้องมีการส่งค่า name มาให้ด้วย
  //เช่น Quizzler(name: myController.text) ในไฟล์ main.dart
  Quizzler({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Tap the button!!! $name', textAlign: TextAlign.center,),
          backgroundColor: Colors.blueGrey,
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String leftCard ="D1";
  String rightCard = "D4";
  var allCardTypes = ["S","D","H","C"];
  var allCardValues = ["1","2","3","4","5","6","7","8","9","10","J","Q","K"];
  String leftRandomType = "S";
  String leftRandomValue = "D";
  String rightRandomType = "1";
  String rightRandomValue = "2";
  int DisplayNumber = 0;
  int PlayerScore = 0;
  String comment = quizBrain.Comments();

  void RandomCard() {
    setState(() {
      PlayerScore = 0;
      leftRandomType = allCardTypes[Random().nextInt(4)];
      leftRandomValue = allCardValues[Random().nextInt(13)];
      rightRandomType = allCardTypes[Random().nextInt(4)];
      rightRandomValue = allCardValues[Random().nextInt(13)];
      leftCard = leftRandomType+leftRandomValue;
      rightCard = rightRandomType+rightRandomValue;
      if (leftRandomValue == "K" || leftRandomValue == "Q" || leftRandomValue == "J"){
        PlayerScore = PlayerScore + Random().nextInt(20);
      }
      else{
        PlayerScore = PlayerScore + int.parse(leftRandomValue);
      }
      if (rightRandomValue == "K" || rightRandomValue == "Q" || rightRandomValue == "J") {
        PlayerScore = PlayerScore + Random().nextInt(20);
      }
      else{
        PlayerScore = PlayerScore + int.parse(rightRandomValue);
      }

    });
  }
  void ChanceOfEnding(){
    var end = Random().nextInt(15);
    if (end == 2){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(score: PlayerScore.toString())));
    }
  }


  List<Icon> scoreKeeper = [];
  void AddDots(){
    scoreKeeper.add(const Icon(Icons.circle, color: Colors.blue));
  }

  int totalScore = 0;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 40,),
          Text("Roll until you are satisfied.", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          SizedBox(height: 40,),
          SizedBox(
            height: 30,
            width: 200,
            child: ElevatedButton(
                onPressed: (){
                  RandomCard();
                  AddDots();
                  ChanceOfEnding();
                }, child: Text("Change!!", style: TextStyle(fontSize: 20),), ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image(image: AssetImage("images/$leftCard.png"), height: 400, width: 275),
            Image(image: AssetImage("images/$rightCard.png"), height: 400, width: 275),
          ],),
          SizedBox(height: 10),
          Text("You current score is \n $PlayerScore", style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
          Text(comment, style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),textAlign: TextAlign.center,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text(
                'TO THE RESULTS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(score: PlayerScore.toString())));
              },
            ),
          ),
         Text("Number of Turns", style: TextStyle(fontSize: 20),),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
