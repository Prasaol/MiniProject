import 'question.dart';
import 'dart:math';
class QuizBrain {

  String Comments()
  {
    var comment_bank = ["Satisfied?", "GG_EZ", "Quit?",
    "More?", "STOP!!!!!"];
    int chances = Random().nextInt(10);
    int temp = Random().nextInt(5);
    if (chances < 6) {
      return comment_bank[temp];
    }
    else {
      return "....................";
    }
  }

}