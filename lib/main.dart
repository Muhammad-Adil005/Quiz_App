import 'package:flutter/material.dart';
import 'package:quiz_app/Questions.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question("Life is about making an impact, not making an income.", true),
    Question("Strive not to be a success, but rather to be of value", false),
    Question(" Life is about making an impact, not making an income.", true),
    Question(" Life is about making an impact, not making an income.", false),
    Question(" Reality: A wolf threatened. They don't understand.", true),
    Question(" Life is about making an impact, not making an income.", false),
    Question(" Life is about making an impact, not making an income.", true),
    Question("Strive not to be a success, but rather to be of value.", true),
    Question("You miss 100% of the shots you don’t take.", false),
    Question("Every strike brings me closer to the next home run.", false),
    Question(
        "Definiteness of purpose is the starting point of all achievement.",
        true),
    Question(" We become what we think about. ", false),
    Question(" The most common way people give up their power.", true),
    Question("An unexamined life is not worth living. –Socrates.", false),
    Question("Eighty percent of success is showing up.", false),
    Question("Winning isn’t everything, but wanting to win is.", true),
    Question("Winning isn’t everything, but wanting to win is", true),
    Question(" Life is about making an impact, not making an income.", false),
    Question(" Life is about making an impact, not making an income.", true),
    Question(" Life is about making an impact, not making an income.", false),
    Question("Winning isn’t everything, but wanting to win is", false),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Center(child: Text("True Citizen")),
          backgroundColor: Colors.blueGrey,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.comment),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ), //IconButton
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Setting Icon',
              onPressed: () {},
            ), //IconButton
          ], //<Widget>[]
          elevation: 50.0,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Menu Icon',
            onPressed: () {},
          ),
        ),
        body: Builder(
          builder: (BuildContext context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "images/flag.png",
                    width: 250,
                    height: 180,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.blueGrey.shade100,
                          style: BorderStyle.solid),
                    ),
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child:
                          Text(questionBank[_currentQuestionIndex].questionText,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: () => _CheckAnswer(true, context),
                      color: Colors.blueGrey.shade900,
                      child:
                          Text("TRUE", style: TextStyle(color: Colors.white)),
                    ),
                    RaisedButton(
                      onPressed: () => _CheckAnswer(false, context),
                      color: Colors.blueGrey.shade900,
                      child:
                          Text("FALSE", style: TextStyle(color: Colors.white)),
                    ),
                    RaisedButton(
                      onPressed: () => _nextQuestion(),
                      color: Colors.blueGrey.shade900,
                      child: Icon(Icons.arrow_forward, color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _CheckAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackbar = SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 500),
        content: Text("Correct"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
      print("Correct");
    } else {
      print("incorrect");
      final snackbar = SnackBar(
        backgroundColor: Colors.redAccent,
        duration: Duration(milliseconds: 500),
        content: Text("incorrect"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }
}
