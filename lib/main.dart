import 'package:flutter/material.dart';
import 'package:quiz_app/Allquestion.dart';

void main() => runApp(MyApp());

AllQuestion brain = new AllQuestion();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: mainpage(),
    );
  }
}

class mainpage extends StatefulWidget {
  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  List<Widget> scorekeeper = [];

  void checkanswer(bool userpickeranswer) {
    bool Questanswer = brain.correctanswer();

    setState(() {
      if (brain.quizend() == true) {
        // question number is set to 0 again
        brain.reset();
        scorekeeper.clear();
        // scoreKeeper = [];
      } else {
        if (userpickeranswer == Questanswer) {
          scorekeeper.add(Icon(
            Icons.check_box,
            size: 20,
            color: Colors.green,
          ));
        } else {
          scorekeeper.add(Icon(
            Icons.close,
            size: 20,
            color: Colors.red,
          ));
        }
      }
      brain.nextquestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          title: Text(' Quiz TIme '),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(15.0),
                // color: Colors.grey,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Center(
                          child: Text(
                            brain.getquestion(),
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                color: Color.fromARGB(255, 0, 0, 0),
                onPressed: () {
                  checkanswer(true);
                },
                child: Text(
                  'TRUE',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: FlatButton(
                height: 20.0,
                // width: 10.0,
                color: Color.fromARGB(255, 255, 255, 255),
                onPressed: () {
                  checkanswer(false);
                },
                child: Text(
                  'FALSE',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Row(
              children: scorekeeper,
            )
          ],
        ),
      ),
    );
  }
}
