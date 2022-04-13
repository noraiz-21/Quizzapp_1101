import 'package:quiz_app/constructor.dart';

class AllQuestion {
  int _QuestionNum = 0;

  List<Question> _questionlist = [
    Question('Is Imran khan prime Minister of Pakistan?', false),
    Question('Is Shabaz sharif is prime Minister of Pakistan?', true),
    Question('china is against pakistan?', false),
    Question('K2  is in Pakistan?', true),
    Question('USA invade in afghnistan ?', true),
    Question('2*2 is 4 ? ', true),
    Question(' palistine is a free country ?', false),
    Question('Work From home is a remote working style ?', true),
    Question(' I love you ?', false),
    Question('We are living in a new world order ?', true),
    Question('Moon has its own light ? ', false),
    Question('you reached to second last question ?', true),
    Question('This is a shit quiz ? ', true),
  ];

  // This will give us the text of the question from the questionlist
  String getquestion() {
    return _questionlist[_QuestionNum].questiontext;
  }

  // This will check the answer for that question and
  //compare with the list and answer in the list
  bool correctanswer() {
    return _questionlist[_QuestionNum].answer;
  }

  void nextquestion() {
    if (_QuestionNum < _questionlist.length - 1) ;
    _QuestionNum++;
  }

  void reset() {
    _QuestionNum = 0;
  }

  bool quizend() {
    if (_QuestionNum >= _questionlist.length)
      return true;
    else
      return false;
  }
}
